presets_path=/Users/$(whoami)/Library/Preferences/DockPresets

if [ -z "$1" ] || [ "$1" = "--help" ]; then
    echo "Available commands:"
    echo
    echo "s, save {preset-name}    || save preset with specified name"
    echo "l, load {preset-name}    || load preset with specified name"
    echo "rm, remove {preset-name} || remove preset with specified name"
    echo "ls, list                 || print list of all saved presets"
    echo "open                     || open presets folder in Finder"
    echo "--help                   || print out available commands"
    exit 0
fi

if [ "$1" = "save" ] || [ "$1" = "s" ]; then
    cp -f /Users/$(whoami)/Library/Preferences/com.apple.dock.plist $presets_path/$2.plist
    echo "Dock preferenes saved."
    exit 0
fi

if [ "$1" = "load" ] || [ "$1" = "l" ]; then
    sudo cp $presets_path/$2.plist /Users/$(whoami)/Library/Preferences/com.apple.dock.plist
    sleep 1
    killall Dock
    exit 0
fi

if [ "$1" = "ls" ] || [ "$1" = "list" ]; then
    echo "List of your presets:"

    ls -1 $presets_path | while read fname; do
        echo ${fname%%.*}
    done
fi

if [ "$1" = "remove" ] || [ "$1" = "rm" ]; then
    rm $presets_path/$2.plist
    echo $2 removed.
fi

if [ "$1" = "open" ] || [ "$1" = "." ]; then
    cd $presets_path
    open .
    echo "Folder opened in Finder"
fi
