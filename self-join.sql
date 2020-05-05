SELECT COUNT(stops.name) FROM stops;

SELECT stops.id FROM stops WHERE stops.name = 'Craiglockhart';

SELECT stops.id, stops.name FROM stops JOIN route ON stops.id = route.stop
WHERE route.num = 4 AND company = 'LRT'
ORDER BY route.pos;

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';

SELECT route.company,  route.num FROM route
JOIN route b ON route.company = b.company AND route.num = b.num
 WHERE route.stop = 115 AND b.stop = 137
 GROUP BY num;

SELECT route.company, route.num FROM route
  JOIN route a ON route.company = a.company AND route.num = a.num
  JOIN stops ON route.stop = stops.id
  JOIN stops b ON a.stop = b.id
  WHERE stops.name = 'Craiglockhart' AND b.name = 'Tollcross';

SELECT DISTINCT b.name, route.company, route.num FROM route 
  JOIN route a ON route.company = a.company AND route.num = a.num
  JOIN stops ON route.stop = stops.id
  JOIN stops b ON a.stop = b.id
  WHERE stops.name = 'Craiglockhart' AND route.company = 'LRT'