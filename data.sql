INSERT INTO users (first_name, last_name, phone_number, email, password, profile_image)
VALUES
('Dwi', 'Setyabudi', 6281234567890, 'dwi@gmail.com', '1', 'profile1.jpg'),
('Ayu', 'Lestari', 6282234567891, 'ayu@gmail.com', '2', 'profile2.jpg'),
('Budi', 'Santoso', 6283234567892, 'budi@gmail.com', '3', 'profile3.jpg'),
('Siti', 'Rahma', 6284234567893, 'siti@gmail.com', '4', 'profile4.jpg'),
('Rama', 'Pradana', 6285234567894, 'rama@gmail.com', '5', 'profile5.jpg');

UPDATE users SET role = 'admin' WHERE id = 1;

INSERT INTO sessions (id_user, token)
VALUES
(1, 'token1'),
(2, 'token2'),
(3, 'token3'),
(4, 'token4'),
(5, 'token5');

INSERT INTO genres (genres)
VALUES
('Action'),
('Comedy'),
('Drama'),
('Sci-Fi'),
('Horror');

INSERT INTO actors (first_name, last_name)
VALUES
('Dwi', 'Setya'),
('Budi', 'Johanes'),
('Fauzi', 'Ilham'),
('Rananda', 'Iyo'),
('Adhi', 'susilo');

INSERT INTO directors (first_name, last_name)
VALUES
('Setya', 'Dwi'),
('Indah', 'Setiadi'),
('Huliyah', 'Fadhilah'),
('Firman', 'Alam'),
('Juman', 'Dika');

INSERT INTO movies (title, tagline, release_date, duration, poster_path, background_path, vote_average)
VALUES
('Inception', 'Your mind is the scene of the crime', '2010-07-16', 148, 'inception.jpg', 'bg1.jpg', 8.8),
('Avengers: Endgame', 'Part of the journey is the end', '2019-04-26', 181, 'endgame.jpg', 'bg2.jpg', 8.4),
('Interstellar', 'Mankind was born on Earth. It was never meant to die here.', '2014-11-07', 169, 'interstellar.jpg', 'bg3.jpg', 8.6),
('The Matrix', 'Welcome to the Real World', '1999-03-31', 136, 'matrix.jpg', 'bg4.jpg', 8.7),
('Titanic', 'Nothing on Earth could come between them', '1997-12-19', 195, 'titanic.jpg', 'bg5.jpg', 7.8);

INSERT INTO movies_genres (movie_id, genre_id)
VALUES
(1, 4),  -- Inception - Sci-Fi
(2, 1),  -- Endgame - Action
(3, 4),  -- Interstellar - Sci-Fi
(4, 4),  -- Matrix - Sci-Fi
(5, 3);  -- Titanic - Drama

INSERT INTO movies_actors (id_movies, id_actors)
VALUES
(1, 3), 
(2, 5), 
(3, 4), 
(4, 1), 
(5, 2); 

INSERT INTO movies_directors (id_movies, id_directors)
VALUES
(1, 2), 
(2, 2),
(3, 2), 
(4, 1), 
(5, 3); 

INSERT INTO cinemas (name, address, city, total_seats)
VALUES
('Cinepolis Galaxy', 'Jl. Raya Galaxy No.5', 'Bekasi', 150),
('XXI Plaza Indonesia', 'Jl. MH Thamrin No.1', 'Jakarta', 200),
('CGV PVJ', 'Jl. Sukajadi No.131', 'Bandung', 180),
('Cinepolis Big Mall', 'Jl. Untung Suropati', 'Samarinda', 120),
('XXI Margo City', 'Jl. Margonda Raya', 'Depok', 160);

INSERT INTO showtimes (id_cinema, show_datetime, ticket_price, available_seats)
VALUES
(1, '2025-06-20 14:00:00', 50000, 120),
(2, '2025-06-20 17:00:00', 60000, 180),
(3, '2025-06-21 19:00:00', 55000, 160),
(4, '2025-06-22 13:00:00', 50000, 100),
(5, '2025-06-22 20:00:00', 65000, 140);

INSERT INTO transactions (id_users, id_showtime, payment_method, quantity)
VALUES
(1, 1, 'Credit Card', 2),
(2, 2, 'GoPay', 3),
(3, 3, 'OVO', 1),
(4, 4, 'Cash', 2),
(5, 5, 'ShopeePay', 4);

INSERT INTO transactions_detail (id_transactions, seat_number, seat_price, status)
VALUES
(1, 'A1,A2', 100000, 'Paid'),
(2, 'B1,B2,B3', 180000, 'Paid'),
(3, 'C1', 55000, 'Paid'),
(4, 'D1,D2', 100000, 'Pending'),
(5, 'E1,E2,E3,E4', 260000, 'Paid');











