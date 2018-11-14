##Build

On an machine with Amazon Linux:

`./build.sh paramiko 2.4.1`

On a machine with docker and access to lambci images:

```
docker run --rm -v `pwd`:/app lambci/lambda:build-python2.7 bash -c "cd /app && /app/build.sh --docker --py2-only paramiko 2.4.1"
docker run --rm -v `pwd`:/app lambci/lambda:build-python3.6 bash -c "cd /app && /app/build.sh --docker --py3-only paramiko 2.4.1"
```
