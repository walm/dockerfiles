# Nginx
#
# Includes:
#   - Nginx (v1.4.3 from ppa:nginx)
#
# Build with:
#
#     docker build -t walm/nginx .
#
# Run using
#
#     docker run -d walm/nginx
#
#     or map local filesystem
#
#     docker run -d -v "/local/data/:/data/" walm/nginx
#
# VERSION               1.1

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
echo "# Install nginx" ;\
  add-apt-repository -y ppa:nginx/stable ;\
  apt-get update -qq ;\
  apt-get -y install nginx ;\
  \
echo "# Move nginx.conf to /data" ;\
  mkdir /data ;\
  mv /etc/nginx/nginx.conf /data/nginx.conf ;\
  ln -s /data/nginx.conf /etc/nginx/ ;\
  \
echo "# Nginx deamon off" ;\
  echo "daemon off;" >> /data/nginx.conf ;\
  \
true
# END RUN

EXPOSE  80
EXPOSE  443

CMD ["nginx", "-c", "/data/nginx.conf"]

