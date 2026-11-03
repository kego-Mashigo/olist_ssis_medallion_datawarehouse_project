-- 1. Customers
INSERT INTO [etl].[load_log]
(
    [dwh_batch_id],
    [source_file],
    [destination_table],
    [loaded_row_count]
)
SELECT
    MAX([dwh_batch_id]),
    N'olist_customers_dataset.csv',
    N'bronze.customers',
    COUNT_BIG(*)
FROM [bronze].[customers];


-- 2. Geolocation
INSERT INTO [etl].[load_log]
(
    [dwh_batch_id],
    [source_file],
    [destination_table],
    [loaded_row_count]
)
SELECT
    MAX([dwh_batch_id]),
    N'olist_geolocation_dataset.csv',
    N'bronze.geolocation',
    COUNT_BIG(*)
FROM [bronze].[geolocation];


-- 3. Order items
INSERT INTO [etl].[load_log]
(
    [dwh_batch_id],
    [source_file],
    [destination_table],
    [loaded_row_count]
)
SELECT
    MAX([dwh_batch_id]),
    N'olist_order_items_dataset.csv',
    N'bronze.order_items',
    COUNT_BIG(*)
FROM [bronze].[order_items];


-- 4. Order payments
INSERT INTO [etl].[load_log]
(
    [dwh_batch_id],
    [source_file],
    [destination_table],
    [loaded_row_count]
)
SELECT
    MAX([dwh_batch_id]),
    N'olist_order_payments_dataset.csv',
    N'bronze.order_payments',
    COUNT_BIG(*)
FROM [bronze].[order_payments];


-- 5. Order reviews
INSERT INTO [etl].[load_log]
(
    [dwh_batch_id],
    [source_file],
    [destination_table],
    [loaded_row_count]
)
SELECT
    MAX([dwh_batch_id]),
    N'olist_order_reviews_dataset.csv',
    N'bronze.order_reviews',
    COUNT_BIG(*)
FROM [bronze].[order_reviews];


-- 6. Orders
INSERT INTO [etl].[load_log]
(
    [dwh_batch_id],
    [source_file],
    [destination_table],
    [loaded_row_count]
)
SELECT
    MAX([dwh_batch_id]),
    N'olist_orders_dataset.csv',
    N'bronze.orders',
    COUNT_BIG(*)
FROM [bronze].[orders];


-- 7. Products
INSERT INTO [etl].[load_log]
(
    [dwh_batch_id],
    [source_file],
    [destination_table],
    [loaded_row_count]
)
SELECT
    MAX([dwh_batch_id]),
    N'olist_products_dataset.csv',
    N'bronze.products',
    COUNT_BIG(*)
FROM [bronze].[products];


-- 8. Sellers
INSERT INTO [etl].[load_log]
(
    [dwh_batch_id],
    [source_file],
    [destination_table],
    [loaded_row_count]
)
SELECT
    MAX([dwh_batch_id]),
    N'olist_sellers_dataset.csv',
    N'bronze.sellers',
    COUNT_BIG(*)
FROM [bronze].[sellers];


-- 9. Product category name translation
INSERT INTO [etl].[load_log]
(
    [dwh_batch_id],
    [source_file],
    [destination_table],
    [loaded_row_count]
)
SELECT
    MAX([dwh_batch_id]),
    N'product_category_name_translation.csv',
    N'bronze.product_category_name_translation',
    COUNT_BIG(*)
FROM [bronze].[product_category_name_translation];