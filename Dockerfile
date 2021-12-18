ARG ALPINE_VERSION=3
FROM alpine:${ALPINE_VERSION}

LABEL org.opencontainers.image.source https://github.com/zewelor/$REPO_NAME

RUN apk add --no-cache 

CMD []
