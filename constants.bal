# Base URLs for external services
const string WEATHER_API_BASE_URL = "https://api.openweathermap.org";
const string SPOTIFY_API_BASE_URL = "https://api.spotify.com/v1";
const string SPOTIFY_AUTH_BASE_URL = "https://accounts.spotify.com";
const string AIGW_AUTH_BASE_URL = "https://apim45.apis.coach:9443";
const string AIGW_OPENAI_URL = "https://apim45.apis.coach:8243/openai/2.3.0";

# API endpoints
const string WEATHER_ENDPOINT = "/data/2.5/weather";
const string SPOTIFY_SEARCH_ENDPOINT = "/search";

# Query parameters
const string LAT_PARAM = "lat";
const string LON_PARAM = "lon";
const string APP_ID_PARAM = "appid";
const string QUERY_PARAM = "q";
const string TYPE_PARAM = "type";
const string LIMIT_PARAM = "limit";

# Weather mood mappings
const string MOOD_UPBEAT = "Upbeat";
const string MOOD_CHILL = "Chill";
const string MOOD_ALTERNATIVE = "Alternative";
const string MOOD_AMBIENT = "Ambient";
const string MOOD_CALM = "Calm";
const string MOOD_EPIC = "Epic";
const string MOOD_DREAMY = "Dreamy";
const string MOOD_DARK = "Dark";
const string MOOD_CLASSICAL = "Classical";
const string MOOD_MELANCHOLIC = "Melancholic";
const string MOOD_POP = "Pop";

# System prompts
const string AGENT_ROLE = "Music recommendations assistant";
const string AGENT_INSTRUCTIONS = "You are a friendly companion recommending playlists depending on the weather forecast in the city the user lives in. You can fetch weather data and suggest appropriate playlists based on the conditions. Use the weather id in the response to fetch spotify lists. If you receive a response state API limit reached tell the user they have reached their tokens quota. ";