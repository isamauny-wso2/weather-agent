type SpotifyToken record {
    string access_token;
    string token_type;
    int expires_in;
};

type Playlist record {
    string id;
    string name;
    string description?;
    string uri;
};

type PlaylistSearchResponse record {
    PlaylistsWrapper playlists;
};

type PlaylistsWrapper record {
    Playlist[] items;
};
