#!/bin/bash
set -e

clear
echo "=============================="
echo "     AUTOMATED BACKUP TOOL    "
echo "=============================="
echo

# check if argument is provided
if [ -z "$1" ]; then
	echo "X Error: No directory provided"
	echo "Usage: ./backup.sh <directory>"
	exit 1
fi

SOURCE_DIR="$1"
# check if directory exists
if [ ! -d "$SOURCE_DIR" ]; then
	echo "X Error: Directory does not exist"
	exit 1
fi

echo "Source directory: $SOURCE_DIR"

HOME=/home/sanjeeban
TIMESTAMP=$(date +"%Y_%m-%d_%H-%M_%S")
BACKUP_DIR="$HOME/backups"
mkdir -p "$BACKUP_DIR"

BACKUP_NAME="backup_$(basename "$SOURCE_DIR")_$TIMESTAMP.tar.gz"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

echo "Creating backup..."
tar -czf "$BACKUP_PATH" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

if [ $? -eq 0 ]; then
	echo "Backup created successfully!"
	echo "Location: $BACKUP_PATH"
else
	echo "Backup failed"
	exit 1
fi


echo
echo "Backup Completed."
