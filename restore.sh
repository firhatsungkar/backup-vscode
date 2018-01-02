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

if [[ ! -d "$UserConfig" ]]; then
    echo "Your previous backup not found"
    exit
fi

### Restore user data
echo "Restore your user data on $UserConfig"
for file in "$UserConfig"/*.json
do
    echo "---restore: ${file##*/} ..."
    cp -rf "${file}" "${UserData}/"
done

### Backup user snippet
echo "Restore your snippets on $UserConfig/snippets"
cp -rf "${UserConfig}/snippets" "${UserData}/"
for file in "${UserConfig}/snippets"/*.json
do
    echo "---restore: ${file##*/} ..."
done

### Restore user extensions list
echo "Restore your extensions"
while IFS= read -r line; do
    echo "Installing" $line "..."
    code --install-extension $line
done < $UserExtensions

### Finish
echo "Wohoo!! We finish restore your visual code settings, snippets, and extensions."
exit 1