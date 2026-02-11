-- Script de création des tables manquantes pour GestionBibliotheque
-- Exécutez ce script si vous n'avez que la table utilisateur

USE gestion_bibliotheque;

-- Table Abonne
CREATE TABLE IF NOT EXISTS Abonne (
    id_abonne INT AUTO_INCREMENT PRIMARY KEY,
    nom_abonne VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    adresse VARCHAR(255),
    tel VARCHAR(20),
    email VARCHAR(100),
    date_inscription DATE NOT NULL,
    statut VARCHAR(50) DEFAULT 'Actif'
);

-- Table Ouvrage
CREATE TABLE IF NOT EXISTS Ouvrage (
    id_ouvrage INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    auteur VARCHAR(100),
    isbn VARCHAR(20) UNIQUE,
    categorie VARCHAR(100),
    date_publication DATE,
    editeur VARCHAR(100),
    statut VARCHAR(50) DEFAULT 'Disponible'
);

-- Table Emprunt
CREATE TABLE IF NOT EXISTS Emprunt (
    id_emprunt INT AUTO_INCREMENT PRIMARY KEY,
    date_emprunt DATE NOT NULL,
    date_retour_prevue DATE NOT NULL,
    date_retour_reelle DATE,
    id_ouvrage INT NOT NULL,
    id_abonne INT NOT NULL,
    FOREIGN KEY (id_ouvrage) REFERENCES Ouvrage(id_ouvrage),
    FOREIGN KEY (id_abonne) REFERENCES Abonne(id_abonne)
);

-- Table Amende
CREATE TABLE IF NOT EXISTS Amende (
    id_amende INT AUTO_INCREMENT PRIMARY KEY,
    montant DECIMAL(10,2) NOT NULL,
    raison VARCHAR(255),
    date_amende DATE NOT NULL,
    statut VARCHAR(50) DEFAULT 'Impayée',
    id_abonne INT NOT NULL,
    FOREIGN KEY (id_abonne) REFERENCES Abonne(id_abonne)
);

-- Données de test
INSERT INTO Abonne (nom_abonne, prenom, adresse, tel, email, date_inscription, statut)
VALUES 
('Kasongo', 'Jean', 'Kinshasa', '0123456789', 'jean@email.com', CURDATE(), 'Actif'),
('Mwamba', 'Marie', 'Kinshasa', '0987654321', 'marie@email.com', CURDATE(), 'Actif');

INSERT INTO Ouvrage (titre, auteur, isbn, categorie, date_publication, editeur, statut)
VALUES 
('Le Seigneur des Anneaux', 'J.R.R. Tolkien', '978-2-253-04445-0', 'Fantasy', '1954-07-29', 'Le Livre de Poche', 'Disponible'),
('1984', 'George Orwell', '978-2-07-036822-8', 'Science-Fiction', '1949-06-08', 'Gallimard', 'Disponible'),
('Le Comte de Monte Cristo', 'Alexandre Dumas', '978-2-07-036382-6', 'Aventure', '1844-08-28', 'Penguin', 'Disponible');

SELECT '✓ Toutes les tables créées avec succès !' AS Message;
SHOW TABLES;
