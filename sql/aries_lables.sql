BEGIN;

DROP TABLE IF EXISTS aries_xy;
DROP TABLE IF EXISTS label_positions;

CREATE TABLE label_positions(id int, x int, y int);

INSERT INTO label_positions(id, x, y)
VALUES 
    (1 , -5 , -5),
    (2 ,  0 , -5),
    (3 ,  5 , -5),
    (4 ,  5 ,  0),
    (5 ,  5 ,  5),
    (6 ,  0 ,  5),
    (7 , -5 , -5),
    (8 , -5 ,  0)
;

CREATE TABLE aries_xy AS
SELECT a.*, b.x, b.y
FROM (
  SELECT *, floor(random()*8+1)::integer AS r_id 
  FROM aries
  ) a
JOIN label_positions b ON b.id=a.r_id;

DROP TABLE IF EXISTS aries;

ALTER TABLE aries_xy RENAME TO aries;

COMMIT;