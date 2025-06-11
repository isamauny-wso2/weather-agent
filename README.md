# Weather-Based Music Recommendation Agent

An AI-powered music recommendation system that suggests Spotify playlists based on weather conditions. The system integrates OpenAI for intelligent recommendations, OpenWeatherMap API for weather data, and Spotify API for music playlists.

## Features

- Weather-based music mood mapping
- Spotify playlist recommendations
- AI-powered conversation interface
- Configurable default location settings
- OAuth2 authentication for API access

## Prerequisites

- Ballerina Swan Lake 2201.8.4 or later
- OpenAI API access
- Spotify Developer account and credentials
- OpenWeatherMap API key

## Configuration

Create a `Config.toml` file in the root directory with the following configurations:

```toml
weatherApiKey = "<your-weather-api-key>"
defaultLatitude = 0.0
defaultLongitude = 0.0
spotifyClientId = "<your-spotify-client-id>"
spotifyClientSecret = "<your-spotify-client-secret>"
openAIClientId = "<your-openai-client-id>"
openAIClientSecret = "<your-openai-client-secret>"
sonnetKey = "<your-sonnet-key>"
OpenAIKey = "<your-openai-key>"
```

## Project Structure

- `agents.bal` - AI agent and tool definitions
- `config.bal` - Configuration variables
- `connections.bal` - API client configurations
- `constants.bal` - System constants and endpoints
- `functions.bal` - Core functionality implementations
- `main.bal` - Service definition and entry point
- `types.bal` - Data type definitions

## Weather-Music Mood Mappings

The system maps weather conditions to music moods:
- Clear sky (800, 1000) → Upbeat
- Partly cloudy (801, 803, 805) → Classical
- Rainy conditions → Calm/Melancholic
- Stormy weather → Epic/Dark
- And more...

## API Endpoints

### Weather Recommendation Service

```
POST /WeatherRecommendation/chat
```

Accepts chat messages and returns AI-powered music recommendations based on weather conditions.

## Running the Project

1. Configure the necessary API keys in `Config.toml`
2. Start the service:
   ```bash
   bal run
   ```

## Error Handling

The system includes comprehensive error handling for:
- API authentication failures
- Weather data retrieval issues
- Spotify API rate limits
- Invalid location coordinates

## Dependencies

- ballerina/http
- ballerina/log
- ballerinax/ai
- ballerina/mime

## License

[Add your license information here]