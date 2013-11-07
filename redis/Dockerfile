# Redis
#
# Includes:
#   - Redis (v2.6.16 from ppa:rwky)
#
# Build with:
#
#     docker build -t walm/redis .
#
# Run using
#
#     docker run -d walm/redis
#
# VERSION               1.0

FROM ubuntu:12.10
MAINTAINER Andreas Wålm "andreas@walm.net"

# Install using one RUN line to get around 42 AUFS layers limit.
RUN \
  echo "# Base" ;\
  apt-get update -qq ;\
  apt-get install -y software-properties-common ;\
  \
echo "# Fix UPSTART errors https://github.com/dotcloud/docker/issues/1024" ;\
  dpkg-divert --local --rename --add /sbin/initctl ;\
  ln -s /bin/true /sbin/initctl ;\
  \
echo "# Install redis" ;\
  add-apt-repository -y ppa:rwky/redis ;\
  apt-get update -qq ;\
  apt-get -y install redis-server ;\
  echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf ;\
  \
true
# END RUN

EXPOSE  6379

CMD ["redis-server"]
