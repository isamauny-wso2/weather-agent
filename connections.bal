import ballerina/http;

final http:Client WeatherClient = check new (WEATHER_API_BASE_URL, 
    timeout = 60
);

final http:Client spotifyClient = check new ("https://api.spotify.com/v1", auth = {
     tokenUrl: "https://accounts.spotify.com/api/token",
     clientId: spotifyClientId,
     clientSecret: spotifyClientSecret
 });


// final http:Client spotifyClient = check new (SPOTIFY_API_BASE_URL,
//     timeout = 60
// );

final http:Client spotifyAuthClient = check new (SPOTIFY_AUTH_BASE_URL,
    timeout = 60
);