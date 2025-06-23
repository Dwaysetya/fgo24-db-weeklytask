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
    id_users    INTEGER REFERENCES users(id) ON DELETE CASCADE,
    token       VARCHAR(255),
    created_at  TIMESTAMP DEFAULT now()
);

CREATE TABLE movies (
    id              SERIAL PRIMARY KEY,
    title           VARCHAR(100),
    tagline         VARCHAR(255),
    release_date    DATE,
    duration        INT CHECK (duration > 0),
    poster_path     VARCHAR(255),
    background_path VARCHAR(255),
    vote_average    DECIMAL(3,1)
);

CREATE TABLE transactions (
    id              SERIAL PRIMARY KEY,
    id_users        INTEGER REFERENCES users(id) ON DELETE CASCADE,
    id_movies       INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    payment_method  VARCHAR(100),
    quantity        INT CHECK (quantity > 0),
    created_at      TIMESTAMP DEFAULT now()
);

CREATE TYPE status_enum AS ENUM ('paid', 'cancelled', 'expired');

CREATE TABLE transactions_detail (
    id                  SERIAL PRIMARY KEY,
    id_transactions     INTEGER REFERENCES transactions(id) ON DELETE CASCADE,
    seat_number         VARCHAR(100),
    seat_price          DECIMAL(10,2),
    status              status_enum
);



CREATE TABLE genres (
    id      SERIAL PRIMARY KEY,
    genres  VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE movies_genres (
    id_movies   INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    id_genres   INTEGER REFERENCES genres(id) ON DELETE SET NULL
);

CREATE TABLE actors (
    id          SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100)
);

CREATE TABLE movies_actors (
    id_movies   INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    id_actors   INTEGER REFERENCES actors(id) ON DELETE SET NULL
);

CREATE TABLE directors (
    id          SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100)
);

CREATE TABLE movies_directors (
    id_movies       INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    id_directors    INTEGER REFERENCES directors(id) ON DELETE SET NULL
);



-- menampilkan semua transaksi
SELECT 
    u.first_name || ' ' || u.last_name AS user_name,
    m.title AS movie_title,
    t.payment_method,
    t.quantity AS quantity_ordered,
    COUNT(td.seat_number) FILTER (WHERE td.status = 'paid') AS total_paid_seats,
    STRING_AGG(td.seat_number, ', ') FILTER (WHERE td.status = 'paid') AS paid_seats,
    SUM(td.seat_price) FILTER (WHERE td.status = 'paid') AS total_paid_price,
    STRING_AGG(td.status::TEXT, ', ') AS all_seat_statuses
FROM transactions t
JOIN users u ON t.id_users = u.id
JOIN movies m ON t.id_movies = m.id
JOIN transactions_detail td ON td.id_transactions = t.id
GROUP BY t.id, u.first_name, u.last_name, m.title, t.payment_method, t.quantity
ORDER BY t.id;



--menampilkan semua movie beserta genresnya

SELECT m.title as name_movie, string_agg(g.genres,',') as name_genres
FROM movies m
JOIN movies_genres mg ON m.id = mg.id_movies
JOIN genres g ON g.id = mg.id_genres
GROUP BY m.title;

-- menampilkan nama movie beserta actornya
SELECT 
    m.title AS movie_title,
  string_agg(a.first_name || ' ' || a.last_name,',') AS actor_name
FROM movies m
JOIN movies_actors ma ON m.id = ma.id_movies
JOIN actors a ON a.id = ma.id_actors
GROUP BY m.title;


-- menampilkan nama movie beserta directornya
SELECT 
    m.title AS movie_title,
    d.first_name || ' ' || d.last_name AS director_name
FROM movies m
JOIN movies_directors md ON m.id = md.id_movies
JOIN directors d ON d.id = md.id_directors;







