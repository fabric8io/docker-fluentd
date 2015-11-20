FROM centos:7

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

ENTRYPOINT ["je", "fluentd"]

RUN yum update -y && \
    yum install -y https://www.softwarecollections.org/en/scls/rhscl/rh-ruby22/epel-7-x86_64/download/rhscl-rh-ruby22-epel-7-x86_64.noarch.rpm && \
    yum install -y scl-utils make gcc bzip2 rh-ruby22 rh-ruby22-ruby-devel && \
    yum clean all

ENV LD_LIBRARY_PATH /opt/rh/rh-ruby22/root/usr/lib64
ENV FLUENTD_VERSION 0.14.0.pre.1
RUN scl enable rh-ruby22 'gem update --system --no-document' && \
    scl enable rh-ruby22 'gem install --no-document json_pure jemalloc' && \
    scl enable rh-ruby22 "gem install --no-document fluentd -v ${FLUENTD_VERSION}" && \
    ln -s /opt/rh/rh-ruby22/root/usr/local/bin/* /usr/bin
