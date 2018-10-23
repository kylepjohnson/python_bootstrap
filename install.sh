#!/bin/bash

py2ver=2.7.15
py3ver=3.7.1

if [ -z "$1" ]
  then
    echo "No argument supplied. Selecting Python 3."
    pyVersion=3
elif [ $1 == "2" ]
then
  echo "Installing Python 2.x"
  pyVersion=2
elif [ $1 == "3" ]
then
  echo "Installing Python 3.x"
  pyVersion=3
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

if [ $pyVersion == 2 ]
then

  # fetch and install Python source
  wget https://www.python.org/ftp/python/$py2ver/Python-$py2ver.tar.xz
  tar xvf Python-$py2ver.tar.xz

  #make and install
  cd Python-$py2ver
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
  rm Python-$py2ver.tar.xz
  sudo rm -rf Python-$py2ver

  # install pip + virtualenv
  sudo python2.7 -m ensurepip
  sudo /usr/local/bin/pip install virtualenv

elif [ $pyVersion == 3 ]
then

  # fetch and install Python source
  wget https://www.python.org/ftp/python/$py3ver/Python-$py3ver.tar.xz
  tar xvf Python-$py3ver.tar.xz

  #make and install
  cd /tmp/Python-$py3ver
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
  rm Python-$py3ver.tar.xz
  sudo rm -rf Python-$py3ver

fi

