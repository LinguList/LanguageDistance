#!/bin/bash

MODEL_TRAIN="./train"
MODEL_TEST="./test"
PROGS="./scripts";
#train=$1
#N=$2

#rm train/*
#rm test/*
#echo "Generating the models"
#sh train.sh  $train $N

##colocar todos os ficheiros em test
rm x
for i in $MODEL_TEST/*; do  file1=`basename "$i"`;
    for j in $MODEL_TEST/* ; do file2=`basename "$j"`;
       cat $i | $PROGS/cosine.perl $j $file1 $file2 >> x;
   done 			     
done

cat x |./scripts/cluster.perl |sort -g |./scripts/cluster2.perl > xx

