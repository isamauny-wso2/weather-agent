import ballerina/log;
import ballerinax/ai;

final ai:OpenAiProvider _WeatherRecommendationModel = check new (openAIToken, ai:GPT_4O, AIGW_OPENAI_URL);
final ai:Agent _WeatherRecommendationAgent = check new (
    systemPrompt = {role: AGENT_ROLE, instructions: AGENT_INSTRUCTIONS},
    memory = new ai:MessageWindowChatMemory(200),
    model = _WeatherRecommendationModel,
    tools = [weatherforecast, getPlaylistSuggestions]
);

# A tool to retrieve weather information based on latitude and longitude
# + latitude - Latitude of the location
# + longitude - Longitude of the location
# + return - Weather information or error
@ai:AgentTool
@display {label: "Music4Weather", iconPath: "https://bcentral-packageicons.azureedge.net/images/ballerina_http_2.14.0.png"}
isolated function weatherforecast(decimal latitude = defaultLatitude, decimal longitude = defaultLongitude) returns json|error {
    string path = string `${WEATHER_ENDPOINT}?${LAT_PARAM}=${latitude}&${LON_PARAM}=${longitude}&${APP_ID_PARAM}=${weatherApiKey}`;
    json weatherInformation = check WeatherClient->get(path);
    return weatherInformation;
}

# A tool to get playlist suggestions based on weather mood 
# + weatherCode - Weather condition code 
# + return - List of recommended playlists or error 
@ai:AgentTool
isolated function getPlaylistSuggestions(int weatherCode) returns ItemsItem?[]|error {
    log:printInfo("Weather Code is: " + weatherCode.toString());
    string musicMood = getMusicMoodForWeather(weatherCode);
    log:printInfo("Mood is: " + musicMood);
    return searchPlaylists(musicMood);
}
