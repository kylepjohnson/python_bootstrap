#!/bin/bash


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

if [ $1 == "2" ]
then
  echo "Installing Python 2.x"

  # fetch and install Python source
  wget https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tar.xz
  tar xvf Python-2.7.15.tar.xz

  #make and install
  cd Python-2.7.15
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
  rm Python-2.7.15.tar.xz
  sudo rm -rf Python-2.7.15

  # install pip + virtualenv
  sudo python2.7 -m ensurepip
  sudo /usr/local/bin/pip install virtualenv


elif [ $1 == "3" ]
then
  echo "Installing Python 3.x"

  # fetch and install Python source
  wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
  tar xvf Python-3.7.0.tar.xz

  #make and install
  cd /tmp/Python-3.7.0
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
  rm Python-3.7.0.tar.xz
  sudo rm -rf Python-3.7.0

else
  echo "Choose '2' or '3'."
fi

