# HAARRRvest 🏴‍☠️ - Public Domain Food Resource Data Repository

<!-- HARVESTER AUTO-GENERATED SECTION START -->
## Last Update

- **Date**: 2025-08-05 19:52:41 UTC
- **Total Records**: 7708
- **Data Sources**: 17
- **Date Range**: 2025-07-23 to 2025-08-05

## Data Structure

- `daily/` - Historical data organized by date
- `latest/` - Most recent data for each scraper
- `sql_dumps/` - PostgreSQL dumps for fast initialization
- `sqlite/` - SQLite database exports for Datasette
- `content_store/` - Content deduplication store (if configured)

## Usage

This data follows the OpenReferral Human Services Data Specification (HSDS).

For more information, visit the [Pantry Pirate Radio project](https://github.com/For-The-Greater-Good/pantry-pirate-radio).
<!-- HARVESTER AUTO-GENERATED SECTION END -->


An open data repository containing food resource information harvested by Pantry Pirate Radio. All data is released to the public domain under CC0 1.0 Universal.

## 🔍 Explore the Data Interactively

### [**Launch Interactive Explorer →**](https://for-the-greater-good.github.io/HAARRRvest/)

Explore the data directly in your browser with SQL queries, no installation required!

## 📊 About This Data Repository

- **Type**: Open Data Repository
- **License**: CC0 1.0 Universal (Public Domain)
- **Coverage**: United States food resources
- **Standard**: [HSDS v3.1.1](https://docs.openreferral.org/en/latest/) compliant
- **Update Frequency**: Daily automated updates
- **Formats**: SQLite database, JSON archives, GeoJSON exports

## 🗂️ Directory Structure

```
├── daily/                     # Historical data by date
│   └── YYYY-MM-DD/
│       ├── summary.json       # Daily summary
│       ├── scrapers/          # Raw scraper outputs
│       └── processed/         # LLM-processed data
├── latest/                    # Most recent data per scraper
├── content-store/             # Content deduplication data
│   ├── content/               # SHA-256 organized content files
│   ├── results/               # Processing results for deduplicated content
│   └── metadata.json          # Store metadata and statistics
├── sqlite/                    # SQLite database for queries
│   └── pantry_pirate_radio.sqlite
└── index.html                 # Interactive Datasette-Lite interface
```

## 🚀 Getting Started

### Browse Online
Visit our [GitHub Pages site](https://for-the-greater-good.github.io/HAARRRvest/) to explore the data interactively.

### Download Database
Download the [latest SQLite database](sqlite/pantry_pirate_radio.sqlite) to query locally.

### Clone Repository
```bash
git clone https://github.com/For-The-Greater-Good/HAARRRvest.git
cd HAARRRvest
```

## 📝 Example Queries

### Find Food Pantries by City
```sql
SELECT name, address_1, city, state_province, latitude, longitude
FROM locations
WHERE city = 'Brooklyn' AND state_province = 'NY'
ORDER BY name;
```

### Organizations with Multiple Locations
```sql
SELECT o.name, COUNT(l.id) as location_count
FROM organizations o
JOIN locations l ON o.id = l.organization_id
GROUP BY o.id, o.name
HAVING COUNT(l.id) > 5
ORDER BY location_count DESC;
```

### Services by Type
```sql
SELECT s.name, s.description, o.name as organization
FROM services s
JOIN organizations o ON s.organization_id = o.id
WHERE s.name LIKE '%food%' OR s.description LIKE '%pantry%'
LIMIT 20;
```

## 🛠️ Using the Data

### With Datasette
```bash
pip install datasette
datasette sqlite/pantry_pirate_radio.sqlite
```

### With Python
```python
import sqlite3
import pandas as pd

conn = sqlite3.connect('sqlite/pantry_pirate_radio.sqlite')
df = pd.read_sql_query("SELECT * FROM locations WHERE state_province = 'NY'", conn)
```

### With DuckDB
```sql
-- Install and load SQLite extension
INSTALL sqlite_scanner;
LOAD sqlite_scanner;

-- Query the database
SELECT * FROM sqlite_scan('sqlite/pantry_pirate_radio.sqlite', 'locations');
```

## 📅 Update Schedule

- **Daily Updates**: New data is synchronized every day at 4 AM UTC
- **Real-time Status**: Check the [Actions tab](https://github.com/For-The-Greater-Good/pantry-pirate-radio/actions) for pipeline status
- **Last Update**: See [LAST_UPDATE.md](LAST_UPDATE.md) for details

## 📜 License & Usage

This data repository is dedicated to the public domain under **[CC0 1.0 Universal](LICENSE)**.

You are free to:
- Copy, modify, and distribute this data
- Use the data for any purpose, including commercial use
- Build upon, transform, and create derivative works
- No attribution required (though appreciated)

The data is provided "as-is" without warranties. See the [full license](LICENSE) for details.

## 📚 Important: Cite Original Sources, Not Us

This repository aggregates data harvested from various sources across the web. **Please cite the original data sources, not this repository.**

### How to Find Original Sources

Each record in our dataset includes metadata fields that identify the original source:
- Check the `source_url` or similar fields in the data
- Look for organization websites and contact information
- The data itself contains attribution to the original providers

### Why This Matters

- The organizations providing food assistance deserve recognition for their work
- We are merely aggregating publicly available information
- Original sources should receive credit for maintaining and publishing this data
- We do not seek or want attribution for this aggregation

**Please respect and acknowledge the original data providers when using this information.**

## 🤝 Contributing

Found an issue with the data? Please [open an issue](https://github.com/For-The-Greater-Good/pantry-pirate-radio/issues) in the main repository.

## 📚 Learn More

- [Main Project Repository](https://github.com/For-The-Greater-Good/pantry-pirate-radio)
- [HSDS Specification](https://docs.openreferral.org/en/latest/)
- [API Documentation](https://github.com/For-The-Greater-Good/pantry-pirate-radio/blob/main/docs/api.md)
