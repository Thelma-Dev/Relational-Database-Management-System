# MusicApp-Relational-Database

# Entity Relationship
A song must belong to an album and an album can have many songs. A song is treated as a single entity even if it appears in another album. A song can have many artiste, the same song can have a collaboration with new added artistes in another album.

A user can have many playlist and a playlist can have different songs. A songs can be in many playlist. A user can only have one library, a library contains songs liked a user and it is not related to a Users Playlist. A library can have many songs.

# Queries

For a specific user,

<li>Display their playlists, number of songs, and total runtime of the playlist</li>

<li> Display their Playlists, songs in playlist, artistes, album, if the song is in their library, song duration, date the song was added to the playlist</li>
