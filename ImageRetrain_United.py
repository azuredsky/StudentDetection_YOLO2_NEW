import cv2
import numpy as np
import os
import re
import csv
import sys
import copy

def ImageRetrainUnited(CsvFilepath):
    img=cv2.imread("img_united.png")
    pattern='.csv'
    for filename in os.listdir(CsvFilepath):
        match=re.search(pattern,filename)
        if match is not None:
            x_add=int(filename.split('.')[0].split('_')[0])
            y_add=int(filename.split('.')[0].split('_')[1])
            fp=open(CsvFilepath+filename)
            r=csv.reader(fp)
            for row in r:
                box=[x,y,w,h]=[int(row[1]),int(row[2]),int(row[3]),int(row[4])]
                x=x+x_add
                y=y+y_add
                cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),1)
            fp.close()
    cv2.imshow("img_united_new",img)
    cv2.imwrite("img_united.png",img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

CsvFilepath='ImageRetrain_results/'
ImageRetrainUnited(CsvFilepath)
