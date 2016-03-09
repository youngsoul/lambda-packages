import os
import sys
from PIL import Image

def do(event, context):
	im = Image.open("test.jpg")
	return {'format': im.format, 'size':{'width':im.size[0], 'height':im.size[1]}, 'mode':im.mode}

if __name__ == '__main__':
    print(do(event=None, context=None))