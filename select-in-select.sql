SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

SELECT name FROM world WHERE gdp/population > (SELECT gdp/population FROM world WHERE name = 'United kingdom');
AND continent = 'Europe';

SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name;

SELECT name, population FROM world WHERE population BETWEEN (SELECT population FROM world WHERE name = 'Poland')AND (SELECT population FROM world WHERE name = 'Canada');

SELECT name, CONCAT(ROUND((population/(SELECT population FROM world WHERE name = 'Germany'))*100, 0), '%') FROM world WHERE continent = 'Europe';

SELECT name FROM world WHERE gdp > ALL(SELECT gdp FROM world WHERE gdp IS NOT NULL AND continent = 'Europe');

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0);

SELECT continent, name FROM world GROUP BY continent;

