[![Build Status](http://img.shields.io/travis/kylepjohnson/python3_bootstrap.svg?style=flat)](https://travis-ci.org/kylepjohnson/python3_bootstrap)

About
-----
This is a shell script for an automated build of the latest version of Python 3 (3.5.0) on the latest LTS version of Ubuntu (14.04). All prerequisite software is installed and all default Python features are enabled.

This build was created and tested on [Ubuntu's own Vagrant box, available at vagrantbox.es](http://www.vagrantbox.es/). It should work in all Ubuntu 14.04 environments.

Use
---
The simplest workflow for a fresh install, without git yet installed, is:

``` bash
curl -O https://raw.githubusercontent.com/kylepjohnson/python3_bootstrap/master/ubuntu14.sh

chmod +x ubuntu14.sh

./ubuntu14.sh
```

To test if installation was successful, create a vitual environment (`pyvenv venv`), enable it (`source venv/bin/activate`), and check the version (`python --version`).

Contribute
----------
Pull requests are always welcome. If you would like to modify this script for other OS, please feel free. 

LICENSE
-------
Copyright (c) 2014 Kyle P. Johnson, under the MIT License. See file LICENSE for details.
