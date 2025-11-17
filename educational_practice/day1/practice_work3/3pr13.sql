SELECT Nazvanie, Stolitsa, Ploshad, Naselenie, Continent
FROM Strani
WHERE Nazvanie NOT LIKE '[À-Ã]%' OR Nazvanie LIKE 'Ñ%';