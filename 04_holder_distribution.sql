WITH balances AS (
  SELECT
    "to" AS holder,
    SUM(value / 1e18) AS balance
  FROM erc20."ERC20_evt_Transfer"
  WHERE contract_address = '\xaf67e72dc47dcb2d48ecbc56950473d793d70c18'
  GROUP BY 1
)
SELECT
  CASE
    WHEN balance < 100 THEN '<100'
    WHEN balance < 1000 THEN '100–999'
    WHEN balance < 10000 THEN '1K–10K'
    ELSE '10K+'
  END AS category,
  COUNT(*) AS holder_count
FROM balances
GROUP BY 1
ORDER BY 1;