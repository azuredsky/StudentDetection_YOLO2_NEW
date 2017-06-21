filenum_txt=$(ls -l Image_Retrain_txt/ |wc -l)
filenum_txt=$[filenum_txt-1]
count=1
while(($count<=$filenum_txt))
do
    filename="Image_Retrain_txt/$count.txt"
    Outfilename="ImageRetrain_results"
    ./darknet detect cfg/yolo.cfg yolo.weights $filename $Outfilename -thresh 0.2
    let "count++"
done
python ImageRetrain_United.py