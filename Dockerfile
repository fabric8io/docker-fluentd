FROM alpine:3.2

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

ENTRYPOINT ["fluentd"]

RUN apk add --update ca-certificates ruby-dev build-base && \
    wget https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/8/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk && \
    wget https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/8/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk && \
    apk add --allow-untrusted glibc-2.21-r2.apk glibc-bin-2.21-r2.apk && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    rm -rf /var/cache/apk/*

RUN echo 'gem: --no-document' >> /etc/gemrc

ENV FLUENTD_VERSION 0.12.16

RUN gem update --system && gem install fluentd -v ${FLUENTD_VERSION}
