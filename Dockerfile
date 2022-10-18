FROM golang:1.18.6
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends ca-certificates curl
RUN mkdir /workspace
ADD main.go main.go
RUN go build -o /usr/bin/devbox main.go
RUN rm -rf main.go
EXPOSE 8089
WORKDIR /workspace
VOLUME [ "/workspace" ]
CMD ["/usr/bin/devbox"]
