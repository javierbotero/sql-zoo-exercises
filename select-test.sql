SELECT population FROM world
  WHERE name = 'Germany'

SELECT name, population FROM world
  WHERE name IN ('Brazil', 'Russia', 'India', 'China');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;