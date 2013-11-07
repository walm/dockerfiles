# MongoDB
#
# Includes:
#   - MongoDB (2.4.8 from 10gen)
#
# Build with:
#
#     docker build -t walm/mongodb .
#
# Run using
#
#     docker run -d walm/mongodb
#
#     or map local filesystem for data
#
#     docker run -d -v "/local/data/db/:/data/db/" walm/mongodb
#
# VERSION               1.0

FROM ubuntu:12.10
MAINTAINER Andreas Wålm "andreas@walm.net"

# Install using one RUN line to get around 42 AUFS layers limit.
RUN \
  echo "# Base" ;\
  apt-get update -qq ;\
  \
echo "# Fix UPSTART errors https://github.com/dotcloud/docker/issues/1024" ;\
  dpkg-divert --local --rename --add /sbin/initctl ;\
  ln -s /bin/true /sbin/initctl ;\
  \
echo "# Install mongodb" ;\
  apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 ;\
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/10gen.list ;\
  apt-get update -qq ;\
  apt-get install -q -y mongodb-10gen ;\
  mkdir -p /data/db/ ;\
true
# END RUN

# mongodb process
EXPOSE  27017

# # mongodb admin console
EXPOSE  28017

CMD ["mongod"]
