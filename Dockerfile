FROM cm2network/steamcmd:latest

LABEL maintainer="scott.t.lusk@gmail.com"

ENV STEAMAPPID 739590
ENV STEAMAPPDIR /home/steam/eco-server

EXPOSE 3000/udp 3001/tcp

VOLUME [/app/Storage]

RUN ${STEAMCMDDIR}/steamcmd.sh \
		+login anonymous \
		+force_install_dir ${STEAMAPPDIR} \
		+app_update ${STEAMAPPID} validate \
		+quit