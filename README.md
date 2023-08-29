# Minecraft-Bedrock-Server-Updater
Automatically detect new version of minecraft bedrock server and update your server without losing server data

## How this works
1. Detects newest version in Minecraft Bedrock Server download page
2. Download .zip file
3. Stop the server and backup server data
4. Extract .zip file
5. Restore your backup server's worlds data and setting data
6. Run updated version of server (in tmux session)

## Prerequisite
Works in Debian like OS (Debian, Ubuntu, ...)
```sh
sudo apt update # Update your repository list
sudo apt install python3 # Make sure PY3 is installed
sudo apt install tmux # Tmux for split processing
python3 install pip3 #Install pip ( dep management ) for python3
pip3 install bs4 # BeautifulSoup for page parsing
```

## How to run
### 1. Specify updater path (Must be done!)
you must specify your Minecraft-Bedrock-Server-Updater absolute path to "updater/mcserver_autoupdater.py"
```sh
# Write down your absolute path of Minecraft Bedrock Server Updater
# Example : 
#   minecraft_directory = '/home/ubuntu/Minecraft-Bedrock-Server-Updater'
# Do not write '/' at the end of the path!
minecraft_directory = '/path/to/updater'
```
### 2. Run updater
### 2-1) If you want to start new server
Just run updater/mcserver_autoupdater.py script
It automatically downloads server and run in tmux session
```sh
python3 ./updater/mcserver_autoupdater.py
```
### 2-2) If you want to use your previous server
1. Stop your server
2. Put your previous server files (worlds, server.properties, etc...) to /running directory
3. Run updater
```sh
python3 ./updater/mcserver_autoupdater.py
```

### 2-3) If your server already runs in /running directory
Just like in step 2-1) run updater/mcserver_autoupdater.py script
It automatically downloads server, backup your data, install new server and load your previous worlds&server setting
```sh
python3 ./updater/mcserver_autoupdater.py
```

### 3. Join your server and play!

### Extra Step) Register updater to cron for regular update
You can register mcserver_autoupdater.py for regular update
For example, you can run updater every day at 5:00AM using cron
By doing so, updater checks new version of bedrock server everyday and updates if there is new version of server
```sh
# In your terminal
crontab -e
```
```sh
# In crontab, add below line
0 5 * * * /usr/bin/python3 /home/ubuntu/Minecraft-Bedrock-Server-Updater/updater/mcserver_autoupdater.py > /home/ubuntu/Minecraft-Bedrock-Server-Updater/updater/cron.log
```
