# Automated Backup Script

A simple Bash-based backup tool for Ubuntu Linux.

## Features
- Backs up any directory
- Timestamped '.tar.gz' archives
- CLean archive structure
- Automatic backup folder creation
- Safe input validation

## Usage

```bash
chmod +x backup.sh
./backup.sh /path/to/directory
```

## Changing Backup Destination
By default, backups are stored in the following directory:
```
~/backups
```
This is controlled by the $HOME variable in the script:

```bash
HOME="$HOME/backups"
```
#### To change the destination
1. Open the script:
```bash
nano backup.sh
```
2. Modify the $HOME variable.
Example:
```bash
HOME="/home/external-drive/my-backups"
```
or
```bash
HOME="/home/Documents"
```
3. Save the file (Ctrl + X, then Y, then Enter) and run the script again.

⚠️ Note: Make sure the destination directory exists or that the script has permission to create it.
