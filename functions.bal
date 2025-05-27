import ballerina/mime;

isolated function getSpotifyToken() returns string|error {
    string encodedCredentials = spotifyClientId + ":" + spotifyClientSecret;
    map<string> formData = {
        "grant_type": "client_credentials"
    };

    SpotifyToken tokenResponse = check SpotifyAuthClient->post("",
        formData,
        {
            [mime:CONTENT_TYPE]: mime:APPLICATION_FORM_URLENCODED,
            "Authorization": string `Basic ${encodedCredentials}`
        }
    );
    return tokenResponse.access_token;
}

isolated function searchPlaylists(string query) returns Playlist[]|error {
    string token = check getSpotifyToken();
    string path = string `/search?q=${query}&type=playlist&limit=5`;

    PlaylistSearchResponse response = check SpotifyClient->get(path,
        headers = {
            "Authorization": string `Bearer ${token}`
        }
    );
    return response.playlists.items;
}

isolated function getMusicMoodForWeather(int weatherCode) returns string {
    match weatherCode {
        1000 => {
            return "Upbeat";
        }
        1003|1006 => {
            return "Chill";
        }
        1009 => {
            return "Alternative";
        }
        1030|1135|1147 => {
            return "Ambient";
        }
        1063|1150|1153|1180|1183|1240 => {
            return "Calm";
        }
        1087|1273|1276 => {
            return "Epic";
        }
        1066|1210|1213|1216|1219|1255 => {
            return "Dreamy";
        }
        1114|1117 => {
            return "Dark";
        }
        1168|1171|1198|1201 => {
            return "Classical";
        }
        1192|1195|1243|1246 => {
            return "Melancholic";
        }
        _ => {
            return "Pop";
        }
    }
}