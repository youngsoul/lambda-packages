#!/bin/bash

PACKAGE=${1}
VERSION=${2}
TMP_DIR="${PACKAGE}_${VERSION}"

mkdir ${TMP_DIR}
cd  ${TMP_DIR}
echo "Packaging ${PACKAGE}"

echo "do update"
sudo yum update -y

sudo yum groupinstall -y "Development Tools"

echo "do dependcy install"

sudo yum install -y gcc libxml2-devel xmlsec1-devel xmlsec1-openssl-devel libtool-ltdl-devel

ENV="env-${PACKAGE}-${VERSION}"

echo "make ${ENV}"
virtualenv "${ENV}"

echo "activate env in `pwd`"
source "${ENV}/bin/activate"

# https://github.com/pypa/pip/issues/3056
echo '[install]' > ./setup.cfg
echo 'install-purelib=$base/lib64/python' >> ./setup.cfg


TARGET_DIR=${ENV}/packaged
echo "install pips"
pip install --verbose --use-wheel --no-dependencies --target ${TARGET_DIR} "${PACKAGE}==${VERSION}"
deactivate

cp `rpm -ql xmlsec1 | grep "libxmlsec1.so.1$"` ${TARGET_DIR}
cp `rpm -ql xmlsec1-openssl | grep "libxmlsec1-openssl.so$"` ${TARGET_DIR}

cd ${TARGET_DIR} && tar -zcvf ../../../${PACKAGE}-${VERSION}.tar.gz * && cd ../../..
rm -rf ${TMP_DIR}
