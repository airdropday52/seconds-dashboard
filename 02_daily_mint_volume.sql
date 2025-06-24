SELECT
  date_trunc('day', block_time) AS day,
  COUNT(*) AS mint_count,
  SUM(value / 1e18) AS total_minted
FROM ethereum.logs
WHERE contract_address = '\xaf67e72dc47dcb2d48ecbc56950473d793d70c18'
  AND topic_0 = '\xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef'
  AND topic_1 = '0x0000000000000000000000000000000000000000'
GROUP BY 1
ORDER BY 1;