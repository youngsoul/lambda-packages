# DLib - precompiled for Lambda

## Build

### Python 2.7

```
./build 2.7
```

or

### Python 3.6

```
./build 3.6
```

## Shell (for debugging)

### Python 2.7

```
docker run -v$(pwd):/app -it --rm lambci/lambda:build-python2.7 bash
```

### Python 3.6

```
docker run -v$(pwd):/app -it --rm lambci/lambda:build-python3.6 bash
```

## Testing

### Python 2.7

```
docker run -v$(pwd):/app -it --rm lambci/lambda:build-python2.7 bash
tar -xzvf python2.7-dlib-19.8.tar.gz
pip install scikit-learn
PYTHONPATH=$(pwd) python test/test_dlib.py
```

### Python 3.6

```
docker run -v$(pwd):/app -it --rm lambci/lambda:build-python3.6 bash
tar -xzvf python3.6-dlib-19.8.tar.gz
pip install scikit-learn
PYTHONPATH=$(pwd) python test/test_dlib.py
```
