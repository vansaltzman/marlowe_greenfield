DROP DATABASE marlowe;

CREATE DATABASE IF NOT EXISTS marlowe;

USE marlowe;

CREATE TABLE provider (
  id INTEGER AUTO_INCREMENT NOT NULL,
  providerUsername VARCHAR(16),
  pPassword VARCHAR(16),
  PRIMARY KEY(id)
);

CREATE TABLE claimer (
  id INTEGER AUTO_INCREMENT NOT NULL,
  email VARCHAR(50) NOT NULL,
  address INTEGER NOT NULL,
  lng VARCHAR(50) NOT NULL,
  lat VARCHAR(50) NOT NULL,
  cPassword VARCHAR(16) NOT NULL,
  verified BOOLEAN,
  PRIMARY KEY (id)
);

CREATE TABLE post (
  id INTEGER AUTO_INCREMENT NOT NULL,
  title VARCHAR(100),
  poster_id INTEGER,
  description VARCHAR(255),
  address VARCHAR(50),
  lng VARCHAR(50),
  lat VARCHAR(50),
  phone VARCHAR(12),
  isClaimed BOOLEAN,
  claimer_id INTEGER,
  createdAt INTEGER,
  photoUrl VARCHAR(512),
  estimatedValue VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (poster_id) REFERENCES claimer(id),
  FOREIGN KEY (claimer_id) REFERENCES claimer(id),
  CHECK (poster_id <> claimer_id)
)
