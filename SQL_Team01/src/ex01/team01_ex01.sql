WITH
  balance_table AS (
    SELECT
      balance.user_id,
      currency.id currency_id,
      currency.name currency_name,
      balance.money,
      (SELECT
        currency.rate_to_usd
      FROM
        currency
      WHERE
        currency.id = balance.currency_id
      AND
        currency.updated < balance.updated
      ORDER BY
        currency.updated DESC
      LIMIT
        1
      ) past_rate,
      (SELECT
        currency.rate_to_usd
      FROM
        currency
      WHERE
        currency.id = balance.currency_id
      AND
        currency.updated > balance.updated
      ORDER BY
        currency.updated ASC
      LIMIT
        1
      ) future_rate
    FROM
      balance
    JOIN
      currency
    ON
      balance.currency_id = currency.id
    GROUP BY
      balance.user_id,
      currency.id,
      balance.currency_id,
      balance.money,
      balance.updated,
      currency.name
  )
SELECT
  COALESCE("user".name, 'not defined') name,
  COALESCE("user".lastname, 'not defined') lastname,
  balance_table.currency_name,
  balance_table.money * COALESCE(balance_table. past_rate, balance_table. future_rate) currency_in_usd
FROM
  balance_table
LEFT JOIN
  "user"
ON
  balance_table.user_id = "user".id
ORDER BY
  1 DESC,
  2,
  3
;
