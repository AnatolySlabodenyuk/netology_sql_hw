-- Заполняем таблицу genres
INSERT INTO genres (name)
VALUES ('Rock'),
       ('Pop'),
       ('Jazz');

-- Заполняем таблицу artists
INSERT INTO artists (name)
VALUES ('The Beatles'),
       ('Michael Jackson'),
       ('Miles Davis'),
       ('Queen');

-- Заполняем таблицу genre_artist
INSERT INTO genre_artist (genre_id, artist_id)
VALUES (1, 1), -- The Beatles - Rock
       (2, 2), -- Michael Jackson - Pop
       (3, 3), -- Miles Davis - Jazz
       (1, 4); -- Queen - Rock

-- Заполняем таблицу albums
INSERT INTO albums (title, release_year)
VALUES ('Abbey Road', '1969-09-26'),
       ('Thriller', '1982-11-30'),
       ('Kind of Blue', '1959-08-17');

-- Заполняем таблицу album_artist
INSERT INTO album_artist (album_id, artist_id)
VALUES (1, 1), -- Abbey Road - The Beatles
       (2, 2), -- Thriller - Michael Jackson
       (3, 3); -- Kind of Blue - Miles Davis

-- Заполняем таблицу tracks
INSERT INTO tracks (title, duration, album_id)
VALUES ('Come Together', 259, 1), 
       ('Something', 182, 1),     
       ('Billie Jean', 294, 2),   
       ('Beat It', 258, 2),       
       ('So What', 564, 3),       
       ('Blue in Green', 333, 3); 

-- Заполняем таблицу collections
INSERT INTO collections (title, release_year)
VALUES ('Greatest Hits 60s', '1970-01-01'),
       ('Pop Legends', '1990-05-15'),
       ('Jazz Classics', '1980-03-20'),
       ('Rock Anthems', '2000-11-10');

-- Заполняем таблицу collection_track
INSERT INTO collection_track (track_id, collection_id)
VALUES (1, 1), -- Come Together в Greatest Hits 60s
       (2, 1), -- Something в Greatest Hits 60s
       (3, 2), -- Billie Jean в Pop Legends
       (4, 2), -- Beat It в Pop Legends
       (5, 3), -- So What в Jazz Classics
       (1, 4); -- Come Together в Rock Anthems