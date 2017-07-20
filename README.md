[![Build Status](http://img.shields.io/travis/kylepjohnson/python_bootstrap.svg?style=flat)](https://travis-ci.org/kylepjohnson/python_bootstrap)


About
-----
This is a shell script for an automated build of the latest version of Python 2 (2.7.x) or 3 (3.6.x) on an LTS version of Ubuntu (the build server on Travis CI currently uses 14.04). All prerequisite software is installed and all default Python features are enabled.

Use
---

``` bash
curl -O https://raw.githubusercontent.com/kylepjohnson/python_bootstrap/master/install.sh

chmod +x install.sh

./install.sh 3  # installs Python 3

./install.sh 2  # installs Python 2
```

For optimized builds (i.e., to build with `./configure --enable-optimizations`), add the flag "optimize" after (e.g., `./install 3 optimize`). This slows the build down significantly however can offer runtime improvements of 10-20% ([source](https://stackoverflow.com/a/41408261)).

``` bash
./install.sh 3 optimize  # installs Python 3 optimize  # speeds code, but slower installation

./install.sh 2 optimize  # installs Python 2 optimize  # speeds code, but slower installation
```

To test if installation was successful, create a vitual environment (`python3.6 -m venv venv-name`, for Python 3), enable it (`source venv-name/bin/activate`), and check the version (`python --version`).


LICENSE
-------
Copyright (c) 2014 Kyle P. Johnson, under the MIT License. See file LICENSE for details.
