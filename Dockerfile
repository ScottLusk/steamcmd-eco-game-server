FROM cm2network/steamcmd:latest

USER root

LABEL maintainer="scott.t.lusk@gmail.com"

ENV STEAMAPPID 739590
ENV STEAMAPPDIR /home/steam/eco-server

VOLUME [${STEAMAPPDIR}/Storage]
EXPOSE 3000/udp 3001/tcp
WORKDIR ${STEAMAPPDIR}
CMD ${STEAMCMDDIR}/steam_update.sh && ./EcoServer

ADD src ${STEAMCMDDIR}
RUN apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		libicu63 \
		libgdiplus \
	&& find ${STEAMCMDDIR} -type f -iname "*.sh" -exec chmod +x {} \;
