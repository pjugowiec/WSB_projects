CREATE DATABASE IF NOT EXISTS `bazydanych-wsb` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci ;
USE `bazydanych-wsb`; 

CREATE TABLE IF NOT EXISTS `osoba`(
	id_osoby int auto_increment primary key unique,
	imie varchar(20),
	nazwisko varchar(20),
	id_miasta int
);

CREATE TABLE IF NOT EXISTS `miasto`(
	id_miasta int auto_increment primary key unique,
	nazwa varchar(50)
);

CREATE TABLE IF NOT EXISTS `firma`(
	id_firmy int auto_increment primary key unique,
	nazwa varchar(50)
);

CREATE TABLE IF NOT EXISTS `departament`(
	id_departamentu int auto_increment primary key unique,
	nazwa varchar(50)
);

CREATE TABLE IF NOT EXISTS `klient`(
	id_klienta int auto_increment primary key unique,
    id_osoby int,
    FOREIGN KEY osoba_k(id_osoby) REFERENCES osoba(id_osoby)
);

CREATE TABLE IF NOT EXISTS `pracownicy`(
	id_pracownika int auto_increment primary key unique,
	id_firmy int,
	id_osoby int,
	id_departamentu int,
	wynagrodzenie double,
    FOREIGN KEY firma(id_firmy) REFERENCES firma(id_firmy),
	FOREIGN KEY osoba(id_osoby) REFERENCES osoba(id_osoby),
	FOREIGN KEY departamen(id_departamentu) REFERENCES departament(id_departamentu)
);

CREATE TABLE IF NOT EXISTS `produkt`(
	id_produktu int auto_increment primary key unique,
	id_firmy int,
	nazwa varchar(50),
    FOREIGN KEY firma_p(id_firmy) REFERENCES firma(id_firmy)
);

CREATE TABLE IF NOT EXISTS `klient-produkt`(
	id_klient_produktu int auto_increment primary key unique,
	id_klient int,
	id_produkt int,
    FOREIGN KEY klient_kp(id_klient) REFERENCES klient(id_klienta),
    FOREIGN KEY produkt_kp(id_produkt) REFERENCES produkt(id_produktu)
);

INSERT INTO `osoba` (imie, nazwisko, id_miasta)
VALUES
("Jan", "Kowalski", 6),
("Grzegorz", "Nowak", 1),
("Aneta", "Kogut", 2),
("Grażyna", "Kura", 4),
("Eugeniusz", "Rosół", 3),
("Batrosz", "Barszczowski", 6),
("Joanna", "Drób", 7),
("Jan", "Michalski", 7),
("Maciej", "Makowski", 8),
("Krzysztof", "Kawat", 10),
("Andrzej", "Rak", 9),
("Dariusz", "Kowalski", 9),
("Miłosz", "Wiśniewski", 4),
("Anna", "Kowalska", 4),
("Teresa", "Nowakowsa", 4),
("Barbara", "Surowiec", 5),
("Ilona", "Waza", 2),
("Bożena", "Wyszyńska", 1),
("Jadwiga", "Masłoń", 3),
("Witold", "Kozłowski", 3),
("Michał", "Adamski", 1);

INSERT INTO `miasto` (nazwa)
VALUES
("Sosnowiec"),
("Katowice"),
("Bytom"),
("Gliwice"),
("Zawiercie"),
("Częstochowa"),
("Siewierz"),
("Wrocław"),
("Kraków"),
("Tarnów");

INSERT INTO `firma` (nazwa)
VALUES
("SONY"),
("SAMSUNG"),
("MICROSOFT"),
("APPLE"),
("LG");

INSERT INTO `departament` (nazwa)
VALUES
("księgowość"),
("development"),
("media"),
("marketing"),
("security"),
("kreatywny"),
("technologie"),
("kontrakty");

INSERT INTO `klient` (id_osoby)
VALUES
(1),
(2),
(3),
(5),
(4),
(4),
(16),
(11),
(18),
(18),
(9),
(10),
(7),
(7),
(20),
(15),
(12),
(17),
(13),
(1),
(6),
(8),
(14),
(19),
(21);

INSERT INTO `pracownicy` (id_firmy, id_osoby, id_departamentu, wynagrodzenie)
VALUES
(1, 1, 1, 2000),
(2, 2, 1, 3000),
(3, 3, 1, 3000),
(5, 4, 2, 4000),
(4, 5, 2, 4000),
(4, 6, 3, 2500),
(1, 7, 3, 3500),
(2, 8, 4, 3500),
(2, 9, 4, 5500),
(3, 10, 4, 5000),
(1, 11, 5, 2500),
(4, 12, 5, 6500),
(3, 13, 5, 6000),
(5, 14, 6, 1500),
(1, 15, 6, 1500),
(4, 16, 7, 1500),
(2, 17, 7, 2500),
(1, 18, 8, 3500),
(2, 19, 8, 4000),
(2, 20, 8, 2000);

INSERT INTO `produkt` (id_firmy, nazwa)
VALUES
(1, "inny1"),
(2, "inny2"),
(3, "inny3"),
(5, "inny4"),
(4, "inny5"),
(4, "inny6"),
(1, "inny7"),
(2, "inny8"),
(2, "inny9"),
(3, "inny10"),
(1, "inny11"),
(4, "inny12"),
(3, "inny13"),
(5, "inny14"),
(1, "inny15");

INSERT INTO `klient-produkt` (id_klient, id_produkt)
VALUES
(1, 1),
(2, 2),
(3, 3),
(5, 4),
(4, 5),
(4, 6),
(16, 7),
(11, 8),
(18, 9),
(18, 10),
(9, 11),
(10, 12),
(7, 13),
(7, 14),
(20, 15),
(15, 1),
(12, 2),
(17, 3),
(13, 4),
(1, 5),
(6, 6),
(8, 7),
(14, 8),
(19, 9),
(21, 10);
