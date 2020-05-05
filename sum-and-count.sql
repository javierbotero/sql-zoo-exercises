SELECT SUM(population)
FROM world;

SELECT SUM(population)
FROM world;

SELECT SUM(gdp) FROM world WHERE continent = 'Africa';

SELECT COUNT(name) FROM world WHERE area >= 1000000;

SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

SELECT continent, COUNT(*) FROM world GROUP BY continent;

SELECT continent, COUNT(*) FROM world WHERE population >= 10000000 GROUP BY continent;

SELECT DISTINCT continent FROM world A WHERE (SELECT SUM(population) FROM world B WHERE A.continent = B.continent ) > 100000000;

