#!/bin/bash

N=$1
DIR=$2 #test or train

#sh run_create.sh 500 test

#for i in  ../corpus/$DIR/*; do echo $i; file=`basename "$i"`; echo $file; cat $i | ~/Linguakit-master/linguakit tok es |grep -P "^[a-z]" |sort |uniq -c |sort -nr |head -$N   >  ./$DIR/$file
for i in  ../corpus/$DIR/*; do echo $i; file=`basename "$i"`; echo $file; cat $i | ./tokenizer_ch.perl  |./7grams.perl  |sort |uniq -c |sort -nr |head -$N   >  ./$DIR/$file 
done
