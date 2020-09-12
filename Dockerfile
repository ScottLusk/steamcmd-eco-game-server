FROM cm2network/steamcmd:latest

USER root

LABEL maintainer="scott.t.lusk@gmail.com"

ENV STEAMAPPID 739590
ENV STEAMAPPDIR /home/steam/eco-server

EXPOSE 3000/udp 3001/tcp

VOLUME [${STEAMAPPDIR}/Storage]

RUN apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		libicu63 \
    && ${STEAMCMDDIR}/steamcmd.sh \
		+login anonymous \
		+force_install_dir ${STEAMAPPDIR} \
		+app_update ${STEAMAPPID} validate \
		+quit
