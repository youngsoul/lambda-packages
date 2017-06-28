#!/bin/bash

PACKAGE=${1}
VERSION=${2}
TMP_DIR="${PACKAGE}_${VERSION}"

set -e

mkdir ${TMP_DIR}
cd  ${TMP_DIR}
echo "Packaging ${PACKAGE}"

echo "do update"
yum update -y

yum groupinstall -y "Development Tools"

echo "do dependency install"

yum install -y libffi libffi-devel openssl openssl-devel

ENV="env-${PACKAGE}-${VERSION}"

echo "make ${ENV}"
python3.6 -m venv "${ENV}"

echo "activate env in `pwd`"
source "${ENV}/bin/activate"

# https://github.com/pypa/pip/issues/3056
echo '[install]' > ./setup.cfg
echo 'install-purelib=$base/lib64/python' >> ./setup.cfg


TARGET_DIR=${ENV}/packaged
echo "install pips"
pip3.6 install --verbose --use-wheel --no-dependencies --target ${TARGET_DIR} "${PACKAGE}==${VERSION}"
deactivate

cd ${TARGET_DIR} && tar -zcvf ../../../${PACKAGE}-${VERSION}.tar.gz * && cd ../../..
mv ${PACKAGE}-${VERSION}.tar.gz /app/
rm -rf ${TMP_DIR}
