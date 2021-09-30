presets_path=/Users/$(whoami)/Library/Preferences/DockPresets

if [ -z "$1" ] || [ "$1" = "--help" ]; then
    printf "%s\n" "Usage: dock_presets.sh command preset-name"
    echo
    echo "Available commands:"
    echo
    echo "save {preset-name} || saves preset with specified name"
    echo "load {preset-name} || loads preset with specified name"
    echo "remove {preset-name} || removes preset with specified name"
    echo "ls || returns list of saved presets"
    echo "open || opens presets folder in Finder"
    echo "--help || returns usage guide"
    exit 0
fi

if [ "$1" = "save" ]; then
    cp -f /Users/$(whoami)/Library/Preferences/com.apple.dock.plist $presets_path/$2.plist
    echo "Dock preferenes saved."
    exit 0
fi

if [ "$1" = "load" ]; then
    sudo cp $presets_path/$2.plist /Users/$(whoami)/Library/Preferences/com.apple.dock.plist
    sleep 1
    killall Dock
    exit 0
fi

if [ "$1" = "ls" ]; then
    echo "List of your presets:"

    ls -1 $presets_path | while read fname; do
        echo ${fname%%.*}
    done
fi

if [ "$1" = "remove" ]; then
    rm $presets_path/$2.plist
    echo $2 removed.
fi

if [ "$1" = "open" ]; then
    cd $presets_path
    open .
    echo "Folder opened in Finder"
fi
