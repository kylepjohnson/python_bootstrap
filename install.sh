#!/bin/bash

###################
# DEFINE VERSIONS #
###################
latestPy2=2.7.15
latestPy3=3.7.1

###################
# CHECK ARGUMENTS #
###################
if [ -z "$1" ]
  then
    echo "No argument supplied. Selecting Python 3."
    pyVersionArg=3
    pyVersion=$latestPy3
elif [ $1 == "2" ]
then
  echo "Installing Python 2.x"
  pyVersionArg=2
  pyVersion=$latestPy2
elif [ $1 == "3" ]
then
  echo "Installing Python 3.x"
  pyVersionArg=3
  pyVersion=$latestPy3
else
  echo "Invalid argument. Choose 2 or 3."
  echo "Exiting"
  exit 1
fi

######################
# UPDATE AND UPGRADE #
######################
sudo apt-get update
sudo apt-get -y upgrade

##################
# INSTALL BASICS #
##################
sudo apt-get -y install git

##################
# INSTALL PYTHON #
##################
# install dependencies for all Python 3.6 modules
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
sudo apt-get -y install libffi-dev

cd /tmp

# fetch and install Python source
wget https://www.python.org/ftp/python/$pyVersion/Python-$pyVersion.tar.xz
tar xvf Python-$pyVersion.tar.xz

#make and install
cd /tmp/Python-$pyVersion
if [ $2 == "optimize" ]
then
./configure --enable-optimizations
else
./configure
fi
make
sudo make install

# cleanup
cd /tmp
rm Python-$pyVersion.tar.xz
sudo rm -rf Python-$pyVersion

if [ $pyVersionArg == 2 ]
then
  # install pip + virtualenv
  sudo python2.7 -m ensurepip
  sudo /usr/local/bin/pip install virtualenv
fi
