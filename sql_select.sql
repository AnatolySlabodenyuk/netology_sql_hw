--Задание 2
-- Название и продолжительность самого длительного трека
SELECT title, duration
FROM tracks
ORDER BY duration DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT title, duration
FROM tracks
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title
FROM collections
WHERE EXTRACT(YEAR FROM release_year) BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT *
FROM artists
WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
-- 1
-- Известный способ
SELECT *
FROM tracks
-- my
WHERE title ILIKE 'my %' /* слово в начале строки */
   OR title ILIKE '% my' /* слово в конце строки */
   OR title ILIKE '% my %' /* слово в середине строки */
   OR title ILIKE 'my' /* название трека состоит из одного искомого слова */
-- мой
   OR title ILIKE 'мой %' /* слово в начале строки */
   OR title ILIKE '% мой' /* слово в конце строки */
   OR title ILIKE '% мой %' /* слово в середине строки */
   OR title ILIKE 'мой' /* название трека состоит из одного искомого слова */
-- 2
-- Использование string_to_array
SELECT *
FROM tracks
WHERE string_to_array(LOWER(tracks.title), ' ') && ARRAY ['мой', 'my'];
-- 3
-- Использование ~*
SELECT *
FROM tracks
WHERE tracks.title ~* '\y(my|мой)\y';


-- Задание 3
-- Количество исполнителей в каждом жанре
SELECT genres.name, COUNT(genre_artist.artist_id) AS artist_count
FROM genres
         LEFT JOIN genre_artist ON genres.id = genre_artist.genre_id
GROUP BY genres.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(*) AS track_count
FROM albums
         LEFT JOIN tracks ON albums.id = tracks.album_id
WHERE EXTRACT(YEAR FROM albums.release_year) BETWEEN 2019 AND 2020

-- Средняя продолжительность треков по каждому альбому.
SELECT albums.title AS album_title, AVG(tracks.duration) AS mean_track_duration
FROM albums
         LEFT JOIN tracks ON albums.id = tracks.album_id
GROUP BY albums.id

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT name
FROM artists
WHERE id NOT IN (SELECT album_artist.artist_id
                 FROM album_artist
                          JOIN albums ON album_artist.album_id = albums.id
                 WHERE EXTRACT(YEAR FROM albums.release_year) = 2020);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT DISTINCT collections.title AS collection_title
FROM collections
         JOIN collection_track ON collections.id = collection_track.collection_id
         JOIN tracks ON collection_track.track_id = tracks.id
         JOIN albums ON tracks.album_id = albums.id
         JOIN album_artist ON albums.id = album_artist.album_id
         JOIN artists ON album_artist.artist_id = artists.id
WHERE artists.name = 'The Beatles';

