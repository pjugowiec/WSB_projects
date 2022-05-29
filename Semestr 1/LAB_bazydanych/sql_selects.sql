-- A) Napisz kwerendę wypisującą listę imion i nazwisk wszystkich pracowników 
SELECT o.imie, o.nazwisko FROM pracownicy p 
JOIN osoba o ON (o.id_osoby = p.id_osoby);

SELECT CONCAT(o.imie, ' ', o.nazwisko) FROM pracownicy p 
JOIN osoba o ON (o.id_osoby = p.id_osoby);

-- B) Napisać kwerendę wypisującą pracowników od A do Z i posortować po nazwisku
SELECT o.imie, o.nazwisko  FROM pracownicy p 
JOIN osoba o ON p.id_osoby = o.id_osoby
ORDER BY o.nazwisko;

SELECT CONCAT(o.nazwisko, ' ', o.imie) FROM pracownicy p 
JOIN osoba o ON (o.id_osoby = p.id_osoby)
ORDER BY o.nazwisko;

-- C) Napisać kwerendę pracowników pogrupowanych po firmie
SELECT count(f.id_firmy) as "Liczba pracowników", f.nazwa 
FROM pracownicy p
JOIN firma f ON (p.id_firmy = f.id_firmy) 
GROUP BY f.id_firmy
ORDER BY count(f.id_firmy) ASC; 

-- D) Napisać kwerendę wypisującą liczbę firm w bazie
SELECT count(f.id_firmy)
FROM firma f;

-- E) Napisać kwerendę wyświetlającą średnią liczbę pracowników na firmę
SELECT (SELECT count(p.id_pracownika) FROM pracownicy p)/count(f.id_firmy) as 'result'
FROM firma f;

-- F) napisz kwerendę podającą top 10 miast z których pochodzi najwięcej klientów
SELECT count(k.id_klienta), m.nazwa 
FROM klient k 
LEFT JOIN osoba o ON o.id_osoby = k.id_osoby 
LEFT JOIN miasto m ON m.id_miasta = o.id_miasta
GROUP BY m.id_miasta
ORDER BY COUNT(k.id_klienta) DESC
LIMIT 10;

-- G) napisz kwerendę podającą średnie wynagrodzenie pracowników pogrupowanych per firma per departament
SELECT AVG(p.wynagrodzenie) as "Średnie wynagordzenie", f.nazwa
FROM pracownicy p
JOIN firma f ON f.id_firmy = p.id_firmy
GROUP BY p.id_firmy, p.id_departamentu
ORDER BY f.nazwa ASC, AVG(p.wynagrodzenie) DESC;
