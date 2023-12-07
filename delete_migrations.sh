#!/bin/bash

# Get a list of directories (apps) in the current directory
apps=$(find . -maxdepth 1 -type d -printf "%f\n" | tail -n +2)

# Loop through all apps in the current directory
for app_name in $apps; do
  migration_folder="$app_name/migrations"

  # Check if the directory contains a migrations folder
  if [ -d "$migration_folder" ]; then
    echo "Processing $app_name..."
    cd "$migration_folder" || continue

    migration_files=$(find . -maxdepth 1 -type f -regex '.*/[0-9]+_.*\.py' -exec basename {} \;)
    initial_files=$(find . -maxdepth 1 -type f -regex '.*/[0-9]+_initial\.py' -exec basename {} \;)

    if [ -n "$migration_files" ] && [ -n "$initial_files" ]; then
      echo "The following files in $app_name will be deleted (excluding *_initial.py):"

      for file in $migration_files; do
        if ! echo "$file" | grep -qE '^[0-9]+_initial\.py$'; then
          echo "$file"
        fi
      done

      read -rp "Are you sure you want to delete these files in $app_name? (Y/N): " choice

      if echo "$choice" | grep -iq "^y"; then
        echo "Deleting files..."
        for file in $migration_files; do
          if ! echo "$file" | grep -qE '^[0-9]+_initial\.py$'; then
            rm "$file"
          fi
        done
        echo "Deletion complete for $app_name."
      else
        echo "Deletion canceled for $app_name."
      fi
    else
      echo "No additional migration files found in $app_name or *_initial.py missing."
    fi
    cd ../../  # Move back to the project root directory for the next iteration
  fi
done
