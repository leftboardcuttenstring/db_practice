SELECT Nazvanie, Stolitsa, Ploshad, Naselenie, Continent
FROM Strani
WHERE Nazvanie BETWEEN 'Бенин' AND 'Ватикан'
ORDER BY Nazvanie;