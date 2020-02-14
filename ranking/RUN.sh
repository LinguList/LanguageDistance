#!/bin/bash

train=$1
N=100

#echo "Generating the models"
sh train.sh  $train

#echo "Making all possible tests"
rm z
for i in ../corpus/test/*; do  file=`basename "$i"`; 
    sh test.sh $train $file $N >> z;
    			     
done
cat z |./normalizarZ.perl |sort -g > zz
