About
-----
This is a shell script for an automated build of the latest version of Python 3 (3.4.1) on the latest LTS version of Ubuntu (14.04). All prerequisite software is installed and all default Python features are enabled.

This build was created and tested on [Ubuntu's own Vagrant box, available at vagrantbox.es](http://www.vagrantbox.es/), though it should work in all Ubuntu 14.04 environments.

Use
---
The simplest workflow for a fresh install, without git yet installed, is:

``` bash
curl -O https://raw.githubusercontent.com/kylepjohnson/python3_bootstrap/master/install_ubuntu_14.sh

chmod +x install_ubuntu_14.sh

./install_ubuntu_14.sh
```


LICENSE
-------
Copyright (c) 2014 Kyle P. Johnson, under the MIT License. See file LICENSE for details.
