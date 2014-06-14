######################
# UPDATE AND UPGRADE #
######################
sudo apt-get update
sudo apt-get -y upgrade

##################
# INSTALL BASICS #
##################
sudo apt-get install git

##################
# INSTALL PYTHON #
##################
# install dependencies for all Python 3.4 modules
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

# fetch and install Python 3.4.0 source
cd /tmp
wget https://www.python.org/ftp/python/3.4.1/Python-3.4.1.tar.xz
tar xvf Python-3.4.1.tar.xz

#make and install
cd /tmp/Python-3.4.1
./configure
make
sudo make install

# cleanup
cd /tmp
rm Python-3.4.1.tar.xz
sudo rm -rf Python-3.4.1
