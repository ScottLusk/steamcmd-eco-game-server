FROM cm2network/steamcmd:latest

USER root

LABEL maintainer="scott.t.lusk@gmail.com"

ENV STEAMAPPID 739590
ENV STEAMAPPDIR /home/steam/eco-server
ENV STEAMSCRIPTDIR /home/steam/scripts

VOLUME [${STEAMAPPDIR}/Storage]
EXPOSE 3000/udp 3001/tcp

RUN apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		libicu63 \
		libgdiplus \
		jq

CMD ${STEAMSCRIPTDIR}/steam_update.sh && \
	cd ${STEAMAPPDIR} && \
	./EcoServer

ADD src ${STEAMSCRIPTDIR}

RUN ${STEAMSCRIPTDIR}/steam_update.sh

ENV WORLD_SIZE 144
ENV PAUSED_WHEN_EMPTY true
ENV ALLOW_FAST_FORWARD true
ENV CREATE_METEOR false
ENV METEOR_IMPACT_DAYS 60
ENV BASE_SKILL_GAIN_RATE 24

RUN ${STEAMSCRIPTDIR}/configure_server.sh
