#!/bin/bash

N=$1
DIR=$2 #test or train

#sh run_create.sh 5000 test

for i in  ../corpus/$DIR/*; do echo $i; file=`basename "$i"`; echo $file; cat $i  |./random_sort.perl $N  |./transcript.perl >  ./corpora/$DIR/$file
done
