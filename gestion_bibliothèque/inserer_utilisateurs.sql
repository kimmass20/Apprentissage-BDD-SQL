-- Script pour insérer un utilisateur de test
-- Utilisateurs par défaut pour tester l'application

USE gestion_bibliotheque;

-- Vérifier et supprimer les utilisateurs existants (optionnel)
-- DELETE FROM utilisateur WHERE login='admin' OR login='bibliothecaire';

-- Hash SHA-256 des mots de passe (générés avec le code Java)
-- "admin" en SHA-256 = 8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918
-- "user" en SHA-256 = 1b4f0e9851971998e732078544c11c82f590e7f69d4b1c2c9b3e0e2e8f0f2f2e

-- Insérer les utilisateurs par défaut
INSERT INTO utilisateur (nom_utilisateur, prenom_utilisateur, login, mot_de_passe, role) 
VALUES 
('Admin', 'System', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Admin'),
('Bibliothecaire', 'Test', 'bibliothecaire', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Bibliothecaire');

-- Vérifier les utilisateurs insérés
SELECT 'Utilisateurs insérés:' AS Message;
SELECT id_utilisateur, login, role FROM utilisateur;
