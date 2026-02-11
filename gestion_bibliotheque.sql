create database gestion_bibliotheque;
use gestion_bibliotheque;
create table Amende(
id_amende  int auto_increment primary key,
montant int not null,
raison varchar(100),
statut varchar(50)
);

create table Emprunt(
id_emprunt int auto_increment primary key,
date_emprunt DATE not null,
date_retour DATE not null,
amende varchar(50),
retour varchar(50),
id_amende int, foreign key(id_amende) references Amende (id_amende)
);

create table Ouvrage (
id_ouvrage int auto_increment primary key,
titre varchar(50),
auteur varchar(50),
isbn varchar(50),
categorie varchar(50),
date_publication date not null,
editeur varchar(50),
statut varchar(100),
id_emprunt int, 
foreign key(id_emprunt) references Emprunt (id_emprunt)
);

create table Abonne(
id_abonne int auto_increment primary key,
nom_abonne varchar (50),
prenom varchar(50),
adresse varchar(50),
tel int,
email varchar (50),
date_inscription date not null,
statut varchar (100),
id_emprunt int,
 foreign key(id_emprunt) references Emprunt (id_emprunt)
);

create table Catalogue(
id_catalogue int auto_increment primary key,
nom_section varchar (50),
description varchar (100),
liste_ouvrage varchar (200),
id_ouvrage int, 
foreign key(id_ouvrage) references Ouvrage (id_ouvrage)
);

create table Utilisateur(
id_utilisateur int auto_increment primary key,
nom_utilisateur varchar (50),
prenom_utilisateur varchar (50),
login varchar (50),
mot_de_passe varchar (15),
role varchar (100),
id_catalogue int,
id_abonne int,
foreign key(id_catalogue) references Catalogue (id_catalogue),
foreign key(id_abonne) references Abonne (id_abonne)
);



