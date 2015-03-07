FROM gliderlabs/alpine:3.1

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

RUN apk-install ca-certificates ruby-dev build-base

RUN echo 'gem: --no-document' >> /etc/gemrc

ENV FLUENTD_VERSION 0.12.6

RUN gem update --system && gem install fluentd -v ${FLUENTD_VERSION}
