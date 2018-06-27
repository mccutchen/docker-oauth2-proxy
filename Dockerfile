# Build stage 0
#
# Download a copy of the oauth2_proxy source code and build a binary
FROM golang:1.10

LABEL maintainer "Will McCutchen <will@mccutch.org>"

ENV OAUTH2_PROXY_VERSION=v2.2
ENV OAUTH2_PROXY_SRC_URL=https://github.com/bitly/oauth2_proxy/archive/${OAUTH2_PROXY_VERSION}.tar.gz
ENV OAUTH2_PROXY_BUILD_DIR=${GOPATH}/src/github.com/bitly/oauth2_proxy

WORKDIR $GOPATH/src/github.com/bitly/oauth2_proxy

RUN apt-get update && \
    apt-get install curl git

RUN curl -s -L $OAUTH2_PROXY_SRC_URL | tar --strip-components=1 -zxv && \
    curl -s -L https://raw.githubusercontent.com/pote/gpm/v1.4.0/bin/gpm | bash && \
    go build -o /tmp/oauth2_proxy

# Build stage 1
#
# Make the built binary available as part of a minimal "distroless" container
# image:
#
# https://github.com/GoogleContainerTools/distroless
FROM gcr.io/distroless/base
COPY --from=0 /tmp/oauth2_proxy /bin/oauth2_proxy
EXPOSE 4180
CMD ["/bin/oauth2_proxy"]
