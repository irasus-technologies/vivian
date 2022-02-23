FROM alpine:3.15

MAINTAINER Anirudh Ramesh

RUN mkdir /source /destination

COPY crontab /etc/crontabs/root
COPY entrypoint.sh /entrypoint.sh
COPY decode.sh /decode.sh

RUN chmod 755 /entrypoint.sh

ENTRYPOINT /entrypoint.sh
