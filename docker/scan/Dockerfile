FROM golang:1.19-bullseye
ARG ARCH=amd64

WORKDIR /app
RUN set -eux
RUN apt-get update && apt-get install -y --no-install-recommends \
  make \
  git && \
  rm -rf /var/lib/apt/lists/*
ADD https://api.github.com/repos/mikamo3/homeiot/git/refs/heads/main version.json
RUN git clone https://github.com/mikamo3/homeiot
RUN cd homeiot && make build-$ARCH-scan

FROM debian:bullseye

RUN set -eux
RUN apt-get update && apt-get install -y --no-install-recommends \
  bluez \
  dbus && \
  rm -rf /var/lib/apt/lists/*
RUN service dbus start
RUN service bluetooth start

COPY --from=0 /app/homeiot/bin/homeiot_scan /app/homeiot_scan
CMD [ "/app/homeiot_scan","-config" ,"/config/homeiot.yml"]