FROM alpine:3.15

MAINTAINER Anirudh Ramesh

RUN mkdir /etc/periodic/1min /source /destination

COPY crontab /etc/crontabs/root
COPY entrypoint.sh /entrypoint.sh
COPY read.sh /read.sh

RUN chmod 755 /entrypoint.sh

ENTRYPOINT /entrypoint.sh
