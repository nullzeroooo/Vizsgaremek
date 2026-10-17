CREATE TABLE `user` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `role_id` integer,
  `subcription_id` integer,
  `fullname` varchar(50),
  `email` varchar(255) UNIQUE,
  `password` varchar(255),
  `created_at` datetime,
  `updated_at` datetime,
  `deleted_at` datetime,
  `is_deleted` tinyint
);

CREATE TABLE `course` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `teacher_id` integer,
  `topic_id` integer,
  `content_id` integer,
  `name` varchar(255),
  `description` text,
  `bookmarked` tinyint,
  `length` int,
  `language` text,
  `price` decimal,
  `curency` enum,
  `created_at` datetime,
  `updated_at` datetime,
  `deleted_at` datetime,
  `is_deleted` tinyint
);

CREATE TABLE `role` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `role_name` varchar(255)
);

CREATE TABLE `subcription` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `is_subcribed` tinyint,
  `created_at` datetime,
  `updated_at` datetime,
  `deleted_at` datetime,
  `is_deleted` tinyint
);

CREATE TABLE `course_content` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `link` varchar(255)
);

CREATE TABLE `tag` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `names` varchar(255)
);

CREATE TABLE `tag_x_course` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `tag_id` integer,
  `course_id` integer,
  `created_at` datetime,
  `updated_at` datetime,
  `deleted_at` datetime,
  `is_deleted` tinyint
);

CREATE TABLE `topic` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `names` varchar(255)
);

CREATE TABLE `review` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `course_id` integer,
  `user_id` integer,
  `title` varchar(255),
  `description` text,
  `rate` tinyint
);

ALTER TABLE `course` ADD FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`);

ALTER TABLE `review` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `review` ADD FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

ALTER TABLE `course` ADD FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`);

ALTER TABLE `course` ADD FOREIGN KEY (`content_id`) REFERENCES `course_content` (`id`);

ALTER TABLE `tag_x_course` ADD FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

ALTER TABLE `tag_x_course` ADD FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`subcription_id`) REFERENCES `subcription` (`id`);
