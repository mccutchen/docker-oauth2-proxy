FROM alpine:3.5

LABEL maintainer "Will McCutchen <will@mccutch.org>"

ENV OAUTH2_PROXY_VERSION=2.1
ENV OAUTH2_PROXY_PLATFORM=linux-amd64.go1.6

RUN export PKG_URL=https://github.com/bitly/oauth2_proxy/releases/download/v${OAUTH2_PROXY_VERSION}/oauth2_proxy-${OAUTH2_PROXY_VERSION}.${OAUTH2_PROXY_PLATFORM}.tar.gz && \
    apk add --no-cache curl && \
    curl -s -L $PKG_URL | tar -C /tmp -zxv && \
    mv /tmp/oauth2_proxy*/oauth2_proxy /bin && \
    rm -rf /tmp/oauth2_proxy*

EXPOSE 4180

CMD ["/bin/oauth2_proxy"]
