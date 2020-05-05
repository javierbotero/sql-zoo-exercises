SELECT id, title
 FROM movie
 WHERE yr=1962;

SELECT yr FROM movie WHERE title = 'Citizen Kane';

SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr;

SELECT actor.id FROM actor WHERE actor.name = 'Glenn Close';

SELECT movie.id FROM movie WHERE movie.title = 'Casablanca';

SELECT actor.name FROM casting JOIN actor ON casting.actorid = actor.id
  WHERE casting.movieid = 11768;

SELECT actor.name FROM casting
JOIN actor ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE casting.movieid = (SELECT id FROM movie WHERE title = 'Alien');

SELECT movie.title FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON actor.id = casting.actorid
  WHERE casting.actorid = (SELECT actor.id FROM actor WHERE actor.name = 'Harrison Ford');

SELECT movie.title FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON actor.id = casting.actorid
  WHERE
     casting.actorid = (SELECT actor.id FROM actor WHERE actor.name = 'Harrison Ford')
     AND casting.ord <> 1;

SELECT movie.title, actor.name FROM movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON casting.actorid = actor.id
  WHERE movie.yr = 1962
    AND casting.ord = 1;

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

SELECT movie.title, actor.name FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
 WHERE movie.id IN (SELECT movie.id FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON actor.id = casting.actorid
  WHERE actor.name='Julie Andrews')
 AND casting.ord = 1;

SELECT actor.name FROM actor WHERE actor.id IN (SELECT casting.actorid FROM casting
WHERE ord = 1
GROUP BY casting.actorid
HAVING COUNT(casting.actorid) >= 15)
ORDER BY actor.name;

SELECT movie.title, COUNT(movie.title) FROM movie
JOIN casting ON casting.movieid = movie.id
WHERE movie.yr = 1978
GROUP BY movie.title
HAVING COUNT(movie.title)
ORDER BY COUNT(movie.title) DESC, movie.title;

SELECT actor.name FROM actor
JOIN casting ON casting.actorid = actor.id
WHERE casting.movieid IN (SELECT movie.id FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Art Garfunkel')
AND actor.name != 'Art Garfunkel';
