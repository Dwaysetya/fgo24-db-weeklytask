CREATE TABLE users (
    id          SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100),
    no_hp       BIGINT,
    email       VARCHAR(100) NOT NULL UNIQUE,
    password    VARCHAR(100) NOT NULL,
    created_at  TIMESTAMP DEFAULT now(),
    images      VARCHAR(255)
);

CREATE TABLE session (
    id          SERIAL PRIMARY KEY,
    id_user     INTEGER REFERENCES users(id) ON DELETE CASCADE,
    token       VARCHAR(255),
    created_at  TIMESTAMP DEFAULT now()
);

CREATE TABLE genres (
    id      SERIAL PRIMARY KEY,
    genres  VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE actors (
    id          SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100),
);

CREATE TABLE directors (
    id          SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100)
);

CREATE TABLE movies (
    id              SERIAL PRIMARY KEY,
    id_directors    INTEGER REFERENCES directors(id) ON DELETE SET NULL,
    id_actors       INTEGER REFERENCES actors(id) ON DELETE SET NULL,
    id_genres       INTEGER REFERENCES genres(id) ON DELETE SET NULL,
    title           VARCHAR(100),
    tagline         VARCHAR(200),
    release_date    DATE,
    duration        INT CHECK (duration > 0)
    poster_path     VARCHAR(255),
    background_path VARCHAR(255),
    vote_average    DECIMAL(3,1)
);

CREATE TABLE movies_genres (
    id_movies      INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    id_genres      INTEGER REFERENCES genres(id) ON DELETE CASCADE
);

CREATE TABLE movies_actors (
    id_movies       INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    id_actors       INTEGER REFERENCES actors(id) ON DELETE CASCADE
);

CREATE TABLE movies_directors (
    id_movies       INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    id_directors    INTEGER REFERENCES directors(id) ON DELETE CASCADE
);

CREATE TABLE book_tikets (
    id              SERIAL PRIMARY KEY,
    id_users        REFERENCES users(id),
    choose_date     DATE TIME,
    choose_time     DATE TIME,
    choose_location DATE TIME,
    payment_method  
    cinema          VARCHAR(100),
    seats           VARCHAR(500),
    quantity        INT,
    book_at         TIMESTAMP
);

CREATE TABLE transactions (
    id          SERIAL PRIMARY KEY,
    id_users    REFERENCES users(id),
    id_booking  REFERENCES book_tikets(id),
    id_movies   REFERENCES movies(id),
    total_price int,
    status      VARCHAR(100)
);