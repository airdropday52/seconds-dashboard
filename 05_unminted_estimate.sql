WITH seconds_since_genesis AS (
  SELECT extract(epoch FROM now() - TIMESTAMP '2025-06-18 03:30:00') AS seconds_passed
),
tokens_minted AS (
  SELECT SUM(value / 1e18) AS total_minted
  FROM ethereum.logs
  WHERE contract_address = '\xaf67e72dc47dcb2d48ecbc56950473d793d70c18'
    AND topic_0 = '\xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef'
    AND topic_1 = '0x0000000000000000000000000000000000000000'
)
SELECT
  s.seconds_passed,
  t.total_minted,
  s.seconds_passed - t.total_minted AS estimated_unminted_tokens
FROM seconds_since_genesis s, tokens_minted t;