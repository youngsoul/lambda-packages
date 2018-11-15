##Build

`./build.sh PyNaCl 1.0.1`

## AWS Lambda execution environment
Built on **ami-48d38c2b**, Asia Pacific (Sydney), ap-southeast-2.

See
[official docs](http://docs.aws.amazon.com/lambda/latest/dg/current-supported-versions.html)
for more details about supported version.

On a machine with docker and access to lambci images:

```
docker run --rm -v `pwd`:/app lambci/lambda:build-python2.7 bash -c "cd /app && /app/build_docker.sh --docker --py2-only PyNaCl 1.3.0"
docker run --rm -v `pwd`:/app lambci/lambda:build-python3.6 bash -c "cd /app && /app/build_docker.sh --docker --py3-only PyNaCl 1.3.0"
```
