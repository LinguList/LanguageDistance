#!/bin/bash

train=$1

#echo "Generating the models"
#sh train.sh  $train

#echo "Making all possible tests"
rm x
for i in corpora/train/*; do  file=`basename "$i"`;
    sh train.sh $file
    sh test.sh $file $train >> x; 			     
done
cat x |awk '{print $2,$1,$3}' |./normalizarZ.perl |sort -g > xx
