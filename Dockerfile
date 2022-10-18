FROM ubuntu:latest
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends ca-certificates curl
RUN mkdir -p /app/{logs,conf} && cd /app && mkdir /data
EXPOSE 8089
WORKDIR /app
ADD templates /app/templates
ADD conf/config.yaml /app/conf/config.yaml
ADD draw /app/draw
VOLUME [ "/app/logs", "/data" ]
CMD ["./draw"]
