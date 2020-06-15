export const initialState = {
  client: {
    requesting: false,
    successful: false,
    admin: false,
    reset: false,
    notifications: { message: "test" }
  },
  user: {
    profile: {
      id: 7,
      firstName: "test",
      lastName: "user",
      username: "testuser",
      email: "testuser@email.com"
    },
    requesting: false,
    successful: false,
    notifications: {
      body: null,
      message: "test",
      code: 404,
      display: true
    }
  },
  movies: {
    results: [],
    list: {},
    cast: [],
    ratedList: {},
    searchList: {},
    requesting: false,
    successful: false,
    notifications: {},
    query: { type: "multi", page: 1, tag: "movie/popular" },
    filter: "all"
  },
  playlists: {
    active: null,
    lists: [],
    playlistMovieIds: { "none": [] },
    playlistMovies: {},
    requesting: false,
    successful: false,
    notifications: {}
  }
};

export const playlistsSuccess = {
  beforeState: {
    active: null,
    lists: [{ id: 63, user_id: 2, name: "Matt's Playlist", active: false }],
    playlistMovieIds: { none: [] },
    playlistMovies: {},
    requesting: true,
    successful: false,
    notifications: {}
  },
  action: type => ({
    type: type,
    responseJson: [
      { id: 63, user_id: 2, name: "Matt's Playlist", active: false },
      { id: 25, user_id: 2, name: "G. Cooper", active: false },
      { id: 3, user_id: 2, name: "Watchlist", active: false }
    ]
  }),
  afterState: {
    active: null,
    lists: [
      { id: 63, user_id: 2, name: "Matt's Playlist", active: false },
      { id: 25, user_id: 2, name: "G. Cooper", active: false },
      { id: 3, user_id: 2, name: "Watchlist", active: false }
    ],
    playlistMovieIds: { none: [] },
    playlistMovies: {},
    requesting: false,
    successful: true,
    notifications: {}
  }
};

export const playlistSuccess = {
  beforeState: {
    active: null,
    lists: [],
    playlistMovieIds: [107, 832, 826633],
    playlistMovies: {
      63: { id: 63, user_id: 2, name: "Matt's Playlist" },
      25: { id: 25, user_id: 2, name: "G. Cooper" },
      3: { id: 3, user_id: 2, name: "Watchlist" }
    },
    requesting: true,
    successful: false,
    notifications: {}
  },
  action: type => ({
    type: type,
    responseJson: {
      movies: {
        entities: {
          movies: {
            107: { id: 107, title: "Snatch" },
            8321: { id: 8321, title: "In Bruges" },
            82633: { id: 82633, title: "Lawless" }
          },
          result: [107, 832, 826633]
        }
      }
    }
  }),
  afterState: {
    active: null,
    lists: [],
    playlistMovieIds: [107, 832, 826633],
    playlistMovies: {
      107: { id: 107, title: "Snatch" },
      8321: { id: 8321, title: "In Bruges" },
      82633: { id: 82633, title: "Lawless" }
    },
    requesting: false,
    successful: true,
    notifications: {}
  }
};
