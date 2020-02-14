#!/bin/bash

TREINO="../corpus/train"
TEST="../corpus/test"
PROGS="./scripts"
MODEL_TRAIN="./train"
MODEL_TEST="./test"

Target=$1
N=$2

#cat $TREINO/$Target |~/Linguakit-master/linguakit tok es  |$PROGS/token2freq.perl $N >  $MODEL_TRAIN/$Target
cat $TREINO/$Target |$PROGS/tokenizer_ch.perl  |$PROGS/7grams.perl   |$PROGS/token2freq.perl $N >  $MODEL_TRAIN/$Target


for i in  $TEST/*; do echo $i; file=`basename "$i"`; 
#		   cat $i  |~/Linguakit-master/linguakit tok es  | $PROGS/token2freq.perl $N >  $MODEL_TEST/$file		      
		   cat $i   |$PROGS/tokenizer_ch.perl  |$PROGS/7grams.perl  | $PROGS/token2freq.perl $N >  $MODEL_TEST/$file    
done
