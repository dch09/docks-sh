# Docks
## MacOS Dock utility to manage dock presets.

**Step 1:** create /usr/local/bin directory
```
sudo mkdir -p /usr/local/bin
sudo chown ${USER}:staff /usr/local/bin
```
**Step 2:** 

Download docks.sh and save it at: /usr/local/bin/
```
chmod +x /usr/local/bin/docks.sh
```

**Step 3:**
Default presets_path location is at: /Users/your-username/Library/Preferences/DockPresets\
Create this folder using command below:
```
mkdir /Users/$(whoami)/Library/Preferences/DockPresets
```
**Usage:**
```
docks.sh save {preset-name} || saves preset with specified name
docks.sh load {preset-name} || loads preset with specified name 
docks.sh remove {preset-name} || removes preset with specified name
docks.sh ls || returns list of saved presets
docks.sh open || opens presets folder in Finder
docks.sh --help || returns usage guide
```
Loading dock preset requires your computer password due to sudo command.
