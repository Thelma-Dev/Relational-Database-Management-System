--- Sportify Database Creation---- CREATED BY Thelma (2023-03-01)
/* --------------------------------------*/
        --AccountUser Table
/* --------------------------------------*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountUser](
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --------------------------------------*/
        --Album Table
/* --------------------------------------*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumId] [int] NOT NULL,
	[AlbumTitle] [nvarchar](250) NOT NULL,
	[ReleaseYear] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/* --------------------------------------*/
        --Artist Table
/* --------------------------------------*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistId] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --------------------------------------*/
        --Library Table
/* --------------------------------------*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Library](
	[LibraryId] [int] NOT NULL,
	[LibraryName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LibraryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --------------------------------------*/
        --Playlist Table
/* --------------------------------------*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[PlaylistId] [int] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/* --------------------------------------*/
        --Song Table
/* --------------------------------------*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[SongId] [int] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[AlbumId] [int] NOT NULL,
	[Duration] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [PK_Song_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Album] ([AlbumId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [PK_Song_Album]
GO

/* --------------------------------------*/
        --SongArtist Table
/* --------------------------------------*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongArtist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SongId] [int] NOT NULL,
	[ArtistId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SongArtist]  WITH CHECK ADD  CONSTRAINT [FK_Artist_Song] FOREIGN KEY([SongId])
REFERENCES [dbo].[Song] ([SongId])
GO
ALTER TABLE [dbo].[SongArtist] CHECK CONSTRAINT [FK_Artist_Song]
GO
ALTER TABLE [dbo].[SongArtist]  WITH CHECK ADD  CONSTRAINT [FK_SongArtist_Artist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([ArtistId])
GO
ALTER TABLE [dbo].[SongArtist] CHECK CONSTRAINT [FK_SongArtist_Artist]
GO


/* --------------------------------------*/
        --SongLibrary Table
/* --------------------------------------*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongLibrary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SongId] [int] NOT NULL,
	[LibraryId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SongLibrary]  WITH CHECK ADD  CONSTRAINT [FK_Library_Song] FOREIGN KEY([SongId])
REFERENCES [dbo].[Song] ([SongId])
GO
ALTER TABLE [dbo].[SongLibrary] CHECK CONSTRAINT [FK_Library_Song]
GO
ALTER TABLE [dbo].[SongLibrary]  WITH CHECK ADD  CONSTRAINT [FK_SongLibrary_Library] FOREIGN KEY([LibraryId])
REFERENCES [dbo].[Library] ([LibraryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SongLibrary] CHECK CONSTRAINT [FK_SongLibrary_Library]
GO
ALTER TABLE [dbo].[SongLibrary]  WITH CHECK ADD  CONSTRAINT [FK_SongLibrary_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[AccountUser] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SongLibrary] CHECK CONSTRAINT [FK_SongLibrary_User]
GO

/* --------------------------------------*/
        --UserPlaylist Table
/* --------------------------------------*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPlaylist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PlaylistId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_UserPlaylist_Playlist] FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlist] ([PlaylistId])
GO
ALTER TABLE [dbo].[UserPlaylist] CHECK CONSTRAINT [FK_UserPlaylist_Playlist]
GO
ALTER TABLE [dbo].[UserPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_UserPlaylist_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[AccountUser] ([UserId])
GO
ALTER TABLE [dbo].[UserPlaylist] CHECK CONSTRAINT [FK_UserPlaylist_User]
GO

/* --------------------------------------*/
        --PlaylistSong Table
/* --------------------------------------*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistSong](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserPlaylistId] [int] NOT NULL,
	[SongId] [int] NOT NULL,
	[DateAdded] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PlaylistSong]  WITH CHECK ADD  CONSTRAINT [FK_Playlist_Song] FOREIGN KEY([SongId])
REFERENCES [dbo].[Song] ([SongId])
GO
ALTER TABLE [dbo].[PlaylistSong] CHECK CONSTRAINT [FK_Playlist_Song]
GO
ALTER TABLE [dbo].[PlaylistSong]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistSong_Playlist] FOREIGN KEY([UserPlaylistId])
REFERENCES [dbo].[UserPlaylist] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistSong] CHECK CONSTRAINT [FK_PlaylistSong_Playlist]
GO
