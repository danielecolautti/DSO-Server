from __future__ import division
import argparse
import cv2
import os
import glob
import numpy as np
from utility_functions import read_16bit, save_16bit

parser = argparse.ArgumentParser(description='Turn disparity maps into depths')
parser.add_argument('--disp', type=str, help='path to folder with disparities')
parser.add_argument('--dest', type=str, help="destination folder, where depth maps will be saved", default="./depths")

args = parser.parse_args()



width_to_focal = dict()
width_to_focal[1242] = 721.5377
width_to_focal[1241] = 718.856
width_to_focal[1224] = 707.0493
width_to_focal[1238] = 718.3351

baseline = 0.54

if __name__ == '__main__':
    n = 0
    for x in glob.glob(os.path.join(args.disp,'*.png')):
        
        try:
            disp = read_16bit(x)
        except:
            print("cannot read image {}".format(x))
            continue

        h,w = disp.shape
        mask = disp > 0
        depth = baseline * width_to_focal[w] / (disp + (1 - mask))
        depth *= mask
        dest = os.path.join(args.dest, os.path.basename(x))
        save_16bit(dest, depth)
        n+=1

    print('Done! {} depth images have been saved in {}'.format(n, args.dest))

