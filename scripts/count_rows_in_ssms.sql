USE [olist_dwh];
GO

SELECT N'customers' AS table_name, COUNT_BIG(*) AS bronze_rows
FROM [bronze].[customers]
UNION ALL
SELECT N'geolocation', COUNT_BIG(*)
FROM [bronze].[geolocation]
UNION ALL
SELECT N'order_items', COUNT_BIG(*)
FROM [bronze].[order_items]
UNION ALL
SELECT N'order_payments', COUNT_BIG(*)
FROM [bronze].[order_payments]
UNION ALL
SELECT N'order_reviews', COUNT_BIG(*)
FROM [bronze].[order_reviews]
UNION ALL
SELECT N'orders', COUNT_BIG(*)
FROM [bronze].[orders]
UNION ALL
SELECT N'products', COUNT_BIG(*)
FROM [bronze].[products]
UNION ALL
SELECT N'sellers', COUNT_BIG(*)
FROM [bronze].[sellers]
UNION ALL
SELECT N'product_category_name_translation', COUNT_BIG(*)
FROM [bronze].[product_category_name_translation];