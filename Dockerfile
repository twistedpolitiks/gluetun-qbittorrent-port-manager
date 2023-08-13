#Initial build
FROM ubuntu:jammy

RUN apt update
RUN apt install --yes --quiet curl inotify-tools

ENV QBITTORRENT_SERVER=localhost
ENV QBITTORRENT_IP=127.0.0.1
ENV QBITTORRENT_HOSTNAME=localhost
ENV QBITTORRENT_PORT=8080
ENV QBITTORRENT_USER=admin
ENV QBITTORRENT_PASS=adminadmin
ENV PORT_FORWARDED=tmp/gluetun/forwarded_port
ENV HTTP_HTTPS=https

COPY ./start.sh ./start.sh
RUN chmod 770 ./start.sh

RUN echo ${QBITTORRENT_IP} ${QBITTORRENT_SERVER} ${QBITTORRENT_HOSTNAME} >> /etc/hosts

RUN update-ca-certificates

CMD ["./start.sh"]
