SELECT Nazvanie, Stolitsa, Ploshad, Naselenie, Continent
FROM Strani
WHERE (Continent = 'Европа' AND Naselenie > 10000000)
   OR (Continent = 'Азия' AND Naselenie > 50000000);