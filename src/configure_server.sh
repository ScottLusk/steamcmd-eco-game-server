#!/bin/bash


cat ${STEAMAPPDIR}/Configs/EcoSim.eco.template |
    jq '. | 
        .BaseSkillGainRate = (env.BASE_SKILL_GAIN_RATE | tonumber)
    ' \
> ${STEAMAPPDIR}/Configs/EcoSim.eco

cat ${STEAMAPPDIR}/Configs/Disasters.eco.template |
    jq '. | 
        .CreateMeteor = env.CREATE_METEOR |
        .MeteorImpactDays = (env.METEOR_IMPACT_DAYS | tonumber)
    ' \
> ${STEAMAPPDIR}/Configs/Disasters.eco

cat ${STEAMAPPDIR}/Configs/Sleep.eco.template |
    jq '. | 
        .AllowFastForward = env.ALLOW_FAST_FORWARD
    ' \
> ${STEAMAPPDIR}/Configs/Sleep.eco

cat ${STEAMAPPDIR}/Configs/Pause.eco.template |
    jq '. | 
        .Paused = env.PAUSED_WHEN_EMPTY
    ' \
> ${STEAMAPPDIR}/Configs/Pause.eco

cat ${STEAMAPPDIR}/Configs/WorldGenerator.eco.template |
    jq '. | 
        (.Dimensions.x,.Dimensions.y) = (env.WORLD_SIZE | tonumber)
    ' \
> ${STEAMAPPDIR}/Configs/WorldGenerator.eco