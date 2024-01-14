#!/bin/bash

echo SERVER_NAME $SERVER_NAME
echo SERVER_DETAIL $SERVER_DETAIL
echo SERVER_PASSWORD $SERVER_PASSWORD
echo IS_PUBLIC_SERVER $IS_PUBLIC_SERVER
echo SHELF_LIFE_MULTIPLIER $SHELF_LIFE_MULTIPLIER
echo BASE_SKILL_GAIN_RATE $BASE_SKILL_GAIN_RATE
echo CREATE_METEOR $CREATE_METEOR
echo METEOR_IMPACT_DAYS $METEOR_IMPACT_DAYS
echo ALLOW_FAST_FORWARD $ALLOW_FAST_FORWARD
echo PAUSED_WHEN_EMPTY $PAUSED_WHEN_EMPTY
echo WORLD_SIZE $WORLD_SIZE
echo MAINTENANCE_HOUR $MAINTENANCE_HOUR
echo SETTLEMENT_INFLUENCE $SETTLEMENT_INFLUENCE
echo SETTLEMENT_PLOT_COVERAGE $SETTLEMENT_PLOT_COVERAGE

cat ${STEAMAPPDIR}/Configs/Balance.eco.template |
    jq '. | 
        .ShelfLifeMultiplier = if env.SHELF_LIFE_MULTIPLIER then (env.SHELF_LIFE_MULTIPLIER | tonumber) else 1.0 end
    ' \
> ${STEAMAPPDIR}/Configs/Balance.eco

cat ${STEAMAPPDIR}/Configs/EcoSim.eco.template |
    jq '. | 
        .BaseSkillGainRate = if env.BASE_SKILL_GAIN_RATE then (env.BASE_SKILL_GAIN_RATE | tonumber) else 12.0 end
    ' \
> ${STEAMAPPDIR}/Configs/EcoSim.eco

cat ${STEAMAPPDIR}/Configs/Disasters.eco.template |
    jq '. | 
        .CreateMeteor = if env.CREATE_METEOR then env.CREATE_METEOR else true end |
        .MeteorImpactDays = if env.METEOR_IMPACT_DAYS then (env.METEOR_IMPACT_DAYS | tonumber) else 30.0 end
    ' \
> ${STEAMAPPDIR}/Configs/Disasters.eco

cat ${STEAMAPPDIR}/Configs/Sleep.eco.template |
    jq '. | 
        .AllowFastForward = if env.ALLOW_FAST_FORWARD then env.ALLOW_FAST_FORWARD else false end
    ' \
> ${STEAMAPPDIR}/Configs/Sleep.eco

cat ${STEAMAPPDIR}/Configs/Pause.eco.template |
    jq '. | 
        .Paused = if env.PAUSED_WHEN_EMPTY then env.PAUSED_WHEN_EMPTY else false end
    ' \
> ${STEAMAPPDIR}/Configs/Pause.eco

cat ${STEAMAPPDIR}/Configs/Users.eco.template |
    jq '. | 
        .UserPermission.Admins.Collection."System.String"."$values" = if env.ADMIN_LIST then env.ADMIN_LIST | split(",") else [] end
    ' \
> ${STEAMAPPDIR}/Configs/Users.eco

cat ${STEAMAPPDIR}/Configs/WorldGenerator.eco.template |
    jq '. | 
        (.Dimensions.x,.Dimensions.y) = if env.WORLD_SIZE then (env.WORLD_SIZE | tonumber) else 72 end
    ' \
> ${STEAMAPPDIR}/Configs/WorldGenerator.eco

cat ${STEAMAPPDIR}/Configs/Maintenance.eco.template |
    jq '. | 
        .AutoShutdownHour = if env.MAINTENANCE_HOUR then (env.MAINTENANCE_HOUR | tonumber) else -1 end |
        .AutoShutdownMessage = "Server will restart for Maintenance soon. Please logout to prevent data loss."
    ' \
> ${STEAMAPPDIR}/Configs/Maintenance.eco

cat ${STEAMAPPDIR}/Configs/Network.eco.template |
    jq '. | 
        .PublicServer = if env.IS_PUBLIC_SERVER then env.IS_PUBLIC_SERVER else false end |
        .Description = if env.SERVER_NAME then env.SERVER_NAME else "Eco Server" end |
        .DetailedDescription = if env.SERVER_DETAIL then env.SERVER_DETAIL else "This Eco server was created using https://hub.docker.com/r/hoeney/steamcmd-eco-game-server." end |
        .Password = if env.SERVER_PASSWORD then env.SERVER_PASSWORD else "" end
    ' \
> ${STEAMAPPDIR}/Configs/Network.eco

cat ${STEAMAPPDIR}/Configs/Settlements.eco.template |
    jq '. | 
        .SettlementInfluenceMultiplier = if env.SETTLEMENT_INFLUENCE then [(env.SETTLEMENT_INFLUENCE | tonumber), (env.SETTLEMENT_INFLUENCE | tonumber), (env.SETTLEMENT_INFLUENCE | tonumber)] else 1 end |
        .MinRequiredPlotCoveragePercentage = if env.SETTLEMENT_PLOT_COVERAGE then (env.SETTLEMENT_PLOT_COVERAGE | tonumber) else 0.5 end
    ' \
> ${STEAMAPPDIR}/Configs/Settlements.eco
