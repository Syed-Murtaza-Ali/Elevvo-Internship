-- === 01_top_tracks_by_revenue ===

-- Top-selling products (Tracks) by revenue
WITH revenue AS (
  SELECT
    il.TrackId,
    SUM(il.UnitPrice * il.Quantity) AS revenue
  FROM InvoiceLine il
  GROUP BY il.TrackId
)
SELECT
  t.TrackId,
  t.Name AS track_name,
  a.Title AS album_title,
  ar.Name AS artist_name,
  ROUND(r.revenue, 2) AS revenue
FROM revenue r
JOIN Track t   ON t.TrackId = r.TrackId
JOIN Album a   ON a.AlbumId = t.AlbumId
JOIN Artist ar ON ar.ArtistId = a.ArtistId
ORDER BY r.revenue DESC
LIMIT 20;


-- === 02_revenue_per_region ===

-- Revenue per billing country (region)
SELECT
  i.BillingCountry AS country,
  ROUND(SUM(i.Total), 2) AS revenue
FROM Invoice i
GROUP BY i.BillingCountry
ORDER BY revenue DESC;


-- === 03_monthly_performance ===

-- Monthly performance (revenue by month, SQLite)
SELECT
  strftime('%Y-%m', i.InvoiceDate) AS year_month,
  ROUND(SUM(i.Total), 2) AS revenue
FROM Invoice i
GROUP BY strftime('%Y-%m', i.InvoiceDate)
ORDER BY year_month;


-- === 04_view_join_heavy ===

-- JOIN-heavy reusable view combining product + sales context
CREATE VIEW IF NOT EXISTS v_sales_product AS
SELECT
  il.InvoiceLineId,
  i.InvoiceId,
  i.InvoiceDate,
  i.BillingCountry,
  c.CustomerId,
  c.FirstName || ' ' || c.LastName AS customer_name,
  t.TrackId,
  t.Name AS track_name,
  g.Name AS genre_name,
  a.AlbumId,
  a.Title AS album_title,
  ar.ArtistId,
  ar.Name AS artist_name,
  il.UnitPrice,
  il.Quantity,
  (il.UnitPrice * il.Quantity) AS line_revenue
FROM InvoiceLine il
JOIN Invoice  i  ON i.InvoiceId  = il.InvoiceId
JOIN Customer c  ON c.CustomerId = i.CustomerId
JOIN Track    t  ON t.TrackId    = il.TrackId
LEFT JOIN Genre g ON g.GenreId   = t.GenreId
JOIN Album    a  ON a.AlbumId    = t.AlbumId
JOIN Artist   ar ON ar.ArtistId  = a.ArtistId;


-- === 05_bonus_window_fn ===

-- Bonus: Window function (Top 3 tracks per country by revenue)
WITH track_country AS (
  SELECT
    i.BillingCountry AS country,
    t.TrackId,
    t.Name AS track_name,
    SUM(il.UnitPrice * il.Quantity) AS revenue
  FROM InvoiceLine il
  JOIN Invoice i ON i.InvoiceId = il.InvoiceId
  JOIN Track t   ON t.TrackId   = il.TrackId
  GROUP BY i.BillingCountry, t.TrackId, t.Name
),
ranked AS (
  SELECT
    country,
    TrackId,
    track_name,
    revenue,
    RANK() OVER (PARTITION BY country ORDER BY revenue DESC) AS rnk
  FROM track_country
)
SELECT country, track_name, ROUND(revenue, 2) AS revenue, rnk
FROM ranked
WHERE rnk <= 3
ORDER BY country, rnk, track_name;


