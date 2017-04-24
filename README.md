![Logo](http://i.imgur.com/AlmKP2q.png)

# lambda-packages
[![Build Status](https://travis-ci.org/Miserlou/lambda-packages.svg)](https://travis-ci.org/Miserlou/lambda-packages)
[![PyPI](https://img.shields.io/pypi/v/lambda-packages.svg)](https://pypi.python.org/pypi/lambda-packages)
[![Slack](https://img.shields.io/badge/chat-slack-ff69b4.svg)](https://slack.zappa.io)

Various popular libraries, pre-compiled to be compatible with AWS Lambda.

Currently includes (at least Python 2.7) support for:

* bcrypt
* cffi
* cryptography
* datrie_extended 
* LXML
* misaka
* MySQL-Python
* numpy
* OpenCV
* Pillow (PIL)
* psycopg2
* PyCrypto
* PyNaCl
* pyproj
* python-ldap
* python-Levenshtein
* regex

This project is intended for use by [Zappa](https://github.com/Miserlou/Zappa), but could also be used by any Python/Lambda project.

## Installation

    pip install lambda-packages

## Usage

The best way to use these packages is with [Zappa](https://github.com/Miserlou/Zappa), which will automatically install the right packages during deployment, and do a million other useful things. Whatever you're currently trying to do on Lambda, it'll be way easier for you if you just use Zappa right now. Trust me. It's awesome. As a bonus, Zappa now also provides support for [manylinux wheels](https://blog.zappa.io/posts/zappa-adds-support-for-manylinux-wheels), which adds support for hundreds of other packages.

But, if you want to use this project the other (wrong) way, just put the contents of the .tar.gz archive into your lambda .zip.

**lambda-packages** also includes a manifest with information about the included packages and the paths to their binaries.

```python
from lambda_packages import lambda_packages

print lambda_packages['psycopg2']

#{
#    'python2.7': {
#        'version': '2.6.1',
#        'path': '<absolute-local-path>/lambda_packages/psycopg2/python2.7-psycopg2-2.6.1.tar.gz'
#    }
#}
```

## Contributing

### Before you submit a new package or runtime check if it has a manylinux wheels version in PyPi

Using manylinux wheels should be the preferred way to get pre-compiled packages into your Lambda deployment. In fact this is what Zappa does if it can't find the package here. So before you do any work to submit a new package, please check if it has a manylinux wheels version via http://pythonwheels.com/ and https://pypi.python.org/. In PyPi look for files ending with `cp27-cp27mu-manylinux1_x86_64.whl` and `cp36-cp36m-manylinux1_x86_64.whl` for your package.

e.g. https://pypi.python.org/packages/36/03/e2b03f747595905a9e28f3cb0adee516f2a409aeeea7f15d4af22f029b3e/pandas-0.20.0rc1-cp36-cp36m-manylinux1_x86_64.whl

### No manylinux wheels version or it is not working with Lambda for some reason?

To add support for more packages, send a pull request containing a gzipped tarball of the package (built on Amazon Linux and tested on AWS Lambda) in the appropriate directory, an updated manifest, and deterministic build instructions for creating the archive.

You may find the [build.sh script](https://github.com/Miserlou/lambda-packages/blob/master/lambda_packages/cryptography/build.sh) useful as a starting point.

Useful targets which don't have manylinux wheels versions include:

* MongoEngine

## Support / Development / Training / Consulting

Do you need help with..

  * Porting existing Python applications to AWS Lambda?
  * Building new applications and services that scale infinitely?
  * Reducing your operations and hosting costs?
  * Training your team to use AWS and other server-less paradigms?

Good news! We're currently available for remote and on-site consulting for small, large and enterprise teams. Please contact <miserlou@gmail.com> with your needs and let's work together!

<br />
<p align="center">
  <a href="https://gun.io"><img src="http://i.imgur.com/M7wJipR.png" alt="Made by Gun.io"/></a>
</p>
