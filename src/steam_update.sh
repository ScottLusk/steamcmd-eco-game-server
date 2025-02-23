#!/bin/bash

# server_running=[[ -z $(ls -l /proc/*/exe 2> /dev/null | grep 'EcoServer') ]]
server_running=[[ -z $(ps aux | grep 'EcoServer' | grep -Ev 'grep|/bin/sh|bash') ]]
online_players=$(curl -s https://eco.scottlusk.me/info | jq .OnlinePlayers)

if [[ !$server_running || $online_players == 0 ]]; then
	su steam -c "${STEAMCMDDIR}/steamcmd.sh +login anonymous +force_install_dir ${STEAMAPPDIR} +app_update ${STEAMAPPID} validate +quit"
fi
