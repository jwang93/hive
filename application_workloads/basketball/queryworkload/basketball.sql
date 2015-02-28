Drop table teams;

CREATE TABLE IF NOT EXISTS teams (
	team_id INT,
	team_name STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
LOCATION '/user/hive/warehouse/project1/data';

LOAD DATA LOCAL INPATH '/Users/Will/516/project1/hive/application_workloads/basketball/data/teams.csv' 
OVERWRITE into TABLE teams;

Drop table seasons;

CREATE TABLE IF NOT EXISTS seasons (
	season INT,
	dayzero STRING,
	regionW STRING,
	regionX STRING,
	regionY STRING,
	regionZ STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
LOCATION '/user/hive/warehouse/project1/data';

LOAD DATA LOCAL INPATH '/Users/Will/516/project1/hive/application_workloads/basketball/data/seasons.csv' 
OVERWRITE into TABLE seasons; 

Drop table regularSeasonDetails; 

CREATE TABLE IF NOT EXISTS regularSeasonDetails (
	season INT,
	daynum INT,
	wteam INT,
	wscore INT,
	lteam INT,
	lscore INT,
	wloc STRING,
	numot INT,
	wfgm INT,
	wfga INT,
	wfgm3 INT,
	wfga3 INT,
	wftm INT,
	wfta INT,
	wor INT,
	wdr INT,
	wast INT,
	wto INT,
	wstl INT,
	wblk INT,
	wpf INT,
	lfgm INT,
	lfga INT,
	lfgm3 INT,
	lfga3 INT,
	lftm INT,
	lfta INT,
	lor INT,
	ldr INT,
	last INT,
	lto INT,
	lstl INT,
	lblk INT,
	lpf INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
LOCATION '/user/hive/warehouse/project1/data';

LOAD DATA LOCAL INPATH '/Users/Will/516/project1/hive/application_workloads/basketball/data/regular_season_detailed_results.csv' 
OVERWRITE into TABLE regularSeasonDetails;  

Drop table tourneyResults;

CREATE TABLE IF NOT EXISTS tourneyResults (
	season INT,
	daynum INT,
	wteam INT,
	wscore INT,
	lteam INT,
	lscore INT,
	wloc STRING,
	numot INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
LOCATION '/user/hive/warehouse/project1/data';

LOAD DATA LOCAL INPATH '/Users/Will/516/project1/hive/application_workloads/basketball/data/tourney_compact_results.csv' 
OVERWRITE into TABLE tourneyResults; 

Drop table tourneyDetails;

CREATE TABLE IF NOT EXISTS tourneyDetails (
	season INT,
	daynum INT,
	wteam INT,
	wscore INT,
	lteam INT,
	lscore INT,
	wloc STRING,
	numot INT,
	wfgm INT,
	wfga INT,
	wfgm3 INT,
	wfga3 INT,
	wftm INT,
	wfta INT,
	wor INT,
	wdr INT,
	wast INT,
	wto INT,
	wstl INT,
	wblk INT,
	wpf INT,
	lfgm INT,
	lfga INT,
	lfgm3 INT,
	lfga3 INT,
	lftm INT,
	lfta INT,
	lor INT,
	ldr INT,
	last INT,
	lto INT,
	lstl INT,
	lblk INT,
	lpf INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
LOCATION '/user/hive/warehouse/project1/data';

LOAD DATA LOCAL INPATH '/Users/Will/516/project1/hive/application_workloads/basketball/data/tourney_detailed_results.csv' 
OVERWRITE into TABLE tourneyDetails; 


Drop table dukeWin;

CREATE TABLE IF NOT EXISTS dukeWin (
	win_team_name STRING,
	lose_team_name STRING,
	season INT,
	wscore INT,
	lteam INT,
	lscore INT,
	numot INT,
	wfgm INT,
	wfga INT,
	wfgm3 INT,
	wfga3 INT,
	wftm INT,
	wfta INT,
	wor INT,
	wdr INT,
	wast INT,
	wto INT,
	wstl INT,
	wblk INT,
	wpf INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
LOCATION '/user/hive/warehouse/project1/data';

INSERT OVERWRITE TABLE dukeWin
SELECT n.team_name, e.team_name, n.season, n.wscore, n.lscore, n.numot, n.wfgm, n.wfga, n.wfgm3, n.wfga3, n.wftm, n.wfta,
	n.wor, n.wdr, n.wast, n.wto, n.wstl, n.wblk, n.wpf
FROM (SELECT t.team_name, r.season, r.wscore, r.lteam, r.lscore, r.numot, r.wfgm, r.wfga, r.wfgm3, r.wfga3, r.wftm,r.wfta,
	r.wor,r.wdr,r.wast,r.wto,r.wstl,r.wblk,r.wpf
	FROM teams t JOIN regularSeasonDetails r ON t.team_id = r.wteam
	WHERE t.team_name="Duke"
	ORDER BY r.season ASC) n JOIN regularSeasonDetails e ON n.team_id=r.lteam
ORDER BY e.season ASC; 

SELECT 'Average number of 3pionts: ', AVG(wfgm3) AS fgm3
FROM dukeWin;

SELECT 'Number of win games with OT: ', count(*) AS numbers
FROM dukeWin
WHERE numot > 0;

