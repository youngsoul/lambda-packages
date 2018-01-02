"""Test installed Dlib package: requires scikit-image: ``pip install scikit-image``."""
import dlib

from skimage import io

if __name__ == '__main__':
    img = io.imread('asap-mob.jpg')
    detector = dlib.get_frontal_face_detector()
    faces = detector(img, 2)
    assert len(faces) == 8
    print("DLib is working!")
