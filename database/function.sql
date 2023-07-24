CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` VARBINARY(116) NOT NULL,
  `last_name` VARBINARY(116) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT into users (first_name, last_name) VALUES (AES_ENCRYPT('Trung', 'secret'), AES_ENCRYPT('Nguyen Bao', 'secret'));
INSERT into users (first_name, last_name) VALUES (AES_ENCRYPT('Ngoc', 'secret'), AES_ENCRYPT('Pham Xuan', 'secret'));
INSERT into users (first_name, last_name) VALUES (AES_ENCRYPT('Nghia', 'secret'), AES_ENCRYPT('Nguyen Trung', 'secret'));

  

