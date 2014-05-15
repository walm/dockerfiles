# Base image
#
# Based on
#   - phusion/baseimage:0.9.10 (see https://github.com/phusion/baseimage-docker)
#
# Includes:
#   - wget
#   - curl
#   - user "app" to use for services etc
#
# Build with:
#
#     docker build -t walm/base .
#
# Run using
#
#     docker run -d walm/base
#
# VERSION               1.0

FROM phusion/baseimage:0.9.10
MAINTAINER Andreas Wålm "andreas@walm.net"

ENV HOME /root
RUN mkdir /build
ADD . /build
RUN /build/install.sh
CMD ["/sbin/my_init"]
