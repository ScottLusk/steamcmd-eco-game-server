#!/bin/bash


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

cat ${STEAMAPPDIR}/Configs/WorldGenerator.eco.template |
    jq '. | 
        (.Dimensions.x,.Dimensions.y) = if env.WORLD_SIZE then (env.WORLD_SIZE | tonumber) else 72 end
    ' \
> ${STEAMAPPDIR}/Configs/WorldGenerator.eco