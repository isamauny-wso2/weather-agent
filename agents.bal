import ballerinax/ai;

final ai:OpenAiProvider _WeatherRecommendationModel = check new (OpenAIKey, ai:GPT_4O_MINI);
final ai:Agent _WeatherRecommendationAgent = check new (
    systemPrompt = {role: "Music recommendations assistant", instructions: string `You are a friendly companion recommending playlists depending on the weather forecast in the city the user lives in. You can fetch weather data and suggest appropriate playlists based on the conditions.`},
    memory = new ai:MessageWindowChatMemory(200),
    model = _WeatherRecommendationModel,
    tools = [weatherforecast, getPlaylistSuggestions]
);

# A tool to retrieve weather information based on latitude and longitude
# + latitude - Latitude of the location
# + longitude - Longitude of the location
# + return - Weather information or error
@ai:AgentTool
@display {label: "", iconPath: "https://bcentral-packageicons.azureedge.net/images/ballerina_http_2.14.0.png"}
isolated function weatherforecast(decimal latitude = defaultLatitude, decimal longitude = defaultLongitude) returns json|error {
    string path = string `/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${weatherApiKey}`;
    json weatherInformation = check WeatherClient->get(path);
    return weatherInformation;
}

# A tool to get playlist suggestions based on weather mood
# + weatherCode - Weather condition code
# + return - List of recommended playlists or error
@ai:AgentTool
isolated function getPlaylistSuggestions(int weatherCode) returns Playlist[]|error {
    string musicMood = getMusicMoodForWeather(weatherCode);
    return searchPlaylists(musicMood);
}
