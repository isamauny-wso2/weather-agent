type TokenResponse record {|
    string access_token;
    string token_type;
    int expires_in;
|};

type SpotifyToken record {|
    string access_token;
    string token_type;
    int expires_in;
|};

type ExternalUrls record {|
    string spotify;
|};

type Image record {|
    int? height;
    string url;
    int? width;
|};

type Owner record {|
    string display_name;
    ExternalUrls external_urls;
    string href;
    string id;
    string 'type;
    string uri;
|};

type Tracks record {|
    string href;
    int total;
|};

type Playlist record {|
    boolean collaborative;
    string description?;
    ExternalUrls external_urls;
    string href;
    string id;
    Image[] images;
    string name;
    Owner owner;
    string? primary_color;
    boolean 'public;
    string snapshot_id;
    Tracks tracks;
    string 'type;
    string uri;
|};

type PlaylistsWrapper record {|
    string href;
    int limitValue;  // Changed from 'limit' to 'limitValue' to avoid keyword conflict
    string? nextPage;  // Changed from 'next' to be more descriptive
    int offset;
    string? previousPage;  // Changed from 'previous' to be more descriptive
    int total;
    Playlist[] items;
|};

type PlaylistSearchResponse record {|
    PlaylistsWrapper playlists;
|};