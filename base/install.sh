echo "# Base setup"
apt-get update -qq
apt-get install -q -y wget curl

echo "# Setting up app user"
addgroup --gid 9999 app
adduser --uid 9999 --gid 9999 --disabled-password --gecos "Application" app
usermod -L app

echo "# Cleaning up"
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
