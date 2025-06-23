INSERT INTO users (first_name, last_name, phone_number, role, email, password, profile_image)
VALUES
('Dwi', 'Setyabudi', 08111111111, 'user', 'dwi@gmail.com', 'pass1', 'dwi.jpg'),
('Rina', 'Wati', 08122222222, 'user', 'rina@gmail.com', 'pass2', 'rina.jpg'),
('Budi', 'Santoso', 08133333333, 'admin', 'budi@admin.com', 'pass3', 'budi.jpg'),
('Aldi', 'Gunawan', 08144444444, 'user', 'aldi@gmail.com', 'pass4', 'aldi.jpg'),
('Nina', 'Fitriani', 08155555555, 'user', 'nina@gmail.com', 'pass5', 'nina.jpg'),
('Raka', 'Putra', 08166666666, 'user', 'raka@gmail.com', 'pass6', 'raka.jpg'),
('Sita', 'Amelia', 08177777777, 'user', 'sita@gmail.com', 'pass7', 'sita.jpg'),
('Yoga', 'Pratama', 08188888888, 'user', 'yoga@gmail.com', 'pass8', 'yoga.jpg'),
('Tari', 'Fauziah', 08199999999, 'user', 'tari@gmail.com', 'pass9', 'tari.jpg'),
('Eka', 'Saputra', 08101010101, 'user', 'eka@gmail.com', 'pass10', 'eka.jpg');


INSERT INTO movies (title, tagline, release_date, duration, poster_path, background_path, vote_average)
VALUES
('Virus Escape', 'Run and survive', '2023-10-01', 90, 'poster1.jpg', 'bg1.jpg', 7.5),
('Hack World', 'Code is power', '2023-08-15', 100, 'poster2.jpg', 'bg2.jpg', 8.0),
('Into Nowhere', 'Lost in space', '2022-12-20', 120, 'poster3.jpg', 'bg3.jpg', 8.1),
('Love Byte', 'Romance of logic', '2024-02-14', 95, 'poster4.jpg', 'bg4.jpg', 7.2),
('Silent Code', 'Hidden algorithm', '2023-09-10', 105, 'poster5.jpg', 'bg5.jpg', 7.9),
('Dream Root', 'Mind game begins', '2022-06-05', 140, 'poster6.jpg', 'bg6.jpg', 8.5),
('The Loop', 'Trapped in time', '2023-01-01', 110, 'poster7.jpg', 'bg7.jpg', 7.8),
('Reset', 'Start over again', '2023-03-11', 88, 'poster8.jpg', 'bg8.jpg', 6.9),
('Firewall', 'Secure the world', '2024-05-22', 112, 'poster9.jpg', 'bg9.jpg', 7.3),
('Deep Web', 'Things unseen', '2023-07-07', 100, 'poster10.jpg', 'bg10.jpg', 7.0);

INSERT INTO genres (genres)
VALUES
('Adventure'),
('Horror'),
('Action'),
('Comedy'),
('Thriller'),
('Sci-Fi');

INSERT INTO movies_genres (id_movies, id_genres)
VALUES
(1, 1), (1, 4),
(2, 3), (2, 4),
(3, 2), (3, 4),
(4, 5), (4, 2),
(5, 6), (5, 1),
(6, 3), (6, 5),
(7, 2), (7, 1),
(8, 1), (8, 6),
(9, 6), (9, 6),
(10, 1), (10, 3);

INSERT INTO actors (first_name, last_name)
VALUES
('Setya', 'Budi'),
('Emma', 'Stenli'),
('Robert', 'Downey'),
('Familys', 'Seratus'),
('Chris', 'Evans'),
('Gal', 'Gadot'),
('Ryan', 'Bakau'),
('Zoe', 'Saldana'),
('Rahardian', 'Reza'),
('Jennifer', 'Burhan');

INSERT INTO movies_actors (id_movies, id_actors)
VALUES
(1,1),(1,2),
(2,3),(2,4),
(3,5),(3,6),
(4,7),(4,8),
(5,9),(5,10),
(6,1),(6,3),
(7,2),(7,5),
(8,4),(8,6),
(9,7),(9,9),
(10,8),(10,10);

INSERT INTO directors (first_name, last_name)
VALUES
('Steven', 'Spielberg'),
('Christopher', 'Nolan'),
('James', 'Cameron'),
('Greta', 'Gerwig'),
('Denis', 'Villeneuve'),
('Patty', 'Jenkins'),
('Taika', 'Waititi'),
('Ryan', 'Coogler'),
('Sam', 'Mendes'),
('Alfonso', 'Cuarón');

INSERT INTO movies_directors (id_movies, id_directors)
VALUES
(1,1), (2,2), (3,3), (4,4), (5,5),
(6,6), (7,7), (8,8), (9,9), (10,10);

INSERT INTO transactions (id_users, id_movies, payment_method, quantity)
VALUES
(1, 1, 'paypal', 2),
(2, 2, 'visa', 1),
(3, 3, 'google', 3),
(4, 4, 'dana', 1),
(5, 5, 'dana', 2),
(6, 6, 'paypal', 2),
(7, 7, 'dana', 1),
(8, 8, 'visa', 3),
(9, 9, 'google', 2),
(10, 10, 'dana', 1);

INSERT INTO transactions_detail (id_transactions, seat_number, seat_price, status)
VALUES
(1, 'A1', 45000, 'paid'), 
(1, 'A2', 45000, 'paid'),
(2, 'B1', 45000, 'paid'),
(3, 'C1', 45000, 'expired'), 
(3, 'C2', 45000, 'expired'), 
(3, 'C3', 45000, 'expired'),
(4, 'D1', 45000, 'paid'),
(5, 'E1', 45000, 'cancelled'), 
(5, 'E2', 45000, 'cancelled'),
(6, 'F1', 45000, 'paid'), 
(6, 'F2', 45000, 'paid'),
(7, 'G1', 45000, 'cancelled'),
(8, 'H1', 45000, 'paid'), 
(8, 'H2', 45000, 'paid'), 
(8, 'H3', 45000, 'paid'),
(9, 'I1', 45000, 'paid'), 
(9, 'I2', 45000, 'paid'),
(10, 'J1', 45000, 'cancelled');









