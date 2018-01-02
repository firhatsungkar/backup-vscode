#!/bin/bash

### Set variable
UserData='unknown-location'
UserExtensions='.extensions'
UserConfig='config'

### Set UserData based on $OSTYPE
case "$OSTYPE" in
"linux-gnu")
    UserData="$HOME/.config/Code/User"
    ;;
"darwin"*)
    UserData="$HOME/Library/Application Support/Code/User"
    ;;
esac

### Check Compatibility
if [[ "$UserData" == "unknown-location" ]]; then
    echo "Sorry, This script can't run on your OS :("
    exit
fi

### Backup user data
echo "Backup your user data on $UserData"
mkdir config 2>/dev/null
for file in "$UserData"/*.json
do
    echo "---backup: ${file##*/} ..."
    cp -rf "${file}" "${UserConfig}/"
done

### Backup user snippet
echo "Backup your snippets on $UserData/snippets"
cp -rf "${UserData}/snippets" "${UserConfig}/"
for file in "${UserData}/snippets"/*.json
do
    echo "---backup: ${file##*/} ..."
done

### Backup user extensions list
echo "Backup your extensions"
code --list-extensions > $UserExtensions

while IFS= read -r line; do
    echo "---backup: $line ..."
done < $UserExtensions

### Finish
echo "Wohoo!! We finish backup your visual code settings, snippets, and extensions."
exit 1