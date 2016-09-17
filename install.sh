#!/bin/bash

######################
# UPDATE AND UPGRADE #
######################
# if argument does not exist (as for user build), update aptitude; else do not
if [ -z "$1" ]
then
  echo "update apt-get"
  sudo apt-get update
  sudo apt-get -y upgrade
else
  echo "do not update apt-get"
fi

##################
# INSTALL BASICS #
##################
sudo apt-get -y install git

##################
# INSTALL PYTHON #
##################
# install dependencies for all Python 3.5 modules
sudo apt-get -y install build-essential
sudo apt-get -y install bzip2
sudo apt-get -y install libbz2-dev
sudo apt-get -y install libncurses5-dev
sudo apt-get -y install libssl-dev
sudo apt-get -y install libreadline6-dev
sudo apt-get -y install liblzma-dev
sudo apt-get -y install libsqlite3-dev
sudo apt-get -y install libgdbm-dev
sudo apt-get -y install tk8.5-dev

# fetch and install Python source
cd /tmp
wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tar.xz
tar xvf Python-3.5.2.tar.xz

#make and install
cd /tmp/Python-3.5.2
./configure
make
sudo make install

# cleanup
cd /tmp
rm Python-3.5.2.tar.xz
sudo rm -rf Python-3.5.2
