CREATE TABLE beers (
  index INT PRIMARY KEY,
  abv INT,
  id INT,
  name VARCHAR(200),
  style VARCHAR(200),
  brewery_id INT,
  ounces INT
);
CREATE TABLE breweries (
  brewery_id INT PRIMARY KEY,
  brewery_name VARCHAR(200),
  city VARCHAR(200),
  state VARCHAR(200)
  );



SELECT * FROM beers;
SELECT * FROM breweries;
DELETE FROM beers;

--Alter table to change column type
ALTER TABLE beers 
ALTER COLUMN abv TYPE REAL
USING abv::REAL
;

--Join tables to compare alcohol content by state
SELECT beers.abv, breweries.state
FROM beers
INNER JOIN breweries
ON (beers.brewery_id=breweries.brewery_id)
;

--AVERAGE ABV BY STATE
SELECT breweries.state,
AVG(beers.abv)::NUMERIC(10,3)
FROM beers,breweries
WHERE beers.brewery_id=breweries.brewery_id
GROUP BY breweries.state
ORDER BY AVG(beers.abv)DESC;

--COUNT IPA BY STATE
SELECT breweries.state,
COUNT(beers.style)
FROM beers,breweries
WHERE beers.brewery_id=breweries.brewery_id AND beers.style LIKE '%IPA%'
GROUP BY breweries.state
ORDER BY COUNT(beers.style)DESC;

--New merged table created 
CREATE TABLE merged (
  index INT PRIMARY KEY,
  brewery_id INT,
  brewery_name VARCHAR(200),
  city VARCHAR(200),
  state VARCHAR(200),
  abv INT,
  id INT,
  name VARCHAR(200),
  style VARCHAR(200),
  ounces INT
);

--Alter table to change column type
ALTER TABLE merged 
ALTER COLUMN abv TYPE REAL
USING abv::REAL
;
--Deleting table contents to allow pushing agian from Pandas
DELETE FROM merged;
SELECT * FROM merged;

--COUNT IPA BY STATE USING MERGED TABLE
SELECT merged.state,
COUNT(style)
FROM merged
WHERE style LIKE '%IPA%'
GROUP BY state
ORDER BY COUNT(style)DESC;

--New RESULTS table created 
CREATE TABLE results (
  index SERIAL PRIMARY KEY,
  state VARCHAR(200),
  abv REAL,
  IPAs INT
);


--EXTRA CREDIT
DROP TABLE results;
DELETE FROM results;
SELECT * FROM results;

INSERT INTO results(ipas)
SELECT COUNT (merged.style)
FROM merged
WHERE style LIKE '%IPA%'
GROUP BY state;

INSERT INTO results(state)
SELECT (merged.state)
FROM merged
GROUP BY state;