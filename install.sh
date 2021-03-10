#!/bin/bash

# TODO: Autodetect Ubuntu or RHEL?
# TODO: Improve the commandline arguments for optimization
# TODO: Check for latest version online, then install that (no more version declaration)
# TODO: Provide specific version as arg and fetch/build that

###################
# DEFINE VERSIONS #
###################
latestPy2=2.7.16
latestPy3=3.9.2

###################
# CHECK ARGUMENTS #
###################
# for version
if [ -z "$1" ]
then
    echo "Argument 1: No argument supplied. Selecting Python 3."
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
  echo "Argument 1: Invalid argument. Choose 2 or 3."
  echo "Exiting"
  exit 1
fi

# for optimized build
if [ -z "$2" ]
then
  echo "Argument 2: No argument supplied for optimizing build. Not optimizing."
  do_Optimize=false
elif [ $2 == "optimize" ]
then
  do_Optimize=true
  echo "Argument 2: Optimizations chosen."
else
  do_Optimize=false
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

########################
# INSTALL DEPENDENCIES #
########################
# install dependencies for all Python 3.x modules
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
sudo apt-get -y install zlib1g-dev

################
# BUILD PYTHON #
################
cd /tmp
# fetch and install Python source
wget https://www.python.org/ftp/python/$pyVersion/Python-$pyVersion.tar.xz
tar xvf Python-$pyVersion.tar.xz
#make and install
cd /tmp/Python-$pyVersion
if [ $do_Optimize == true ]
then
  echo "Building with optimizations ..."
  ./configure --enable-optimizations
else
  echo "Building without optimizations ..."
  ./configure
fi
make
sudo make install
# cleanup
cd /tmp
rm Python-$pyVersion.tar.xz
sudo rm -rf Python-$pyVersion
# version-specific installation steps
if [ $pyVersionArg == 2 ]
then
  # install pip + virtualenv
  sudo python2.7 -m ensurepip
  sudo /usr/local/bin/pip install virtualenv
fi
