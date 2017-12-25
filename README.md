Backup and Restore Visual Studio Code Scipts
=====

## Usage
Both of backup and restore script will backup :
- [x] Settings
- [x] Keybinding
- [x] Custom snippet
- [x] Extensions

## Compatibility
- This script only run on `Linux` and `MacOS` using bash.
- Visual Studio Code version > `1.19.X`

## How to Install
- Clone repo
```bash
> git clone https://github.com/firhatsungkar/backup-vscode.git
```
- Open the directory
```bash
> cd backup-vscode
```
- Give executable permission
```nash
> chmod +x backup.py restore.py
```
- Run backup script
```bash
> ./backup.py
```
- After script has been finish executed, It will create `config` directory for your all backup file.
- To restore, run `restore.py`
```bash
> ./restore.py
```
