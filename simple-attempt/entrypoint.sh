#!/bin/bash
steamcmd +login anonymous +force_install_dir /app/ark +app_update 376030 validate +exit

cd /app/ark

if [[ ! -f Engine/Binaries/ThirdParty/SteamCMD/Linux/steamcmd.sh ]]; then
  mkdir -p Engine/Binaries/ThirdParty/SteamCMD/Linux/
  pushd Engine/Binaries/ThirdParty/SteamCMD/Linux/
  wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
  tar -xf steamcmd_linux.tar.gz
  popd
fi

cd /app/ark/ShooterGame/Binaries/Linux

while [ true ]; do
  echo "-----------------------------------------"
  echo "Starting server $SESSIONNAME"
  echo "-----------------------------------------"
  ./ShooterGameServer $SERVERMAP?listen?SessionName=$SESSIONNAME?ServerPassword=$SERVERPASSWORD?ServerAdminPassword=$ADMINPASSWORD -server -log -automanagedmods
  sleep 1
  echo "-----------------------------------------"
  echo "Game crashed with code: $?"
  echo "Restarting in 3 seconds......"
  echo "-----------------------------------------"
  sleep 3
done