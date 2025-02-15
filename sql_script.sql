-- таблица с жанрами
CREATE TABLE IF NOT EXISTS genres
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

-- таблица с артисами
CREATE TABLE IF NOT EXISTS artists
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

-- таблица со связями жанр/артист
CREATE TABLE IF NOT EXISTS genre_artist
(
    genre_id  INT REFERENCES genres (id),
    artist_id INT REFERENCES artists (id),
    PRIMARY KEY (genre_id, artist_id) -- составной первичный ключ
);


-- таблица с альбомами
CREATE TABLE IF NOT EXISTS albums
(
    id           SERIAL PRIMARY KEY,
    title        VARCHAR(60) NOT NULL,
    release_year DATE        NOT NULL
);

-- таблица со связями альбом/артист
CREATE TABLE IF NOT EXISTS album_artist
(
    album_id  INT REFERENCES albums (id),
    artist_id INT REFERENCES artists (id),
    PRIMARY KEY (album_id, artist_id) -- составной первичный ключ
);


-- таблица с треками
CREATE TABLE IF NOT EXISTS tracks
(
    id       SERIAL PRIMARY KEY,
    title    VARCHAR(60) NOT NULL,
    duration INT         NOT NULL,
    album_id INT         NOT NULL REFERENCES albums (id)
);

-- таблица со сборниками
CREATE TABLE IF NOT EXISTS collections
(
    id           SERIAL PRIMARY KEY,
    title        VARCHAR(60) NOT NULL,
    release_year DATE        NOT NULL
);

-- таблица со связями трек/сборник
CREATE TABLE IF NOT EXISTS collection_track
(
    track_id      INT REFERENCES tracks (id),
    collection_id INT REFERENCES collections (id),
    PRIMARY KEY (track_id, collection_id) -- составной первичный ключ
)