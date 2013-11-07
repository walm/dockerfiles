# Test runner for Ruby and Node.js
#
# Includes:
#   - Ruby (1.9.3, 2.0)
#   - Nodejs (0.10.20 from chris-lea/node.js)
#   - MongoDB (2.4.6 from 10gen)
#   - Elasticsearch 0.90.5
#   - Redis (2.6.16 from rwky/redis)
#   - Phantomjs (1.9.2)
#   - ImageMagick
#
# Build with:
#
#     sudo docker build -t walm/test-runner .
#
# Run in ex. Jenkins
#
#     sudo docker run -i -t walm/test-runner bash -c "..your script.."
#
# VERSION               0.1.0

FROM ubuntu:12.10
MAINTAINER Andreas Wålm "andreas@walm.net"

# Install using one RUN line to get around 42 AUFS layers limit.
RUN \
  echo "# Base" ;\
  apt-get update -qq ;\
  apt-get -q -y install wget curl git-core software-properties-common build-essential ;\
  \
echo "# Fix UPSTART errors https://github.com/dotcloud/docker/issues/1024" ;\
  dpkg-divert --local --rename --add /sbin/initctl ;\
  ln -s /bin/true /sbin/initctl ;\
  \
echo "# Install rvm with ruby 1.9.3 and 2.0" ;\
  apt-get -q -y install libyaml-dev ;\
  curl -L https://get.rvm.io | bash ;\
  bash -c "source /etc/profile.d/rvm.sh && rvm install 1.9.3 && rvm install 2.0 && gem install bundler --no-ri --no-rdoc" ;\
  echo 'source /etc/profile.d/rvm.sh' >> /.profile ;\
  \
echo "# Install node.js" ;\
  add-apt-repository -y ppa:chris-lea/node.js ;\
  apt-get update -qq ;\
  apt-get -q -y install nodejs ;\
  \
echo "# Install mongodb" ;\
  apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 ;\
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/10gen.list ;\
  apt-get update -qq ;\
  apt-get install -q -y mongodb-10gen ;\
  mkdir -p /data/db/ ;\
  \
echo "# Install elasticsearch" ;\
  apt-get install -q -y openjdk-6-jre-headless ;\
  wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.5.tar.gz ;\
  tar zxf elasticsearch-0.90.5.tar.gz ;\
  rm -f elasticsearch-0.90.5.tar.gz ;\
  mv elasticsearch-0.90.5 /opt/elasticsearch ;\
  \
echo "# Install redis" ;\
  add-apt-repository -y ppa:rwky/redis ;\
  apt-get update -qq ;\
  apt-get -q -y install redis-server ;\
  echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf ;\
  \
echo "# Install phantomjs" ;\
  apt-get -q -y install libfontconfig ;\
  wget -q https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2 ;\
  tar jxf phantomjs-1.9.2-linux-x86_64.tar.bz2 ;\
  mv phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/bin/ ;\
  rm -rf phantomjs-1.9.2-linux-x86_64* ;\
  \
echo "# Install imagemagick" ;\
  apt-get install -q -y imagemagick libmagickwand-dev ;\
  \
echo "# Ruby gem's deps" ;\
  apt-get -q -y install libxslt-dev libxml2-dev ;\
  \
echo "# Create start script" ;\
  touch /usr/bin/start-container.sh ;\
  echo 'mongod --quiet > /dev/null &' >> /usr/bin/start-container.sh ;\
  echo '/opt/elasticsearch/bin/elasticsearch' >> /usr/bin/start-container.sh ;\
  echo 'redis-server > /dev/null &' >> /usr/bin/start-container.sh ;\
  chmod +x /usr/bin/start-container.sh ;\
  \
echo "# Ignore hostkey check for bitbucket and github" ;\
  mkdir -p /root/.ssh/ ;\
  echo "Host bitbucket.org\n\tStrictHostKeyChecking no\n\n" >> /root/.ssh/config ;\
  echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config ;\
true
# END RUN

