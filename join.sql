SELECT goal.matchid, goal.player FROM goal
  WHERE teamid = 'GER';

SELECT id, stadium, team1, team2
  FROM game WHERE id = 1012;

SELECT goal.player, goal.teamid, game.stadium, game.mdate
  FROM goal JOIN game
  ON goal.matchid = game.id
  WHERE goal.teamid = 'GER';

SELECT game.team1, game.team2, goal.player
  FROM goal JOIN game
  ON goal.matchid = game.id
  WHERE goal.player LIKE 'Mario%';

SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
  FROM goal JOIN eteam
  WHERE goal.teamid = eteam.id
  AND goal.gtime <= 10;

SELECT game.mdate, eteam.teamname FROM game JOIN eteam
ON game.team1 = eteam.id
WHERE eteam.coach = 'Fernando Santos';

SELECT player
  FROM goal JOIN game
  ON game.id = goal.matchid
  WHERE (goal.teamid <> 'GER') AND (game.team1 = 'GER' OR game.team2 = 'GER');

SELECT DISTINCT player
  FROM goal JOIN game
  ON game.id = goal.matchid
  WHERE (goal.teamid <> 'GER') AND (game.team1 = 'GER' OR game.team2 = 'GER');

SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON goal.teamid = eteam.id
  GROUP BY teamname;

SELECT game.stadium, COUNT(*) FROM game JOIN goal
  ON game.id = goal.matchid
  GROUP BY game.stadium;

SELECT matchid, mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE team1 = 'POL' OR team2 = 'POL'
 GROUP BY matchid;

SELECT game.id, game.mdate, COUNT(*) FROM game JOIN goal
   ON game.id = goal.matchid
   WHERE (game.team1 = 'GER' OR game.team2 = 'GER') AND goal.teamid = 'GER'
   GROUP BY game.id;

SELECT mdate,
  team1,
  SUM(CASE
     WHEN goal.teamid = game.team1 THEN 1
     ELSE 0
  END) score1,
  team2,
  SUM(CASE
    WHEN goal.teamid = game.team2 THEN 1
    ELSE 0
  END) score2
  FROM game JOIN goal ON goal.matchid = game.id
  GROUP BY matchid
  ORDER BY mdate, matchid, team1, team2;
