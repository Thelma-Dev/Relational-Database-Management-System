
CREATE TABLE Playlist(
    PlaylistId INT NOT NULL,
    Title NVARCHAR(250) NOT NULL,

    PRIMARY KEY(PlaylistId)
)

GO 

CREATE TABLE Artist(
    ArtistId INT NOT NULL,
    Name NVARCHAR(250) NOT NULL,

    PRIMARY KEY(ArtistId)
)

GO 

CREATE TABLE Library(
    LibraryId INT NOT NULL,
    LibraryName NVARCHAR(250) NOT NULL,

    PRIMARY KEY(LibraryId)
)

GO 

CREATE TABLE Album(
    AlbumId INT NOT NULL,
    AlbumTitle NVARCHAR(250) NOT NULL,
    ReleaseYear INT NOT NULL,

    PRIMARY KEY(AlbumId)
)

GO 

CREATE TABLE Song(
    SongId INT NOT NULL,
    Title NVARCHAR(250) NOT NULL,
    Duration DECIMAL(2, 2) NOT NULL,
    AlbumId INT NOT NULL,

    PRIMARY KEY(SongId),
    CONSTRAINT PK_Song_Album FOREIGN KEY(AlbumId) REFERENCES Album(AlbumId) ON DELETE CASCADE
)

GO 

CREATE TABLE SongLibrary(
    Id INT IDENTITY(1, 1) NOT NULL,
    SongId INT NOT NULL,
    LibraryId INT NOT NULL,

    PRIMARY KEY(Id),
    CONSTRAINT PK_Library_Song FOREIGN KEY(SongId) REFERENCES Song(SongId),
    CONSTRAINT PK_SongLibrary_Library FOREIGN KEY(LibraryId) REFERENCES Library(LibraryId) ON DELETE CASCADE
)

GO 

CREATE TABLE AccountUser(
    UserId INT NOT NULL, 
    UserName NVARCHAR(200) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    LibraryId INT NOT NULL,

    PRIMARY KEY(UserId), 
    CONSTRAINT PK_User_Library FOREIGN KEY(LibraryId) REFERENCES Library(LibraryId) 
)

GO

CREATE TABLE UserPlaylist(
    Id INT IDENTITY(1, 1) NOT NULL,
    UserId INT NOT NULL,
    PlaylistId INT NOT NULL,

    PRIMARY KEY(Id),
    CONSTRAINT PK_UserPlaylist_User FOREIGN KEY(UserId) REFERENCES AccountUser(UserId),
    CONSTRAINT PK_UserPlayist_Playlist FOREIGN KEY(PlaylistId) REFERENCES Playlist(PlaylistId)
)

GO 

CREATE TABLE SongArtist(
    Id INT IDENTITY(1, 1) NOT NULL,
    SongId INT NOT NULL,
    ArtistId INT NOT NULL,

    PRIMARY KEY(Id),
    CONSTRAINT PK_Artist_Song FOREIGN KEY(SongId) REFERENCES Song(SongId),
    CONSTRAINT PK_SongArtist_Artist FOREIGN KEY(ArtistId) REFERENCES Artist(ArtistId)
)

GO 

CREATE TABLE PlaylistSong(
    Id INT IDENTITY(1, 1) NOT NULL,
    PlaylistId INT NOT NULL,
    SongId INT NOT NULL,

    PRIMARY KEY(Id), 
    CONSTRAINT PK_Playlist_Song FOREIGN KEY(SongId) REFERENCES Song(SongId), 
    CONSTRAINT PK_PlaylistSong_Playlist FOREIGN KEY(PlaylistId) REFERENCES Playlist(PlaylistId) ON DELETE CASCADE
)
GO

CREATE TABLE UserPlaylistSong(
    Id INT IDENTITY(1, 1) NOT NULL,
    UserPlaylistId INT NOT NULL,
    SongId INT NOT NULL,
    DateAdded DATETIME NOT NULL,

    PRIMARY KEY(Id), 
    CONSTRAINT PK_UserPlaylist_Song FOREIGN KEY(SongId) REFERENCES Song(SongId), 
    CONSTRAINT PK_UserPlaylistSong_Playlist FOREIGN KEY(UserPlaylistId) REFERENCES UserPlaylist(Id) ON DELETE CASCADE
)
GO


