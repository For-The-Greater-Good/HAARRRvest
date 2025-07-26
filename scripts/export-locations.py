#!/usr/bin/env python3
"""
Export location data from SQLite database to JSON for web mapping interface.
This script generates optimized JSON files for the interactive food pantry map.
"""

import sqlite3
import json
import os
import sys
from datetime import datetime, timezone
from pathlib import Path


def main():
    # Path to the SQLite database
    db_path = Path(__file__).parent.parent / "sqlite" / "pantry_pirate_radio.sqlite"
    
    if not db_path.exists():
        print(f"Error: Database not found at {db_path}", file=sys.stderr)
        sys.exit(1)
    
    # Connect to database
    try:
        conn = sqlite3.connect(db_path)
        conn.row_factory = sqlite3.Row  # Enable column access by name
        cursor = conn.cursor()
        
        print("Connected to database successfully")
        
        # Query location_master view for all location data
        query = """
        SELECT 
            location_id as id,
            latitude as lat,
            longitude as lng,
            location_name as name,
            organization_name as org,
            COALESCE(address_1, '') || 
                CASE WHEN address_2 IS NOT NULL AND address_2 != '' 
                     THEN ', ' || address_2 
                     ELSE '' END ||
                CASE WHEN city IS NOT NULL 
                     THEN ', ' || city 
                     ELSE '' END ||
                CASE WHEN state_province IS NOT NULL 
                     THEN ', ' || state_province 
                     ELSE '' END ||
                CASE WHEN postal_code IS NOT NULL 
                     THEN ' ' || postal_code 
                     ELSE '' END as address,
            city,
            state_province as state,
            postal_code as zip,
            phone_numbers as phone,
            organization_website as website,
            organization_description as description,
            organization_email as email,
            location_description as location_desc,
            address_1,
            address_2
        FROM location_master
        WHERE latitude IS NOT NULL 
          AND longitude IS NOT NULL
          AND latitude BETWEEN -90 AND 90
          AND longitude BETWEEN -180 AND 180
        ORDER BY state_province, city, location_name
        """
        
        cursor.execute(query)
        rows = cursor.fetchall()
        
        if not rows:
            print("Warning: No location data found in database", file=sys.stderr)
            sys.exit(1)
        
        print(f"Found {len(rows)} locations with valid coordinates")
        
        # Convert to list of dictionaries
        locations = []
        states = set()
        
        for row in rows:
            # Clean up phone numbers (remove duplicates and format)
            phone = row["phone"] or ""
            if phone:
                # Split by semicolon and remove duplicates
                phones = [p.strip() for p in phone.split(';')]
                phones = list(dict.fromkeys(phones))  # Remove duplicates while preserving order
                phone = phones[0] if phones else ""  # Use first phone number
            
            # Clean up data
            location = {
                "id": row["id"],
                "lat": float(row["lat"]),
                "lng": float(row["lng"]),
                "name": row["name"] or "Food Assistance Location",
                "org": row["org"] or "Community Organization",
                "address": row["address"] or "Address not available",
                "city": row["city"] or "",
                "state": row["state"] or "",
                "zip": row["zip"] or "",
                "phone": phone,
                "website": row["website"] or "",
                "email": row["email"] or "",
                "description": row["description"] or row["location_desc"] or ""
            }
            
            # Track states for coverage info
            if location["state"]:
                states.add(location["state"])
            
            locations.append(location)
        
        # Create metadata
        metadata = {
            "generated": datetime.now(timezone.utc).isoformat(),
            "total_locations": len(locations),
            "states_covered": len(states),
            "coverage": f"{len(states)} US states/territories",
            "source": "HAARRRvest - Pantry Pirate Radio Database",
            "database_path": str(db_path.name),
            "format_version": "1.0"
        }
        
        # Create complete dataset
        output_data = {
            "metadata": metadata,
            "locations": locations
        }
        
        # Ensure data directory exists
        data_dir = Path(__file__).parent.parent / "data"
        data_dir.mkdir(exist_ok=True)
        
        # Write main locations file
        output_file = data_dir / "locations.json"
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(output_data, f, separators=(',', ':'), ensure_ascii=False)
        
        print(f"Exported {len(locations)} locations to {output_file}")
        
        # Create state-specific files for performance optimization
        states_dir = data_dir / "states"
        states_dir.mkdir(exist_ok=True)
        
        locations_by_state = {}
        for location in locations:
            state = location["state"] or "UNKNOWN"
            if state not in locations_by_state:
                locations_by_state[state] = []
            locations_by_state[state].append(location)
        
        # Export state files
        for state, state_locations in locations_by_state.items():
            if state and state != "UNKNOWN":
                state_metadata = metadata.copy()
                state_metadata["total_locations"] = len(state_locations)
                state_metadata["filtered_by"] = f"state = {state}"
                
                state_data = {
                    "metadata": state_metadata,
                    "locations": state_locations
                }
                
                state_file = states_dir / f"{state.lower()}.json"
                with open(state_file, 'w', encoding='utf-8') as f:
                    json.dump(state_data, f, separators=(',', ':'), ensure_ascii=False)
        
        print(f"Created state-specific files for {len(locations_by_state)} states")
        
        # Print summary statistics
        print("\n=== Export Summary ===")
        print(f"Total locations: {len(locations)}")
        print(f"States covered: {sorted(states)}")
        print(f"Generated: {metadata['generated']}")
        print(f"Output files:")
        print(f"  - Main: {output_file}")
        print(f"  - States: {len(locations_by_state)} files in {states_dir}")
        
        # Data quality check
        no_phone = sum(1 for loc in locations if not loc["phone"])
        no_website = sum(1 for loc in locations if not loc["website"])
        no_description = sum(1 for loc in locations if not loc["description"])
        
        print(f"\n=== Data Quality ===")
        print(f"Locations missing phone: {no_phone} ({no_phone/len(locations)*100:.1f}%)")
        print(f"Locations missing website: {no_website} ({no_website/len(locations)*100:.1f}%)")
        print(f"Locations missing description: {no_description} ({no_description/len(locations)*100:.1f}%)")
        
    except sqlite3.Error as e:
        print(f"Database error: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        sys.exit(1)
    finally:
        if conn:
            conn.close()
    
    print("\nExport completed successfully!")


if __name__ == "__main__":
    main()