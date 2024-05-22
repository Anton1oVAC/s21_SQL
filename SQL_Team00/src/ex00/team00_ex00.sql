-- Создание таблицы маршрутов
CREATE TABLE IF NOT EXISTS routes (
  point1 CHAR(1),
  point2 CHAR(1),
  cost INT,
  PRIMARY KEY (point1, point2)
);

-- Вставка данных
INSERT INTO routes (point1, point2, cost) VALUES
  ('a', 'b', 10),
  ('b', 'a', 10),
  ('b', 'c', 35),
  ('c', 'b', 35),
  ('c', 'd', 30),
  ('d', 'c', 30),
  ('d', 'a', 20),
  ('a', 'd', 20),
  ('a', 'c', 15),
  ('c', 'a', 15),
  ('b', 'd', 25),
  ('d', 'b', 25)
ON CONFLICT DO NOTHING;

WITH RECURSIVE Min_Tour AS (
    SELECT  point1, point2, cost, ARRAY[point2]::varchar[] AS path, cost AS total_cost
    FROM routes
    WHERE point1 = 'a'

    UNION ALL

    SELECT r.point1, r.point2, r.cost, mt.path || r.point2, mt.total_cost + r.cost AS total_cost
    FROM Min_Tour mt
    JOIN routes r ON mt.point2 = r.point1
    WHERE NOT mt.path @> ARRAY[r.point2]::varchar[]
)

SELECT
  total_cost,
  '{' || array_to_string(ARRAY['a'] || path, ', ') || '}' tour
FROM Min_Tour
WHERE
    ARRAY['a', 'b', 'c', 'd']::varchar[] <@ path
    AND path[4] = 'a'
ORDER BY total_cost, path
LIMIT 2;
