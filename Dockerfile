FROM busybox AS build

ARG OS=linux
ARG ARCH=linux-386
ARG VERSION=v2.6.2
ARG EXT

ENV FILENAME qshell-${VERSION}-${OS}-${ARCH}${EXT}

RUN set -x \
    && wget -O /qshell.tar.gz https://devtools.qiniu.com/${FILENAME}.tar.gz \
    && mkdir /dist \
    && unzip /qshell.tar.gz -d /dist \
    && mv /dist/${FILENAME} /qshell

FROM alpine

RUN apk add --no-cache ca-certificates
COPY --from=build /qshell /usr/bin/qshell
RUN chmod +x /usr/bin/qshell

CMD ["qshell"]

