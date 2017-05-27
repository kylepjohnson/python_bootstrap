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


cd /tmp

if [ $1 == "2" ]
then
  echo "Installing Python 2.x"

# fetch and install Python source
wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tar.xz
tar xvf Python-2.7.13.tar.xz

#make and install
cd Python-2.7.13
./configure --enable-optimizations
make
sudo make install

# cleanup
cd /tmp
rm Python-2.7.13.tar.xz
sudo rm -rf Python-2.7.13

# install pip + virtualenv
sudo python2.7 -m ensurepip
sudo /usr/local/bin/pip install virtualenv

# mk virtualenv and test
virtualenv venv27
source venv27/bin/activate


elif [ $1 == "3" ]
then
  echo "Installing Python 3.x"

# fetch and install Python source
wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz
tar xvf Python-3.6.1.tar.xz

#make and install
cd /tmp/Python-3.6.1
./configure
make
sudo make install

# cleanup
cd /tmp
rm Python-3.6.1.tar.xz
sudo rm -rf Python-3.6.1

else
  echo "Choose '2' or '3'."
fi

