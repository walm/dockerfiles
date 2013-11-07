# Ruby and NodeJS
#
# Includes:
#   - Ruby 2.0 using RVM
#   - Nodejs (0.10.20 from chris-lea/node.js)
#   - Phantomjs (1.9.2)
#   - ImageMagick (using apt-get)
#
# Build with:
#
#     docker build -t walm/ruby-node .
#
# Run using
#
#     docker run -d -w /data walm/ruby-node start-app-script.sh
#
#     or map local filesystem
#
#     docker run -d -v "/local/data/:/data/" -w /data walm/ruby-node start-app-script.sh
#
# VERSION               1.0

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
echo "# Install rvm with ruby 2.0" ;\
  apt-get -q -y install libyaml-dev ;\
  curl -L https://get.rvm.io | bash ;\
  bash -c "source /etc/profile.d/rvm.sh && rvm install 2.0 && gem install bundler --no-ri --no-rdoc" ;\
  echo 'source /etc/profile.d/rvm.sh' >> /.profile ;\
  \
echo "# Install node.js" ;\
  add-apt-repository -y ppa:chris-lea/node.js ;\
  apt-get update -qq ;\
  apt-get -q -y install nodejs ;\
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
echo "# Ruby gem's common deps" ;\
  apt-get -q -y install libxslt-dev libxml2-dev ;\
  \
mkdir /data ;\
true
# END RUN

EXPOSE  3000
EXPOSE  9000

