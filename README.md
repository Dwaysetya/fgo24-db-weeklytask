## 🎬 Movie Ticket Booking App

A full-featured web application for booking movie tickets. Users can register, browse movies, select schedules, choose seats, and make payments online.

```mermaid

erDiagram
direction LR
users ||--o{ session : has
users ||--o{ book_tikets: do
users ||--o{ transactions: has
book_tikets ||--|| transactions: has

movies ||--o{genres : has
movies ||--o{actors : have
movies ||--||directors : have
transactions ||--||movies : for

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
    int         id_directors    FK
    int         id_actors       FK
    int         id_genres       FK
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

actors {
    int     id          PK
    string  first_name
    string  last_name
    string  gender
}

directors {
    int     id          PK
    string  first_name
    string  last_name
}

book_tikets{
    int         id                  PK
    int         id_users            FK
    datetime    choose_date
    datetime    choose_time
    datetime    choose_locations
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
