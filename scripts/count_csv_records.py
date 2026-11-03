import csv
from pathlib import Path

# Folder containing the nine original CSV files.
folder = Path(
    r"C:\Users\KegoM\OneDrive\Desktop"
    r"\olist_ssis_medallion_datawarehouse_project\Olist_Rawdata"
)

if not folder.is_dir():
    raise SystemExit(f"Folder not found: {folder}")

files = sorted(folder.glob("*.csv"))

if not files:
    raise SystemExit(f"No CSV files found in: {folder}")

print("| Source file | CSV records excluding header |")
print("|---|---:|")

for file in files:
    with file.open(
        mode="r",
        encoding="utf-8-sig",
        newline=""
    ) as source:
        reader = csv.reader(source, strict=True)

        next(reader, None)  # Skip the header record.
        record_count = sum(1 for _ in reader)

    print(f"| {file.name} | {record_count} |")

print(f"\nFiles counted: {len(files)}")

if len(files) != 9:
    print("CHECK: Expected 9 CSV files. Review the folder contents.")