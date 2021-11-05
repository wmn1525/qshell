FROM busybox AS build

ARG OS=linux
ARG ARCH=x64
ARG VERSION=v2.6.2
ARG EXT

ENV FILENAME qshell-${OS}-${ARCH}-${VERSION}${EXT}

RUN set -x \
    && wget -O /qshell.zip http://devtools.qiniu.com/${FILENAME}.zip \
    && mkdir /dist \
    && unzip /qshell.zip -d /dist \
    && mv /dist/${FILENAME} /qshell

FROM alpine

RUN apk add --no-cache ca-certificates
COPY --from=build /qshell /usr/bin/qshell
RUN chmod +x /usr/bin/qshell

CMD ["qshell"]