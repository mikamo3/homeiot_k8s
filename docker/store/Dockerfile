FROM golang:1.19.0-alpine
ARG ARCH=amd64
WORKDIR /app
RUN apk add --no-cache git make
ADD https://api.github.com/repos/mikamo3/homeiot/git/refs/heads/main version.json
RUN git clone https://github.com/mikamo3/homeiot
RUN cd homeiot && make build-$ARCH-store


FROM golang:1.19.0-alpine

WORKDIR /app
COPY --from=0 /app/homeiot/bin/homeiot_store /app/homeiot_store
CMD [ "/app/homeiot_store","-config" ,"/config/homeiot.yml"]