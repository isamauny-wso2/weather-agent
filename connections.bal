import ballerina/http;

final http:Client WeatherClient = check new ("https://api.openweathermap.org",
    timeout = 10
);

final http:Client SpotifyClient = check new ("https://api.spotify.com/v1",
    timeout = 10
);

final http:Client SpotifyAuthClient = check new ("https://accounts.spotify.com/api/token",
    timeout = 10
);