[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/hoeney/steamcmd-eco-game-server)](https://hub.docker.com/repository/docker/hoeney/steamcmd-eco-game-server)
### steamcmd-eco-game-server
An Eco Game Server based on SteamCMD
https://www.play.eco/

## Ports 
- `3000 UDP`
  - ECO Game Server
- `3001 TCP`
  - Web UI
  
## Volumes
- /home/steam/eco-server/Storage
  - Mount this volume to persist the server game files storage

## Updates
Restarting the docker container will update the game server automatically through Steam.

## Server Configuration
Here are some environment variables you may pass into the container that will allow you to change the game server's settings. Please open an issue if you'd like more added.

- `SERVER_NAME`
  - String
  - Default `"Eco Server"`
  - Mapped to Network.Description
- `SERVER_DETAIL`
  - String
  - Default `"This Eco server was created using https://hub.docker.com/r/hoeney/steamcmd-eco-game-server."`
  - Mapped to Network.DetailedDescription
- `SERVER_PASSWORD`
  - String
  - Default `""`
  - Mapped to Network.Password
- `IS_PUBLIC_SERVER`
  - Boolean
  - Default `false`
  - Mapped to Network.PublicServer
- `ADMIN_LIST`
  - String of comma separated SteamIDs
  - Default `""`
  - Mapped to Users.UserPermission.Admins.Collection."System.String"."$values"
- `IS_PUBLIC_SERVER`
  - Boolean
  - Default `false`
  - Mapped to Network.PublicServer
- `MAINTENANCE_HOUR`
  - Number
  - Default `-1`
  - Mapped to Maintenance.AutoShutdownHour
- `CREATE_METEOR`
  - Boolean
  - Default `true`
  - Mapped to Disasters.CreateMeteor
- `METEOR_IMPACT_DAYS`
  - Boolean
  - Default `30.0`
  - Mapped to Disasters.MeteorImpactDays
- `BASE_SKILL_GAIN_RATE`
  - Number
  - Default `12.0`
  - Mapped to EcoSim.BaseSkillGainRate
- `SHELF_LIFE_MULTIPLIER`
  - Number
  - Default `1.0`
  - Mapped to Balance.ShelfLifeMultiplier
- `ALLOW_FAST_FORWARD`
  - Boolean
  - Default `false`
  - Mapped to Sleep.AllowFastForward
- `PAUSED_WHEN_EMPTY`
  - Boolean
  - Default `false`
  - Mapped to Pause.Paused
