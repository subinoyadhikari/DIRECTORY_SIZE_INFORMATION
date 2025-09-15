#!/bin/bash

# Check if directory is provided as argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Store directory path
DIR="$1"

# Check if directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist"
    exit 1
fi

# Output file
OUTPUT_FILE="file_sizes.txt"

# Get total size of the directory
TOTAL_SIZE=$(du -sh "$DIR" | cut -f1)

# Use du to get sizes, sort numerically in reverse, and format output
# -a: all files and directories
# -h: human-readable format
# --max-depth=1: only list items in the specified directory
# sort -hr: sort human-readable numbers in reverse order
{
    echo "Total Usage: $TOTAL_SIZE"
    echo "--------------------------------"
    du -ah --max-depth=1 "$DIR" | sort -hr
} > "$OUTPUT_FILE"

# Display contents to terminal
cat "$OUTPUT_FILE"

echo "Output written to $OUTPUT_FILE"
