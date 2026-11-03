IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = N'load_log'
      AND schema_id = SCHEMA_ID(N'etl')
)
BEGIN
    CREATE TABLE [etl].[load_log]
    (
        [load_log_id]       BIGINT IDENTITY(1,1) PRIMARY KEY,
        [dwh_batch_id]      INT NULL,
        [source_file]       NVARCHAR(260) NOT NULL,
        [destination_table] NVARCHAR(260) NOT NULL,
        [loaded_row_count]  BIGINT NOT NULL,
        [log_ts]            DATETIME2 NOT NULL DEFAULT SYSDATETIME()
    );
END;