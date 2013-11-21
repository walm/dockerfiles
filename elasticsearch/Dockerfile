# Elasticsearch
#
# Includes:
#   - Elasticsearch (0.90.7)
#
# Build with:
#
#     docker build -t walm/elasticsearch .
#
# Run using
#
#     docker run -d walm/elasticsearch
#
# Change config by mapping/updating files in
#
#     /opt/elasticsearch/config
#
# VERSION               1.0

FROM ubuntu:12.10
MAINTAINER Andreas Wålm "andreas@walm.net"

# Install using one RUN line to get around 42 AUFS layers limit.
RUN \
  echo "# Base" ;\
  apt-get update -qq ;\
  apt-get install -y -q openjdk-6-jre-headless wget ;\
  \
echo "# Fix UPSTART errors https://github.com/dotcloud/docker/issues/1024" ;\
  dpkg-divert --local --rename --add /sbin/initctl ;\
  ln -s /bin/true /sbin/initctl ;\
  \
echo "# Install Elasticsearch" ;\
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.tar.gz ;\
  tar -xzf elasticsearch-0.90.7.tar.gz ;\
  mv elasticsearch-0.90.7 /opt/elasticsearch ;\
  rm elasticsearch-0.90.7.tar.gz ;\
true
# END RUN

EXPOSE  9200

CMD ["/opt/elasticsearch/bin/elasticsearch", "-f"]
