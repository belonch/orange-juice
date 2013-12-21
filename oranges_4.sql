/* 
    Test each scenario, and sort by total cost.  The top row is the optima
    based on the scenarios you are testing.
*/

WITH 
v1 AS
(
SELECT rq.rqid, 
       rq.tq,
       rq.r1,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r1 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r1 * v.acid_pct        AS acid_numerator,
       rq.r1 * v.astringency     AS astringency_numerator,
       rq.r1 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r1 * (v.price + v.shipping)) as cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 1
),
v2 AS
(
SELECT rq.rqid, 
       rq.r2,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r2 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r2 * v.acid_pct        AS acid_numerator,
       rq.r2 * v.astringency     AS astringency_numerator,
       rq.r2 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r2 * (v.price + v.shipping)) AS cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 2
),
v3 AS
(
SELECT rq.rqid, 
       rq.r3,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r3 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r3 * v.acid_pct        AS acid_numerator,
       rq.r3 * v.astringency     AS astringency_numerator,
       rq.r3 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r3 * (v.price + v.shipping)) AS cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 3
),
v4 AS
(
SELECT rq.rqid, 
       rq.r4,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r4 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r4 * v.acid_pct        AS acid_numerator,
       rq.r4 * v.astringency     AS astringency_numerator,
       rq.r4 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r4 * (v.price + v.shipping)) AS cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 4
),
v5 AS
(
SELECT rq.rqid, 
       rq.r5,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r5 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r5 * v.acid_pct        AS acid_numerator,
       rq.r5 * v.astringency     AS astringency_numerator,
       rq.r5 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r5 * (v.price + v.shipping)) AS cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 5
),
v6 AS
(
SELECT rq.rqid, 
       rq.r6,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r6 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r6 * v.acid_pct        AS acid_numerator,
       rq.r6 * v.astringency     AS astringency_numerator,
       rq.r6 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r6 * (v.price + v.shipping)) AS cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 6
),
v7 AS
(
SELECT rq.rqid, 
       rq.r7,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r7 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r7 * v.acid_pct        AS acid_numerator,
       rq.r7 * v.astringency     AS astringency_numerator,
       rq.r7 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r7 * (v.price + v.shipping)) AS cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 7
),
v8 AS
(
SELECT rq.rqid, 
       rq.r8,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r8 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r8 * v.acid_pct        AS acid_numerator,
       rq.r8 * v.astringency     AS astringency_numerator,
       rq.r8 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r8 * (v.price + v.shipping)) AS cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 8
),
v9 AS
(
SELECT rq.rqid, 
       rq.r9,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r9 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r9 * v.acid_pct        AS acid_numerator,
       rq.r9 * v.astringency     AS astringency_numerator,
       rq.r9 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r9 * (v.price + v.shipping)) AS cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 9
),
v10 AS
(
SELECT rq.rqid, 
       rq.r10,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r10 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r10 * v.acid_pct        AS acid_numerator,
       rq.r10 * v.astringency     AS astringency_numerator,
       rq.r10 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r10 * (v.price + v.shipping)) AS cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 10
),
v11 AS
(
SELECT rq.rqid, 
       rq.r11,
       v.brix_acid_ratio,
       v.acid_pct,
       v.astringency,
       v.color,
       rq.r11 * v.brix_acid_ratio AS brix_acid_numerator,
       rq.r11 * v.acid_pct        AS acid_numerator,
       rq.r11 * v.astringency     AS astringency_numerator,
       rq.r11 * v.color           AS color_numerator,
       v.price,
       v.shipping,
       (rq.r11 * (v.price + v.shipping)) AS cost
  FROM random_quantities rq
       JOIN varietals v on v.varietal_id = 11
),
computed AS
(
SELECT v1.rqid, tq, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11,
       (v1.cost + v2.cost + v3.cost + v4.cost + v5.cost + v6.cost +
        v7.cost + v8.cost + v9.cost + v10.cost + v11.cost) AS total_cost,
       r3 as florida_valencia_quantity,
       (v1.brix_acid_numerator +
       v2.brix_acid_numerator +
       v3.brix_acid_numerator +
       v4.brix_acid_numerator +
       v5.brix_acid_numerator +
       v6.brix_acid_numerator +
       v7.brix_acid_numerator +
       v8.brix_acid_numerator +
       v9.brix_acid_numerator +
       v10.brix_acid_numerator +
       v11.brix_acid_numerator) / tq AS brix_acid_ratio,
       (v1.acid_numerator +
       v2.acid_numerator +
       v3.acid_numerator +
       v4.acid_numerator +
       v5.acid_numerator +
       v6.acid_numerator +
       v7.acid_numerator +
       v8.acid_numerator +
       v9.acid_numerator +
       v10.acid_numerator +
       v11.acid_numerator) / tq AS acid_ratio,
       (v1.astringency_numerator +
       v2.astringency_numerator +
       v3.astringency_numerator +
       v4.astringency_numerator +
       v5.astringency_numerator +
       v6.astringency_numerator +
       v7.astringency_numerator +
       v8.astringency_numerator +
       v9.astringency_numerator +
       v10.astringency_numerator +
       v11.astringency_numerator) / tq AS astringency_ratio,
       (v1.color_numerator +
       v2.color_numerator +
       v3.color_numerator +
       v4.color_numerator +
       v5.color_numerator +
       v6.color_numerator +
       v7.color_numerator +
       v8.color_numerator +
       v9.color_numerator +
       v10.color_numerator +
       v11.color_numerator) / tq AS color_ratio
  FROM v1
       JOIN v2 ON v1.rqid = v2.rqid
       JOIN v3 ON v1.rqid = v3.rqid
       JOIN v4 ON v1.rqid = v4.rqid
       JOIN v5 ON v1.rqid = v5.rqid
       JOIN v6 ON v1.rqid = v6.rqid
       JOIN v7 ON v1.rqid = v7.rqid
       JOIN v8 ON v1.rqid = v8.rqid
       JOIN v9 ON v1.rqid = v9.rqid
       JOIN v10 ON v1.rqid = v10.rqid
       JOIN v11 ON v1.rqid = v11.rqid
)
SELECT *
  FROM computed
  -- Here are the business constraints in plain English (well, SQL at least).
WHERE florida_valencia_quantity / tq >= 0.40
  AND brix_acid_ratio between 11.5 AND 12.5
  AND acid_ratio between 0.75 AND 1.0
  AND astringency_ratio <= 4.0
  AND color_ratio between 4.5 AND 5.5 
 -- Sort by cost, then the first row is the optima
 ORDER BY total_cost;
 