## 🎬 Movie Ticket Booking App

A full-featured web application for booking movie tickets. Users can register, browse movies, select schedules, choose seats, and make payments online.

```mermaid

erDiagram
direction LR

users ||--o{ session : has
users ||--o{ book_tikets: do
users ||--o{ transactions: has
book_tikets ||--|| transactions: generates

transactions }o--|| movies : includes

movies ||--o{ movies_genres : has
genres ||--o{ movies_genres : has

movies ||--o{movies_actors : has
actors ||--o{movies_actors : has

movies ||--o{movies_directors : has
directors ||--o{movies_directors : has


users{
    int         id           PK
    string      first_name
    string      last_name
    int         no_hp
    string      email
    string      password
    timestamp   created_at
    string      images
}

session {
    int         id          PK
    int         id_users    FK
    string      token
    timestamp   created_at
}

movies {
    int         id              PK
    string      title
    string      tagline
    string      release_date
    int         duration
    string      poster_path
    string      background_path
    decimal     vote_average
}

genres {
    int     id      PK
    string  genres
}

movies_genres{
    int     id_movies   FK
    int     id_genres   FK
}

actors {
    int     id          PK
    string  first_name
    string  last_name
}

movies_actors{
    int     id_movies   FK
    int     id_actors   FK
}

directors {
    int     id          PK
    string  first_name
    string  last_name
}

movies_directors {
    int     id_movies       FK
    int     id_directors    FK
}

book_tikets{
    int         id                  PK
    int         id_users            FK
    datetime    choose_date
    datetime    choose_time
    datetime    choose_locations
    string      payment_method
    string      cinema
    string      seats
    int         quantity
    timestamp   book_at
}

transactions{
    int     id                  PK
    int     id_users            FK
    int     id_book_tikets      FK
    int     id_movies           FK
    int     total_price
    string  status
}


```
