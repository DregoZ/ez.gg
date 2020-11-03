CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `login` varchar(255),
  `password` varchar(255),
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `user_data` (
  `user_id` int PRIMARY KEY,
  `display_name` varchar(255) DEFAULT null,
  `avatar_url` varchar(255) DEFAULT null,
  `email` varchar(50) DEFAULT null
);

CREATE TABLE `coleccion` (
  `user_id` int,
  `game_id` int,
  `review` varchar(1000) DEFAULT null,
  `review_likes` int DEFAULT null,
  `review_dislike` int DEFAULT null,
  `estado_id` ENUM ('deseado', 'jugando', 'terminado', 'completado', 'pospuesto', 'abandonado') DEFAULT null,
  `score_id` ENUM ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10') DEFAULT null,
  PRIMARY KEY (`user_id`, `game_id`)
);

CREATE TABLE `games` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `developer` varchar(255),
  `editor` varchar(255),
  `imagen_url` varchar(255)
);

CREATE TABLE `seguidores` (
  `follower_id` int,
  `user_id` int PRIMARY KEY
);

CREATE TABLE `listas_personales` (
  `id` int PRIMARY KEY,
  `user_id` int,
  `nombre_lista` varchar(50),
  `desc_lista` varchar(500),
  `likes` int DEFAULT 0,
  `dislikes` int DEFAULT 0
);

CREATE TABLE `contenedor_listas` (
  `lista_id` int NOT NULL,
  `game_id` int NOT NULL,
  `posicion_lista` int NOT NULL,
  `comentario` varchar(1000),
  `imagen_url` varchar(255),
  PRIMARY KEY (`lista_id`, `game_id`)
);

ALTER TABLE `seguidores` ADD FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`);

ALTER TABLE `seguidores` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `listas_personales` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `contenedor_listas` ADD FOREIGN KEY (`lista_id`) REFERENCES `listas_personales` (`id`);

ALTER TABLE `contenedor_listas` ADD FOREIGN KEY (`game_id`) REFERENCES `games` (`id`);

ALTER TABLE `contenedor_listas` ADD FOREIGN KEY (`imagen_url`) REFERENCES `games` (`imagen_url`);

ALTER TABLE `user_data` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `coleccion` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `coleccion` ADD FOREIGN KEY (`game_id`) REFERENCES `games` (`id`);

