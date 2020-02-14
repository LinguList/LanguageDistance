#!/bin/bash

MODEL_TRAIN="./train"
MODEL_TEST="./test"
PROGS="./scripts";
train=$1
N=$2

rm train/*
rm test/*
#echo "Generating the models"
sh train.sh  $train $N

#echo "Making all possible tests"
rm w
for i in $MODEL_TEST/*; do  file=`basename "$i"`; 
    cat $MODEL_TRAIN/$train | $PROGS/cosine.perl $i $train $file >> w;
    			     
done
cat w |./normalizarZ.perl |sort -g > ww
