from __future__ import division
import os
import cv2
import os
import numpy as np


def read_16bit(x):
    img = cv2.imread(x, -1)
    img = img.astype(np.float32) / 256
    return img 


def create_dir(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)


def save_16bit(destination, disparity):
    dirname = os.path.dirname(destination)
    create_dir(dirname)
    cv2.imwrite(destination, (disparity * 256).astype(np.uint16))


def get_cmap(cmap):
    AVAILABLE_CMAPS = {
        'magma': cv2.COLORMAP_MAGMA,
        'jet': cv2.COLORMAP_JET
    }
    assert cmap in AVAILABLE_CMAPS.keys()
    return AVAILABLE_CMAPS[cmap]


def save_color(destination, disparity, cmap):
    dirname = os.path.dirname(destination)
    create_dir(dirname)
    colormap_func = get_cmap(cmap)
    colored = cv2.applyColorMap(np.uint8(disparity), colormap_func)
    cv2.imwrite(destination, colored)