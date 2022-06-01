--Query 1 (all entries in Genre table)
SELECT
    Id,
    Name
FROM Genre;

/* OR */

SELECT
    *
FROM Genre;

--Query 2 (all entries in Artist table, ordered by artist's name)
SELECT
    Id,
    ArtistName,
    YearEstablished
FROM Artist
ORDER BY ArtistName;

--Query 3 (all songs in Song table, include Artist name)
SELECT
    Title,
    ArtistName
FROM Song
INNER JOIN Artist
ON Song.ArtistId = Artist.Id;

--Query 4 (all Artists that have a Soul Album)
SELECT
    ArtistName,
    Title,
    GenreId
FROM Album
INNER JOIN Artist
ON Album.ArtistId = Artist.Id
WHERE GenreId = 1;

--Query 5 (all Artists that have a Jazz or Rock Album)
SELECT
    ArtistName
FROM Artist
INNER JOIN Album
ON Artist.Id = Album.ArtistId
WHERE Album.GenreId = 2 OR Album.GenreId = 4;

--Query 6 (Albums with no songs)
SELECT 
Album.Title
FROM Album
LEFT JOIN Song
ON Song.AlbumId = Album.Id
WHERE Song.Id is NULL;

--Query 7 (add one of your favorite artists to the Artist table)
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Jenny Lewis', 1998);

--Query 8 (add album(s) by your artist to the Album table)
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Acid Tongue', '09/20/2008', 4724, 'Warner Bros', 28, 2);

--Query 9 (add songs that are on that album to the Song table)
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Acid Tongue', 234, '09/20/2008', 2, 28, 23);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Pretty Bird', 346, '09/20/2008', 2, 28, 23);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('See Fernando', 333, '09/20/2008', 2, 28, 23);


--Query 10 (list song titles, album title, and artist name for all of the data you just entered in)
SELECT
    Song.Title,
    Album.Title,
    Artist.ArtistName
FROM Song
LEFT JOIN Album
ON Song.AlbumId = Album.Id
LEFT JOIN Artist
ON Song.ArtistId = Artist.Id
WHERE Artist.Id = 28 or Album.Id = 23;

--Query 11 (display how many songs exist for each album)
SELECT
    AlbumId,
    COUNT(Song.Title) AS NumSongsByAlbum
From Song
GROUP BY Song.AlbumId;

--Query 12 (display how many songs exist for each artist)
SELECT
    ArtistId,
    COUNT(Song.Title) AS NumSongsByArtist
From Song
GROUP BY Song.ArtistId;

/* Query 13 (display how many songs exist for each genre) */
SELECT
    GenreId, 
    COUNT(Song.Id) AS NumSongsByGenre
From Song
GROUP BY Song.GenreId;

--Query 14 (list the Artists that have put out records on more than one record label)
SELECT
    ar.ArtistName
FROM Album al
LEFT JOIN Artist ar
ON ar.Id = al.ArtistId
GROUP BY ar.ArtistName
HAVING COUNT(al.Label) > 1;

--Query 15 (find the album with the longest duration)
SELECT TOP 1
    Title,
    AlbumLength
FROM Album
ORDER BY AlbumLength DESC;

--Query 16 (find the song with the longest duration)
SELECT TOP 1
    Title,
    SongLength
FROM Song
ORDER BY SongLength DESC;

--Query 17 Modify the previous query to also display the title of the album.
SELECT TOP 1
    s.Title,
    al.Title,
    s.SongLength
FROM Song s
LEFT JOIN Album al
ON s.AlbumId = al.Id
ORDER BY s.SongLength DESC;