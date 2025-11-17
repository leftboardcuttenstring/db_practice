SELECT Nazvanie
FROM Strani
WHERE (Continent IN ('Северная Америка', 'Южная Америка') AND Naselenie > 20000000)
   OR (Continent = 'Африка' AND Naselenie > 30000000);
