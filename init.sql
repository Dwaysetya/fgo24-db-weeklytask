CREATE TABLE users (
    id              SERIAL PRIMARY KEY,
    first_name      VARCHAR(100),
    last_name       VARCHAR(100),
    phone_number    BIGINT,
    role            VARCHAR(50),
    email           VARCHAR(100) NOT NULL UNIQUE,
    password        VARCHAR(100) NOT NULL,
    profile_image   VARCHAR(255),
    created_at      TIMESTAMP DEFAULT now()
);

CREATE TABLE sessions (
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
    last_name   VARCHAR(100)
);

CREATE TABLE directors (
    id          SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100)
);

CREATE TABLE movies (
    id              SERIAL PRIMARY KEY,
    title           VARCHAR(100),
    tagline         VARCHAR(200),
    release_date    DATE,
    duration        INT CHECK (duration > 0),
    poster_path     VARCHAR(255),
    background_path VARCHAR(255),
    vote_average    DECIMAL(3,1)
);

CREATE TABLE movies_genres (
    id_movies      INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    id_genres      INTEGER REFERENCES genres(id) ON DELETE SET NULL
);

CREATE TABLE movies_actors (
    id_movies       INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    id_actors       INTEGER REFERENCES actors(id) ON DELETE SET NULL
);

CREATE TABLE movies_directors (
    id_movies       INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    id_directors    INTEGER REFERENCES directors(id) ON DELETE SET NULL
);

CREATE TABLE cinemas (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(150),
    address     TEXT,
    city        VARCHAR(100),
    total_seats INT CHECK (total_seats > 0),
    created_at  TIMESTAMP DEFAULT NOW()
);

CREATE TABLE showtimes (
    id              SERIAL PRIMARY KEY,
    id_movie        INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    id_cinema       INTEGER REFERENCES cinemas(id) ON DELETE CASCADE,
    show_datetime   TIMESTAMP NOT NULL,
    ticket_price    DECIMAL(10, 2),
    available_seats INT,
    created_at      TIMESTAMP DEFAULT NOW()
);

CREATE TABLE transactions (
    id              SERIAL PRIMARY KEY,
    id_users        INTEGER REFERENCES users(id) ON DELETE CASCADE,
    id_showtime     INTEGER REFERENCES showtimes(id) ON DELETE CASCADE,
    payment_method  VARCHAR(100),
    quantity        INT,
    created_at      TIMESTAMP
);

CREATE TABLE transactions_detail (
    id              SERIAL PRIMARY KEY,
    id_transactions INTEGER REFERENCES transactions(id) ON DELETE CASCADE,
    seat_number           VARCHAR(500),
    seat_price     DECIMAL(10,2),
    status          VARCHAR(100)
);