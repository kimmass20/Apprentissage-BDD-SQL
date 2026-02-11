CREATE DATABASE tp_merise;
USE tp_merise;

CREATE TABLE salarie (
  numsal INT AUTO_INCREMENT PRIMARY KEY,
  promsal VARCHAR(50),
  genre VARCHAR(10),
  DateEmb DATE,
  DateNais DATE,
  nomsal VARCHAR(50)
);

CREATE TABLE poste (
  numPost INT AUTO_INCREMENT PRIMARY KEY,
  designPost VARCHAR(50)
);

CREATE TABLE nivComp (
  codeNiv INT PRIMARY KEY,
  designNiv VARCHAR(50)
);

CREATE TABLE competences (
  idComp INT AUTO_INCREMENT PRIMARY KEY,
  intComp VARCHAR(50),
  codeNiv INT,
  CONSTRAINT fk_comp_niv
    FOREIGN KEY (codeNiv)
    REFERENCES nivComp(codeNiv)
);

ALTER TABLE salarie
ADD COLUMN numPost INT,
ADD CONSTRAINT fk_salarie_poste
  FOREIGN KEY (numPost)
  REFERENCES poste(numPost);

CREATE TABLE posseder (
  numsal INT,
  idComp INT,
  PRIMARY KEY (numsal, idComp),
  CONSTRAINT fk_posseder_salarie
    FOREIGN KEY (numsal)
    REFERENCES salarie(numsal),
  CONSTRAINT fk_posseder_comp
    FOREIGN KEY (idComp)
    REFERENCES competences(idComp)
);

INSERT INTO poste (designPost) VALUES
('Informaticien'),
('Comptable'),
('Secrétaire');

INSERT INTO nivComp (codeNiv, designNiv) VALUES
(1, 'Débutant'),
(2, 'Intermédiaire'),
(3, 'Expert');

INSERT INTO competences (intComp, codeNiv) VALUES
('Programmation', 3),
('Comptabilité', 2),
('Bureautique', 1);

INSERT INTO salarie (promsal, genre, DateEmb, DateNais, nomsal, numPost) VALUES
('Jean', 'M', '2016-01-10', '1993-03-12', 'Mukendi', 1),
('Paul', 'M', '2017-02-15', '1994-06-22', 'Kabongo', 2),
('Marie', 'F', '2018-03-20', '1995-09-10', 'Mwamba', 3),
('Anne', 'F', '2016-04-18', '1993-11-05', 'Ngoy', 1),
('David', 'M', '2015-05-25', '1992-07-30', 'Ilunga', 2),
('Esther', 'F', '2019-06-12', '1997-01-17', 'Banza', 3),
('Joseph', 'M', '2014-07-08', '1991-10-03', 'Kasongo', 1),
('Sarah', 'F', '2018-08-19', '1996-04-14', 'Kanyinda', 2),
('Patrick', 'M', '2016-09-30', '1993-12-21', 'Mbuyi', 3),
('Grace', 'F', '2019-10-11', '1997-06-09', 'Kabila', 1),

('Michel', 'M', '2017-01-05', '1994-02-20', 'Tshibanda', 2),
('Rachel', 'F', '2018-02-14', '1995-05-18', 'Lumanu', 3),
('Eric', 'M', '2016-03-22', '1993-08-11', 'Kalala', 1),
('Judith', 'F', '2019-04-30', '1997-09-27', 'Sumbu', 2),
('Moise', 'M', '2015-05-16', '1992-11-02', 'Mutombo', 3),
('Noella', 'F', '2020-06-25', '1998-12-13', 'Mubenga', 1),
('Alexandre', 'M', '2014-07-09', '1991-03-06', 'Lukusa', 2),
('Deborah', 'F', '2018-08-17', '1996-07-29', 'Matondo', 3),
('Daniel', 'M', '2016-09-28', '1993-10-10', 'Kanku', 1),
('Clarisse', 'F', '2019-10-19', '1997-01-23', 'Munganga', 2),

('Joel', 'M', '2017-01-12', '1994-04-11', 'Kabasele', 3),
('Samuel', 'M', '2016-02-18', '1993-06-17', 'Lwamba', 1),
('Jonathan', 'M', '2018-03-23', '1995-08-19', 'Mayele', 2),
('Cedric', 'M', '2019-04-29', '1996-10-21', 'Mafuta', 3),
('Kevin', 'M', '2015-05-07', '1992-12-30', 'Mundele', 1),
('Aline', 'F', '2020-06-13', '1998-02-14', 'Nsenga', 2),
('Irene', 'F', '2017-07-19', '1994-05-16', 'Kipulu', 3),
('Vanessa', 'F', '2018-08-25', '1995-07-18', 'Kimia', 1),
('Patricia', 'F', '2016-09-30', '1993-09-22', 'Moleka', 2),
('Christelle', 'F', '2019-10-15', '1997-11-26', 'Bolingo', 3),

('Benjamin', 'M', '2016-01-11', '1993-01-12', 'Bosenge', 1),
('Luc', 'M', '2017-02-17', '1994-03-18', 'Kambale', 2),
('Pierre', 'M', '2018-03-21', '1995-05-22', 'Masengo', 3),
('Alain', 'M', '2016-04-26', '1993-07-28', 'Nsimba', 1),
('Franck', 'M', '2015-05-30', '1992-09-30', 'Panzu', 2),
('Nadine', 'F', '2019-06-04', '1997-11-02', 'Tshilombo', 3),
('Cynthia', 'F', '2020-07-08', '1998-01-05', 'Bokila', 1),
('Melanie', 'F', '2017-08-14', '1994-03-09', 'Makiese', 2),
('Prisca', 'F', '2018-09-19', '1995-05-13', 'Ngalula', 3),
('Sandra', 'F', '2016-10-24', '1993-07-17', 'Luyindula', 1),

('Robert', 'M', '2015-01-15', '1992-02-10', 'Katende', 2),
('Olivier', 'M', '2016-02-20', '1993-04-14', 'Kipembe', 3),
('Stephane', 'M', '2017-03-25', '1994-06-18', 'Matoso', 1),
('Aristide', 'M', '2018-04-30', '1995-08-22', 'Ngandu', 2),
('Didier', 'M', '2019-05-05', '1996-10-26', 'Mukoko', 3),
('Solange', 'F', '2020-06-10', '1998-12-30', 'Kasonia', 1),
('Helene', 'F', '2017-07-15', '1994-02-03', 'Makengo', 2),
('Monique', 'F', '2018-08-20', '1995-04-07', 'Yenga', 3),
('Pauline', 'F', '2016-09-25', '1993-06-11', 'Nsiala', 1),
('Chantal', 'F', '2019-10-30', '1997-08-15', 'Bialy', 2),

('Emmanuel', 'M', '2015-01-09', '1992-01-19', 'Lusamba', 3),
('Thierry', 'M', '2016-02-14', '1993-03-23', 'Mavungu', 1),
('Junior', 'M', '2017-03-19', '1994-05-27', 'Kikuni', 2),
('Armand', 'M', '2018-04-24', '1995-07-31', 'Nzita', 3),
('Fabrice', 'M', '2019-05-29', '1996-10-04', 'Kibonge', 1),
('Carine', 'F', '2020-06-03', '1998-12-08', 'Mbuyamba', 2),
('Laure', 'F', '2017-07-08', '1994-02-12', 'Mutoni', 3),
('Rebecca', 'F', '2018-08-13', '1995-04-16', 'Bompenga', 1),
('Dorcas', 'F', '2016-09-18', '1993-06-20', 'Nkosi', 2),
('Elisabeth', 'F', '2019-10-23', '1997-08-24', 'Lufuluabo', 3);

INSERT INTO salarie (promsal, genre, DateEmb, DateNais, nomsal, numPost) VALUES
('Marcel', 'M', '2016-01-14', '1993-02-18', 'Bongeli', 1),
('Roland', 'M', '2017-02-19', '1994-04-22', 'Kabasele', 2),
('Yannick', 'M', '2018-03-24', '1995-06-26', 'Makanzu', 3),
('Cedrick', 'M', '2019-04-29', '1996-08-30', 'Bopaka', 1),
('Steve', 'M', '2015-05-04', '1992-10-04', 'Mayembo', 2),
('Floriane', 'F', '2020-06-09', '1998-12-08', 'Mavungu', 3),
('Jeannette', 'F', '2017-07-14', '1994-02-12', 'Bakala', 1),
('Olga', 'F', '2018-08-19', '1995-04-16', 'Bondo', 2),
('Sandrine', 'F', '2016-09-24', '1993-06-20', 'Lokese', 3),
('Ariane', 'F', '2019-10-29', '1997-08-24', 'Mavula', 1),

('Freddy', 'M', '2015-01-08', '1992-01-15', 'Mbayo', 2),
('Patrick', 'M', '2016-02-13', '1993-03-19', 'Mubenga', 3),
('Claude', 'M', '2017-03-18', '1994-05-23', 'Bemba', 1),
('Loic', 'M', '2018-04-23', '1995-07-27', 'Kashama', 2),
('Junior', 'M', '2019-05-28', '1996-09-01', 'Bompengo', 3),
('Sophie', 'F', '2020-06-02', '1998-11-05', 'Nsasi', 1),
('Belinda', 'F', '2017-07-07', '1994-01-09', 'Makengo', 2),
('Naomie', 'F', '2018-08-12', '1995-03-13', 'Kisimba', 3),
('Aurelie', 'F', '2016-09-17', '1993-05-17', 'Kalonda', 1),
('Melissa', 'F', '2019-10-22', '1997-07-21', 'Mundele', 2),

('Gloire', 'M', '2015-01-06', '1992-01-11', 'Ilunga', 3),
('Henri', 'M', '2016-02-11', '1993-03-15', 'Lukusa', 1),
('Blaise', 'M', '2017-03-16', '1994-05-19', 'Ngandu', 2),
('Trésor', 'M', '2018-04-21', '1995-07-23', 'Kasereka', 3),
('Cyrille', 'M', '2019-05-26', '1996-09-27', 'Mukoko', 1),
('Josiane', 'F', '2020-06-01', '1998-11-01', 'Bialy', 2),
('Odette', 'F', '2017-07-06', '1994-01-06', 'Sakata', 3),
('Pauline', 'F', '2018-08-11', '1995-03-10', 'Munganga', 1),
('Martine', 'F', '2016-09-16', '1993-05-14', 'Yenga', 2),
('Chloe', 'F', '2019-10-21', '1997-07-18', 'Bosenge', 3),

('Jonathan', 'M', '2015-01-05', '1992-01-10', 'Luyindula', 1),
('Herve', 'M', '2016-02-10', '1993-03-14', 'Nsiala', 2),
('Alfred', 'M', '2017-03-15', '1994-05-18', 'Katende', 3),
('Kevin', 'M', '2018-04-20', '1995-07-22', 'Kipulu', 1),
('Caleb', 'M', '2019-05-25', '1996-09-26', 'Kalonji', 2),
('Prisca', 'F', '2020-06-30', '1998-12-04', 'Lusamba', 3),
('Ruth', 'F', '2017-07-05', '1994-01-08', 'Moleka', 1),
('Estelle', 'F', '2018-08-10', '1995-03-12', 'Kanyinda', 2),
('Nancy', 'F', '2016-09-15', '1993-05-16', 'Boloko', 3),
('Joyce', 'F', '2019-10-20', '1997-07-20', 'Mavungu', 1);


DELETE FROM salarie
WHERE numsal > 100;


