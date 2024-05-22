SELECT
  COALESCE (user_table.name, 'not defined') name,
  COALESCE (user_table.lastname, 'not defined') lastname,
  type,
  volume,
  COALESCE (currency_table.name, 'not defined') currency_name,
  COALESCE (rate_to_usd, 1) last_rate_to_usd,
  COALESCE (rate_to_usd, 1) * volume total_volume_in_usd
FROM "user" user_table
FULL JOIN (
  SELECT user_id, currency_id, type, sum (money) volume
  FROM balance
  GROUP BY 1, 2, 3
) balance_table
ON user_table.id = balance_table.user_id
FULL JOIN (
  SELECT * FROM currency ORDER BY updated DESC
  LIMIT 3
) currency_table ON currency_table.id = balance_table.currency_id
ORDER BY 1 DESC, 2, 3;


