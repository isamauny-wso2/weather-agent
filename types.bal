type TokenResponse record {|
    string access_token;
    string token_type;
    int expires_in;
    string? scope;
|};

type SpotifyToken record {|
    string access_token;
    string token_type;
    int expires_in;
    string? scope;
|};

// Spotify Types
type External_urls record {|
    string spotify;
|};

type ImagesItem record {|
    string url;
    int|json|() height;
    int|json|() width;
|};

type Owner record {|
    External_urls external_urls;
    string href;
    string id;
    string 'type;
    string uri;
    string display_name;
|};

type Tracks record {|
    string href;
    int total;
|};

type ItemsItem record {|
    boolean collaborative;
    string description;
    External_urls external_urls;
    string href;
    string id;
    ImagesItem[] images;
    string name;
    Owner owner;
    boolean 'public;
    string snapshot_id;
    Tracks tracks;
    string 'type;
    string uri;
    json primary_color;
|};

type Playlists record {
    string href;
    int 'limit;
    string next;
    int offset;
    string? previous;
    int total;
    ItemsItem?[] items;
};

type SpotifyPlayList record {|
    Playlists playlists;
|};

type PlaylistInfo record {|
    string name;
    string url;
    string artist;
|};

type MusicSuggestion record {|
    string location;
    string weather;
    string musicMood;
    PlaylistInfo[] playlist;
|};
