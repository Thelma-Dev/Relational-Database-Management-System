DECLARE @AccountUserId AS INT
SET @AccountUserId = 1024
PRINT @AccountUserId

DECLARE @Playlist AS NVARCHAR(200)
SET @Playlist = '%(YOLO)'
PRINT @Playlist

-- UserName
SELECT AccountUser.UserName FROM AccountUser
WHERE AccountUser.UserId = @AccountUserId

-- Users Playlist
SELECT AccountUser.UserName, Playlist.Title FROM AccountUser
INNER JOIN UserPlaylist ON UserPlaylist.UserId= AccountUser.UserId
INNER JOIN Playlist ON UserPlaylist.PlaylistId = Playlist.PlaylistId
WHERE AccountUser.UserId = @AccountUserId
GROUP BY AccountUser.UserName, Playlist.Title

---Specific User Playlist

SELECT Playlist.Title AS Playlist, COUNT(Song.Title) AS NumberOfSongs, SUM(Song.Duration) AS TotalRuntime FROM Playlist
INNER JOIN UserPlaylist ON UserPlaylist.PlaylistId = Playlist.PlaylistId
INNER JOIN PlaylistSong ON UserPlaylist.Id = PlaylistSong.UserPlaylistId
INNER JOIN Song ON Song.SongId = PlaylistSong.SongId
WHERE UserPlaylist.UserId = @AccountUserId AND Playlist.Title LIKE @Playlist
GROUP BY Playlist.Title


--Users, Playlist, songs, album, duration, data added

SELECT Playlist.Title AS Playlist, Song.Title AS Song, Artist.Name AS Artist, Album.AlbumTitle AS Album,
       IIF(Song.SongId IN (SELECT Song.SongId FROM Song
       INNER JOIN SongLibrary ON SongLibrary.SongId = Song.SongId
       INNER JOIN AccountUser ON AccountUser.UserId = SongLibrary.UserId
       WHERE AccountUser.UserId = @AccountUserId), 'Yes', 'No') AS InLibrary,
       RIGHT(CONVERT(CHAR(8),DATEADD(second,Song.Duration, 0),108),5) AS Duration,
       CASE 
            WHEN DATEDIFF(Day, PlaylistSong.DateAdded, GETDATE()) > 31 
                THEN CONCAT(DATEDIFF(Month, PlaylistSong.DateAdded, GETDATE()), ' months ago' )
            WHEN DATEDIFF(Day, PlaylistSong.DateAdded, GETDATE()) BETWEEN 30 AND 31
                THEN CONCAT(DATEDIFF(Month, PlaylistSong.DateAdded, GETDATE()), ' month ago' )
            WHEN DATEDIFF(Day, PlaylistSong.DateAdded, GETDATE()) = 1 
                THEN CONCAT(DATEDIFF(Day, PlaylistSong.DateAdded, GETDATE()), ' day ago' )
            WHEN DATEDIFF(Day, PlaylistSong.DateAdded, GETDATE()) < 1 
                THEN CONCAT(DATEDIFF(Hour, PlaylistSong.DateAdded, GETDATE()), ' hours ago' )
            ELSE CONCAT(DATEDIFF(Day, PlaylistSong.DateAdded, GETDATE()), ' days ago' ) 
            END AS  DateAdded
FROM Artist
INNER JOIN SongArtist ON SongArtist.ArtistId = Artist.ArtistId 
INNER JOIN Song ON Song.SongId = SongArtist.SongId
INNER JOIN (SELECT Album.AlbumId, Album.AlbumTitle FROM Song INNER JOIN Album ON Album.AlbumId = Song.AlbumId) AS Album ON Album.AlbumId = Song.AlbumId
INNER JOIN PlaylistSong ON Song.SongId = PlaylistSong.SongId
INNER JOIN UserPlaylist ON PlaylistSong.UserPlaylistId = UserPlaylist.Id
INNER JOIN Playlist ON UserPlaylist.PlaylistId = Playlist.PlaylistId
WHERE UserPlaylist.UserId = @AccountUserId 
GROUP BY UserPlaylist.UserId, Playlist.Title,Song.SongId, Song.Title, Artist.Name, 
         Album.AlbumTitle, Song.Duration,PlaylistSong.DateAdded
