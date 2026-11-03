-- 1. Customers
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'customers'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    CREATE TABLE [bronze].[customers]
    (
        [customer_id]                  NVARCHAR(50),
        [customer_unique_id]           NVARCHAR(50),
        [customer_zip_code_prefix]     NVARCHAR(50),
        [customer_city]                NVARCHAR(255),
        [customer_state]               NVARCHAR(50),

        [dwh_load_ts]                  DATETIME2 DEFAULT SYSDATETIME(),
        [dwh_source_file]              NVARCHAR(260),
        [dwh_batch_id]                 INT
    );
END;

-- 2. Geolocation
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'geolocation'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    CREATE TABLE [bronze].[geolocation]
    (
        [geolocation_zip_code_prefix]  NVARCHAR(50),
        [geolocation_lat]              NVARCHAR(100),
        [geolocation_lng]              NVARCHAR(100),
        [geolocation_city]             NVARCHAR(255),
        [geolocation_state]            NVARCHAR(50),

        [dwh_load_ts]                  DATETIME2 DEFAULT SYSDATETIME(),
        [dwh_source_file]              NVARCHAR(260),
        [dwh_batch_id]                 INT
    );
END;

-- 3. Order items
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'order_items'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    CREATE TABLE [bronze].[order_items]
    (
        [order_id]                     NVARCHAR(50),
        [order_item_id]                NVARCHAR(50),
        [product_id]                   NVARCHAR(50),
        [seller_id]                    NVARCHAR(50),
        [shipping_limit_date]          NVARCHAR(100),
        [price]                        NVARCHAR(100),
        [freight_value]                NVARCHAR(100),

        [dwh_load_ts]                  DATETIME2 DEFAULT SYSDATETIME(),
        [dwh_source_file]              NVARCHAR(260),
        [dwh_batch_id]                 INT
    );
END;

-- 4. Order payments
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'order_payments'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    CREATE TABLE [bronze].[order_payments]
    (
        [order_id]                     NVARCHAR(50),
        [payment_sequential]           NVARCHAR(50),
        [payment_type]                 NVARCHAR(100),
        [payment_installments]         NVARCHAR(50),
        [payment_value]                NVARCHAR(100),

        [dwh_load_ts]                  DATETIME2 DEFAULT SYSDATETIME(),
        [dwh_source_file]              NVARCHAR(260),
        [dwh_batch_id]                 INT
    );
END;

-- 5. Order reviews
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'order_reviews'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    CREATE TABLE [bronze].[order_reviews]
    (
        [review_id]                    NVARCHAR(50),
        [order_id]                     NVARCHAR(50),
        [review_score]                 NVARCHAR(50),
        [review_comment_title]         NVARCHAR(MAX),
        [review_comment_message]       NVARCHAR(MAX),
        [review_creation_date]         NVARCHAR(100),
        [review_answer_timestamp]      NVARCHAR(100),

        [dwh_load_ts]                  DATETIME2 DEFAULT SYSDATETIME(),
        [dwh_source_file]              NVARCHAR(260),
        [dwh_batch_id]                 INT
    );
END;

-- 6. Orders
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'orders'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    CREATE TABLE [bronze].[orders]
    (
        [order_id]                       NVARCHAR(50),
        [customer_id]                    NVARCHAR(50),
        [order_status]                   NVARCHAR(100),
        [order_purchase_timestamp]       NVARCHAR(100),
        [order_approved_at]              NVARCHAR(100),
        [order_delivered_carrier_date]   NVARCHAR(100),
        [order_delivered_customer_date]  NVARCHAR(100),
        [order_estimated_delivery_date]  NVARCHAR(100),

        [dwh_load_ts]                    DATETIME2 DEFAULT SYSDATETIME(),
        [dwh_source_file]                NVARCHAR(260),
        [dwh_batch_id]                   INT
    );
END;

-- 7. Products
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'products'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    CREATE TABLE [bronze].[products]
    (
        [product_id]                   NVARCHAR(50),
        [product_category_name]        NVARCHAR(255),
        [product_name_lenght]          NVARCHAR(50),
        [product_description_lenght]   NVARCHAR(50),
        [product_photos_qty]           NVARCHAR(50),
        [product_weight_g]             NVARCHAR(100),
        [product_length_cm]            NVARCHAR(100),
        [product_height_cm]            NVARCHAR(100),
        [product_width_cm]             NVARCHAR(100),

        [dwh_load_ts]                  DATETIME2 DEFAULT SYSDATETIME(),
        [dwh_source_file]              NVARCHAR(260),
        [dwh_batch_id]                 INT
    );
END;

-- 8. Sellers
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'sellers'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    CREATE TABLE [bronze].[sellers]
    (
        [seller_id]                    NVARCHAR(50),
        [seller_zip_code_prefix]       NVARCHAR(50),
        [seller_city]                  NVARCHAR(255),
        [seller_state]                 NVARCHAR(50),

        [dwh_load_ts]                  DATETIME2 DEFAULT SYSDATETIME(),
        [dwh_source_file]              NVARCHAR(260),
        [dwh_batch_id]                 INT
    );
END;

-- 9. Product category name translation
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'product_category_name_translation'
      AND schema_id = SCHEMA_ID(N'bronze')
)
BEGIN
    CREATE TABLE [bronze].[product_category_name_translation]
    (
        [product_category_name]          NVARCHAR(255),
        [product_category_name_english]  NVARCHAR(255),

        [dwh_load_ts]                    DATETIME2 DEFAULT SYSDATETIME(),
        [dwh_source_file]                NVARCHAR(260),
        [dwh_batch_id]                   INT
    );
END;