CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT b.name AS name
    FROM parents AS a
    JOIN dogs AS b ON a.child = b.name
    JOIN dogs AS c ON a.parent = c.name
    ORDER BY c.height DESC;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT dogs.name AS name, sizes.size AS size
    FROM dogs
    JOIN sizes ON
       dogs.height > sizes.min AND
       dogs.height <= sizes.max;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.name AS first, b.name AS second, asize.size AS size
  FROM dogs AS a
  JOIN dogs AS b ON a.name < b.name
  JOIN parents AS ap ON ap.child = a.name
  JOIN parents AS bp ON bp.child = b.name 
  JOIN size_of_dogs AS asize ON asize.name = a.name
  JOIN size_of_dogs AS bsize ON bsize.name = b.name
  WHERE ap.parent = bp.parent AND asize.size = bsize.size;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || first ||" and "|| second ||", have the same size: "|| size
  FROM siblings;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - MIN(height) AS range
  FROM dogs
  GROUP BY fur
  HAVING MIN(height) >= 0.7 * AVG(height)
     AND MAX(height) <= 1.3 * AVG(height);

