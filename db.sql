CREATE DATABASE IF NOT EXISTS annonceo;

USE annonceo;

CREATE TABLE `membre` (
  id_membre INT(3) NOT NULL AUTO_INCREMENT,
  pseudo VARCHAR(20) NOT NULL, 
  mdp VARCHAR(60) NOT NULL,
  nom VARCHAR(20) NOT NULL,
  prenom VARCHAR(20) NOT NULL,
  telephone VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  civilite ENUM('m','f') NOT NULL,
  statut CHAR(1) NOT NULL,
  date_enregistrement DATETIME NOT NULL,
  PRIMARY KEY (id_membre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `membre` ADD CONSTRAINT FK_Commentaire FOREIGN KEY (membre_id) REFERENCES membre(id_membre) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE `membre` ADD CONSTRAINT FK_Note FOREIGN KEY (membre_id1) REFERENCES membre(id_membre) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE `membre` ADD CONSTRAINT FK_Note FOREIGN KEY (membre_id2) REFERENCES membre(id_membre) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE `membre` ADD CONSTRAINT FK_Annonce FOREIGN KEY (categorie_id) REFERENCES membre(id_categorie) ON UPDATE RESTRICT ON DELETE RESTRICT;

CREATE TABLE `categorie` (
  id_categorie INT(3) NOT NULL AUTO_INCREMENT,
  titre VARCHAR(255) NOT NULL,
  motscles TEXT NOT NULL,
  PRIMARY KEY (id_categorie)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `categorie` ADD CONSTRAINT FK_Annonce FOREIGN KEY (membre_id) REFERENCES membre(id_membre) ON UPDATE RESTRICT ON DELETE RESTRICT;

CREATE TABLE `photo` (
  id_photo INT(3) NOT NULL AUTO_INCREMENT,
  photo1 VARCHAR(255) NOT NULL,
  photo2 VARCHAR(255) NOT NULL,
  photo3 VARCHAR(255) NOT NULL,
  photo4 VARCHAR(255) NOT NULL,
  photo5 VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_photo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `photo` ADD CONSTRAINT FK_Annonce FOREIGN KEY (photo_id) REFERENCES membre(id_photo) ON UPDATE RESTRICT ON DELETE RESTRICT;

CREATE TABLE `commentaire` (
  id_commentaire INT(3) NOT NULL AUTO_INCREMENT,
  membre_id INT(3) NOT NULL,
  annonce_id INT(3) NOT NULL,
  commentaire TEXT NOT NULL,
  date_enregistrement DATETIME NOT NULL,
  PRIMARY KEY (id_commentaire)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `commentaire` ADD CONSTRAINT FK_annonce FOREIGN KEY (commentaire_id) REFERENCES commentaire(id_commentaire) ON UPDATE RESTRICT ON DELETE RESTRICT;

CREATE TABLE `note` (
  id_note INT(3) NOT NULL AUTO_INCREMENT,
  membre_id1 INT(3) NOT NULL,
  membre_id2 INT(3) NOT NULL,
  note INT(3) NOT NULL,
  avis VARCHAR(20) NOT NULL,
  date_enregistrement DATETIME NOT NULL,
  PRIMARY KEY (id_note)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `annonce` (
  id_annonce INT(3) NOT NULL AUTO_INCREMENT,
  titre VARCHAR(255) NOT NULL,
  description_courte VARCHAR(255) NOT NULL,
  description_longue TEXT NOT NULL,
  prix DOUBLE(6,2) NOT NULL,
  photo VARCHAR(255) NOT NULL,
  pays VARCHAR(20) NOT NULL,
  adresse VARCHAR(50) NOT NULL,
  cp INT(5) UNSIGNED ZEROFILL NOT NULL,
  membre_id INT(3) NOT NULL,
  photo_id INT(3) NOT NULL,
  categorie_id INT(3) NOT NULL,
  date_enregistrement DATETIME NOT NULL,
  PRIMARY KEY (id_annonce)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;