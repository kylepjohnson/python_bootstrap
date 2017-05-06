[![Build Status](http://img.shields.io/travis/kylepjohnson/python3_bootstrap.svg?style=flat)](https://travis-ci.org/kylepjohnson/python3_bootstrap)

About
-----
This is a shell script for an automated build of the latest version of Python 3 (3.6.x) on the latest LTS version of Ubuntu (16.04). All prerequisite software is installed and all default Python features are enabled.

Use
---
The simplest workflow for a fresh install, without git yet installed, is:

``` bash
curl -O https://raw.githubusercontent.com/kylepjohnson/python3_bootstrap/master/install.sh

chmod +x install.sh

./install.sh
```

To test if installation was successful, create a vitual environment (`python -m venv venv-name`), enable it (`source venv-name/bin/activate`), and check the version (`python --version`).

Contribute
----------
Pull requests are always welcome. If you would like to modify this script for other OS, please feel free. 

LICENSE
-------
Copyright (c) 2014 Kyle P. Johnson, under the MIT License. See file LICENSE for details.
