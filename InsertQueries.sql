
INSERT INTO Artist(ArtistId, Name) VALUES(101, 'Rihanna'),
(104, 'Beyonce'),
(105, 'Bazzi'),
(103, 'Shatta Wale'),
(102, 'Mr Eazi'),
(106, 'Major Lazer'),
(109, 'Wizkid'),
(110, 'Saint JHN'),
(107, 'Ric Hassani'),
(108, 'Drake'),
(120, 'Tems'),
(112, 'Fave'),
(113, 'Ella Mai'),
(115, 'Adele'),
(130, 'Justin Bieber'), (135, 'Chloe Bailey'), (128, 'Chike')

GO

INSERT INTO Playlist(PlaylistId, Title) VALUES(1, 'Heart Break Song'),
(2, 'Best of 2016'),
(3, 'You Only Live Once (YOLO)'),
(5, 'Feelings and Other Stupid Things'),
(4, 'Five Star Songs'),
(6, 'Unfiltered and Unapologetic')

GO 
INSERT INTO Album(AlbumId, AlbumTitle, ReleaseYear) VALUES(2, 'Anti', '2016'),
(3, 'The Prince I Became', '2021' ),
(1, 'The Lion King: The Gift', '2019' ),
(4, 'Cosmic', '2018' ),
(5, 'Riddim 5', '2022' ),
(7, 'For Broken Ears', '2020' ),
(6, 'Made in Lagos', '2020' ),
(8, 'Lemonade', '2016' ),
(9, '21', '2011' ),
( 10, 'The prince I Became(Deleuxe Version)', 2021),
( 12, 'Made in Lagos(Deleuxe Version)', 2021),
(11, 'Explicit', 2022)

GO

INSERT INTO Library(LibraryId, LibraryName) VALUES(203, 'Jungle Beats'),
(202, 'Dragon Lord'),
(204, 'Sunshine')

GO 

INSERT INTO Song(SongId, Title, AlbumId, Duration) VALUES(1, 'Someone Like You', 9, 285),
(3, 'Mr Man', 5, 165),
(4, 'Work', 2, 219),
(15, 'Beautiful', 4, 178),
(6, 'Korede', 3, 229),
(7, 'Hold Up', 8, 221),
(9, 'Free Mind', 7, 248),
(10, 'Essence', 6, 248),
(8, 'Piece of Me', 6, 197),
(11, 'Baby Riddim', 5, 191),
(12, 'Brown Skin Girl', 1, 249),
(13, 'Already', 1, 223),
(14, 'Love on the Brain', 2, 224),
(5, 'Mine', 4, 131),
(2, 'Rolling in the Deep', 9, 228),
(16, 'Damages', 7, 170),
(17, 'Everything', 3, 250),
(18, 'Sorry', 8, 233),
(20, 'Everything', 10, 247),
(19, 'Love on the Brain', 11, 211),
(21, 'Essence', 12, 263)

GO

INSERT INTO SongArtist(SongId, ArtistId) VALUES(3, 112),
(4, 101),
(4, 108),
(1, 115),
(5, 105),
(8, 109),
(8, 113),
(2, 115),
(10, 109),
(10, 120), 
(6, 107),
(9, 120), 
(7, 104),
(15, 105),
(18, 104), 
(11, 112), 
(12, 104),
(12, 109), 
(12, 110),
(14, 101), 
(16, 120),
(13, 103),
(17, 107),
(13, 106),
(13, 104), (20, 128),(21, 120), (19, 135), (20, 107), (21, 130), (21, 109)

GO
INSERT INTO SongLibrary(SongId, LibraryId, UserId) VALUES(7, 204, 1003),
(13, 202, 1001),
(4, 204, 1003),
(18, 202, 1001),
(11, 203, 1024),
(14, 204, 1003),
(13, 203, 1024),
(10, 202, 1001),
(9, 204, 1003),
(18, 204, 103),
(10, 203, 1024), 
(12, 203, 1024)

GO 
INSERT INTO AccountUser(UserId, UserName, Email) VALUES(1001, 'Dafodill24', 'freda65@gmail.com'),
(1003, 'Deola_x', 'adeola2@icloud.com'),
(1024, 'Lieon', 'kenneth@hotmail.com')

GO 
INSERT INTO UserPlaylist(UserId, PlaylistId) VALUES(1003, 2),
(1024, 4),
(1001, 1),
(1003, 6),
(1024, 3),
(1001, 5),
(1003, 5),
(1003, 1),
(1024, 6)

GO 
INSERT INTO UserPlaylistSong(UserPlaylistId, SongId, DateAdded) VALUES(8, 1, '2022-12-15 8:24:10'),
(8, 18, '2023-02-14 9:55:12'),
(2, 10, '2023-01-21 9:50:14'),
(2, 12, '2023-01-15 7:45:00'),
(5, 9, '2022-10-18 16:24:16'),
(5, 3, '2022-05-14 18:50:11'),
(5, 7, '2022-04-09 16:40:00'),
(4, 15, '2023-01-15 12:15:12'),
(4, 7, '2022-02-20 11:13:08'),
(7, 6, '2022-03-17 20:15:19'),
(7, 3, '2022-09-25 10:21:05'),
(9, 12, '2023-02-16 18:35:38'),
(6, 18, '2022-08-21 20:25:18'),
(6, 21, '2022-09-18 8:30:00'),
(4, 20, '2023-02-18 9:31:05')

GO