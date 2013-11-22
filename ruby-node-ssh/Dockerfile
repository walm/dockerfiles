# Ruby and NodeJS with SSH
#
# WARNING! Root password is set to `passw0rd`
#
# Includes:
#   - OpenSSH Server
#
# From walm/ruby-node
#   - Ruby 2.0 using RVM
#   - Nodejs (0.10.20 from chris-lea/node.js)
#   - Phantomjs (1.9.2)
#   - ImageMagick (using apt-get)
#
# Build with:
#
#     docker build -t walm/ruby-node-ssh .
#
# Run using
#
#     docker run -d walm/ruby-node-ssh
#
#
# VERSION               1.0

FROM walm/ruby-node
MAINTAINER Andreas Wålm "andreas@walm.net"

# Install using one RUN line to get around 42 AUFS layers limit.
RUN \
  echo "# Install OpenSSH Server" ;\
  apt-get -q -y install openssh-server ;\
  mkdir -p /var/run/sshd ;\
  echo 'root:passw0rd' | chpasswd ;\
  \
true
# END RUN

EXPOSE  22
EXPOSE  3000
EXPOSE  9000

CMD ["/usr/sbin/sshd", "-D"]

