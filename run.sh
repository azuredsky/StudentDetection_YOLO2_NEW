#!/bin/bash
thresh_val=0.2
heigth_split_num=$1
width_split_num=$2
filenum=$[heigth_split_num*width_split_num/3]
tmp=$[heigth_split_num*width_split_num-filenum*3]
flag=1
tmp1=0
if test $[tmp] -ne $[tmp1]
then
    filenum=$[filenum+1]
fi
python SplitImage.py $heigth_split_num $width_split_num
while(($flag<=filenum))
do
    filename="Image_Split/Image_Split_names$flag.txt"
    ./darknet detect cfg/yolo.cfg yolo.weights $filename -thresh $thresh_val
    let "flag++"
done
python ImageUnited.py $heigth_split_num $width_split_num
