## Project Overview

This BrightLearn data engineering project uses the **Brazilian E-Commerce Public Dataset by Olist**, which contains approximately 100,000 orders placed between 2016 and 2018. Olist connects small merchants with customers through the Olist Store. Sellers fulfil orders through logistics partners, and customers receive a satisfaction survey after delivery or once the estimated delivery date has passed.

[View the Olist dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## Business Problem Statement

Answering questions about sales, delivery performance, and customer satisfaction requires combining data from nine CSV files. The files record different levels of detail. For example, one order can have several items and several payments. Joining those records directly by order ID can inflate totals. Missing fields, inconsistent values, and dates and amounts stored as text also need to be handled before the data can support reliable reporting.

## Project Goal

Build an end-to-end ETL pipeline in **SQL Server** using **SQL Server Integration Services (SSIS)** and the **Medallion Architecture** (Bronze → Silver → Gold). Preserve source data in Bronze, clean and validate it in Silver, and model a **star schema** in Gold for reporting and analysis. Document the architecture, data flows, and star schema using **draw.io** and **Mermaid**.

## Summary of Work by Phase

### Phase 1 · Bronze Load (`01_bronze_load.dtsx`)

**Goal** — Load all nine source CSVs into SQL Server while preserving their field values as supplied.

**Output** — Loaded all nine files into the `bronze` schema in `olist_dwh`. Source fields were stored as `NVARCHAR`, with a load timestamp, source filename, and batch ID added for traceability.

#### Python and SQL Record-Count Verification

Source records were counted with Python’s `csv.reader` using UTF-8 decoding and `newline=""`, excluding the header record. The results were compared with SQL `COUNT(*)` totals for the corresponding Bronze tables.

**Acceptance result — PASS.** All nine Bronze row counts matched their corresponding CSV record counts.

| Verification | CSV records | Bronze rows | Difference |
| --- | ---: | ---: | ---: |
| `orders` after reload | 99,441 | 99,441 | 0 |
| `order_reviews` | 99,224 | 99,224 | 0 |

**Investigation note** — `bronze.orders` initially contained 298,323 rows against 99,441 source records. After truncating the table and running the load once, the Bronze count matched the source count of 99,441.

**Review comments with line breaks** — Quoted review comments can span several physical lines. Python’s CSV parser reads each quoted multiline comment as part of a single record, allowing the source count to be compared accurately with the Bronze row count.

### Phase 2 · Silver Transform (`02_silver_transform.dtsx`)

**Goal** — Produce typed, standardised, and validated data, with duplicate handling based on what each table’s rows represent.

**Output** — Built SSIS data flows to load cleaned data into the `silver` schema. The transformations trimmed text, converted dates and numeric fields, standardised values, and routed rejected records for review. ZIP prefixes were kept as five-character text, `not_defined` payment types were mapped to `unknown`, and order items were validated using the combination of `order_id` and `order_item_id` to preserve multiple legitimate items per order.# olist_ssis_medallion_datawarehouse_project