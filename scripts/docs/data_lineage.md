# Bronze Data Lineage and Row-Count Reconciliation

## Load details

- Package: 01_bronze_load.dtsx
- Database: olist_dwh
- Batch ID: ENTER ACTUAL BATCH ID
- Load date: ENTER ACTUAL LOAD DATE
- Comparison date: ENTER ACTUAL COMPARISON DATE

## Loading approach

Each original CSV is loaded into its corresponding Bronze table.
All source columns are stored as NVARCHAR.
Metadata records the load timestamp, source filename, and batch ID.
Bronze tables are truncated before each full reload.

## Record-count methods

- CSV: Python csv.reader, excluding the header record.
- SQL Server: COUNT_BIG(*) on each Bronze table after loading.
- Quoted comments containing line breaks count as one CSV record.
- Difference = Bronze rows minus CSV records.
- PASS means the difference is zero.
- FAIL means the counts do not match.

## Comparison results

| Source file | Destination table | CSV records excluding header | Bronze rows | Difference | Result |
|---|---|---:|---:|---:|---|
| olist_customers_dataset.csv | bronze.customers | 99441 | 99441 | 0 | PASS |
| olist_geolocation_dataset.csv | bronze.geolocation | 1000163 | 1000163 | 0 | PASS |
| olist_order_items_dataset.csv | bronze.order_items | 112650 | 112650 | 0 | PASS |
| olist_order_payments_dataset.csv | bronze.order_payments | 103886 | 103886 | 0 | PASS |
| olist_order_reviews_dataset.csv | bronze.order_reviews | 99224 | 99224 | 0 | PASS |
| olist_orders_dataset.csv | bronze.orders | 99441 | 99441 | 0 | PASS |
| olist_products_dataset.csv | bronze.products | 32951 | 32951 | 0 | PASS |
| olist_sellers_dataset.csv | bronze.sellers | 3095 | 3095 | 0 | PASS |
| product_category_name_translation.csv | bronze.product_category_name_translation | 71 | 71 | 0 | PASS |

## Acceptance status

PASS: All nine Bronze row counts match their corresponding CSV
record counts, excluding headers.

## Investigation notes

The orders table initially contained 298323 rows against 99441
source records. After truncating the table and reloading once,
the Bronze count matched the source count of 99441.

## Review comments containing line breaks

Review comments may contain embedded line breaks inside quoted CSV
fields. Physical line counts therefore do not represent record counts.

Source records were counted using Python csv.reader with newline=""
and UTF-8 decoding, excluding the header record.

- CSV review records: 99224
- Bronze review rows: 99224
- Difference: 0
- Result: PASS