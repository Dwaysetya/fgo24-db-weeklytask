## 🎬 Movie Ticket Booking App

A full-featured web application for booking movie tickets. Users can register, browse movies, select schedules, choose seats, and make payments online.

```mermaid

erDiagram

users ||--o{ session : has
users ||--o{ transactions: do
users ||--o{ transactions_detail: has
transactions ||--|| transactions_detail: generates

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
    int         phone_number
    string      email
    string      password
    string      profil_image
    timestamp   created_at
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

transactions{
    int         id                  PK
    int         id_users            FK
    int         id_movies           FK
    datetime    choose_date
    datetime    choose_time
    string      choose_locations
    string      payment_method
    string      cinema
    int         quantity
    timestamp   created_at
}

transactions_detail{
    int     id                  PK
    int     id_transactions     FK
    int     id_users            FK
    string  seats
    int     total_price
    string  status
}


```
