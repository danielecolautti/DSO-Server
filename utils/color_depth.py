import cv2
import numpy as np
import os
import argparse
from utility_functions import read_16bit, save_color

parser = argparse.ArgumentParser(description='Color a disparity/depth stored as 16 bit image')
parser.add_argument('--img', type=str, help='path to folder with disparities')
parser.add_argument('--cmap', default="magma", choices=['magma', 'jet'])
parser.add_argument('--dest', type=str, help="destination folder, where colored map will be saved", default="./colored")

args = parser.parse_args()

if __name__ == '__main__':
    try:
        values = read_16bit(args.img)
    except:
        raise ValueError('cannot read image: {}'.format(args.img))
    name = os.path.basename(args.img)
    dest = os.path.join(args.dest, name)
    save_color(dest, values, args.cmap)
    print('Done! Colored img saved in: {}'.format(dest))