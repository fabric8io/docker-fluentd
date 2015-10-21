FROM centos:7

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

ENTRYPOINT ["fluentd"]

RUN yum install -y gcc ruby-devel make gcc && \
    yum clean all

RUN echo 'gem: --no-document' >> /etc/gemrc

ENV FLUENTD_VERSION 0.12.16

RUN gem update --system && gem install json_pure && gem install fluentd -v ${FLUENTD_VERSION}
