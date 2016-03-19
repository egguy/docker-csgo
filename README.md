# Counter-Strike : Global Offensive ebot Container from EdenServers


![](http://image.noelshack.com/fichiers/2015/35/1440632013-csgo-logo1.png)

All-in-one Counter-Strike : Global Offensive Server Container built for [eBot](http://www.esport-tools.net/).

---
### 0.0.1 (Inital version)

This initial version contains:

* *steamcmd*, and a complete CSGo server
* 
---

## Install

    $ make

---

## Config

Instructions for CS:GO config can be found [here](https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers).

| Environment Variable  | Description |
| ------------- | ------------- |
| GAME_TYPE | CS:GO Gametype  |
| GAME_MODE   | CS:GO Gamemode  |
| MAPGROUP    | CS:GO Mapgroup  |
| MAP    | CS:GO Map  |
| STARTUP_OPTIONS    | Additional startup options  |
| USERNAME    | SCP Username  |
| PASSWORD     | SCP Password  |

| Port  | Description |
| ------------- | ------------- |
| 27015 | CS:GO and RCON  |
| 22 | SCP  |

---

## Run example

    $ docker run -e GAME_TYPE=0 -e GAME_MODE=0 -e MAPGROUP=mg_bomb -e MAP=de_dust2 -e USERNAME=edenservers -e PASSWORD=edenservers -p 27015:27015 -p 27015:27015/udp -p 1234:22 -d edenservers/docker-csgo

---

Made by [![EdenServers](http://image.noelshack.com/fichiers/2015/35/1440630894-logo.png)](https://www.edenservers.us)
Modified by [CrazyPoPs](https://github.com/egguy/)
