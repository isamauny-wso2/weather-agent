import ballerina/http;
import ballerina/log;
import ballerina/mime;

# Get OAuth2 token using client credentials grant type
# + tokenEndpoint - The token endpoint base URL
# + context - URL context , such as /api/token
# + clientId - Client ID
# + clientSecret - Client Secret
# + return - Access token string or error
isolated function getOAuth2Token(string tokenEndpoint, string context, string clientId, string clientSecret) returns string|error {
    final http:Client tokenClient = check new (tokenEndpoint,
        timeout = 60
    );

    // Prepare Basic Auth header (standard for client credentials)
    string credentials = clientId + ":" + clientSecret;
    string encodedCredentials = credentials.toBytes().toBase64();

    // Form request 
    http:Request request = new;
    // Set form data
    request.setTextPayload("grant_type=client_credentials");
    // Set headers
    request.setHeader("Authorization", "Basic " + encodedCredentials);
    request.setHeader("Content-Type", mime:APPLICATION_FORM_URLENCODED);
    request.setHeader("Accept", mime:APPLICATION_JSON);

    TokenResponse|http:ClientError tokenResponse;
    do {
        log:printInfo("Calling OAuth Endpoint");
        tokenResponse = tokenClient->post(context,
        request
        );
    }
    if tokenResponse is TokenResponse {
        log:printInfo("Token Received: " + tokenResponse.access_token.substring(0, 10));
        return tokenResponse.access_token;
    } else {
        // Bubble up error to calling level
        return tokenResponse;
    }

}

isolated function getAIGWToken() returns string {
    string|error token = getOAuth2Token(AIGW_AUTH_BASE_URL, "/oauth2/token", openAIClientId, openAIClientSecret);

    // Trick so that I can use this function straight for the AI Agent editor
    if (token is string) {
        return token;
    }
    else {
        return "TOKEN_ERROR";
    }
}

// isolated function getSpotifyToken() returns string|error {
//     log:printInfo("Retrieving Spotify token");
//     return getOAuth2Token(SPOTIFY_AUTH_BASE_URL, "/api/token", spotifyClientId, spotifyClientSecret);
// }

isolated function searchPlaylists(string query) returns ItemsItem?[]|error {
    //string token = check getSpotifyToken();
    //log:printInfo("Using Spotify Token: " + token);
    string path = string `${SPOTIFY_SEARCH_ENDPOINT}?q=${query}&type=playlist&limit=3`;

    // check spotifyClient->get(string `/search?q=${musicMood}&type=playlist`);

    SpotifyPlayList|http:ClientError response = spotifyClient->get(path);

    if (response is SpotifyPlayList) {
        log:printDebug("Number of items: " + response.playlists.items.length().toString());
        return response.playlists.items;
    }
    else {
        log:printDebug("Error occurred connecting to Spotify");
        log:printDebug(response.toString());
        return response;
    }
}

isolated function getMusicMoodForWeather(int weatherCode) returns string {
    log:printInfo("Retrieving mood...");
    match weatherCode {
        800|1000 => {
            return MOOD_UPBEAT;
        }
        1003|1006 => {
            return MOOD_CHILL;
        }
        1009 => {
            return MOOD_ALTERNATIVE;
        }
        1030|1135|1147 => {
            return MOOD_AMBIENT;
        }
        1063|1150|1153|1180|1183|1240 => {
            return MOOD_CALM;
        }
        1087|1273|1276 => {
            return MOOD_EPIC;
        }
        1066|1210|1213|1216|1219|1255 => {
            return MOOD_DREAMY;
        }
        1114|1117 => {
            return MOOD_DARK;
        }
        1168|1171|1198|1201 => {
            return MOOD_CLASSICAL;
        }
        1192|1195|1243|1246 => {
            return MOOD_MELANCHOLIC;
        }
        801|803|805 => {
            return MOOD_CLASSICAL;
        }
        _ => {
            return MOOD_POP;
        }
    }
}
