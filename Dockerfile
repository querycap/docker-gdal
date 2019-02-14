FROM querycap:alpine-builder:latest AS builder

COPY ./repositories /etc/apk/repositories
COPY ./gdal /custom/gdal

RUN alpine_build gdal

FROM alpine

COPY --from=builder /etc/apk/repositories /etc/apk/repositories
COPY --from=builder /home/packager/packages/custom/x86_64/ /tmp

RUN apk add /tmp/gdal-2.4.0-r0.apk --allow-untrusted








