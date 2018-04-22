-- sample of users
--
-- steventa=# SELECT * FROM users LIMIT 5;
--  id | gender | age | country | days_on_site_in_2016
-- ----+--------+-----+---------+----------------------
--   1 | M      |  21 | US      |                    1
--   2 | F      |  46 | US      |                   10
--   3 |        |  26 | US      |                    4
--   4 |        |  54 | US      |                    7
--   5 | F      |  34 | US      |                   38
-- (5 rows)
--

-- sample of orders
--
-- steventa=# SELECT * FROM orders LIMIT 5;
--  id | user_id | order_time | item_total | shipping_cost | discounts_applied | payment_reject
-- ----+---------+------------+------------+---------------+-------------------+----------------
--   1 |    9852 | 2016-01-01 |      60.69 |            10 |                   | f
--   2 |    2784 | 2016-01-01 |     123.91 |            15 |                   | f
--   3 |    1619 | 2016-01-01 |     119.75 |            15 |                   | f
--   4 |    9725 | 2016-01-01 |     151.92 |            15 |                   | f
--   5 |    8892 | 2016-01-01 |     153.27 |            15 |                   | f
-- (5 rows)


-- Write a SQL query to get the top 10 spenders in 2016.

SELECT user_id, SUM(item_total) AS spending_total
FROM orders
GROUP BY user_id, item_total
ORDER BY item_total DESC                                                                                                      LIMIT 10;
LIMIT 10;

-- user_id | spending_total
-- ---------+----------------
--    8134 |         222.96
--    7242 |         222.49
--    8413 |         222.23
--    7242 |         221.93
--    6934 |         221.54
--    6383 |         221.28
--    7242 |         221.18
--    6792 |         221.17
--    4635 |          221.1
--    5800 |         220.75
-- (10 rows)


-- Query the second highest order item_total for each user, if the user purchased
-- more than once.

-- Table with true max
With true_max AS (
  SELECT user_id, MAX(item_total) AS max_item_total
  FROM orders
  GROUP BY user_id
  )

-- Get max that is not in true max table, resulting in a second max
SELECT orders.user_id, MAX(orders.item_total) AS second_highest
FROM orders
LEFT JOIN true_max ON true_max.user_id = orders.user_id
  AND true_max.max_item_total = orders.item_total
WHERE true_max.max_item_total IS NULL
GROUP BY orders.user_id
LIMIT 10;

-- user_id | second_highest
-- ---------+----------------
--       2 |         176.22
--       3 |         115.42
--       4 |         143.94
--       5 |         165.57
--       7 |         137.25
--       9 |         179.54
--      10 |          152.4
--      11 |         178.92
--      13 |         153.64
--      14 |          71.06
-- (10 rows)
