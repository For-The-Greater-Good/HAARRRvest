# Content Store

This directory contains deduplicated content from web scraping operations.

## Structure

- `content/` - Raw scraped content files organized by hash prefix
- `results/` - Processed results from LLM analysis
- `index.db` - SQLite database tracking content hashes and job IDs

## Purpose

The content store prevents duplicate processing of identical content by storing SHA-256 hashes of scraped data. When content is scraped, it's checked against this store to avoid expensive reprocessing.

This directory is synced by the pantry-pirate-radio publisher service.