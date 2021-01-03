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
		locales \
		libicu63 \
		libgdiplus \
		jq \
	&& sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && locale-gen

CMD ${STEAMSCRIPTDIR}/steam_update.sh && \
	cd ${STEAMAPPDIR} && \
	./EcoServer

ADD src ${STEAMSCRIPTDIR}

RUN ${STEAMSCRIPTDIR}/steam_update.sh \
	&& ${STEAMSCRIPTDIR}/configure_server.sh
