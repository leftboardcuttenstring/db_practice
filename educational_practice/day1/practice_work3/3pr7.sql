SELECT Nazvanie, Stolitsa, Ploshad, Naselenie, Continent
FROM Strani
WHERE Naselenie BETWEEN 10000000 AND 100000000
  AND Ploshad BETWEEN 100000 AND 200000;