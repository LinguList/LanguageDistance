#!/bin/bash

TREINO="./corpora/train"
PROG="./scripts"
MODEL="./models"

Target=$1



##word ngrams

#cat $TREINO/$Target |tr -d '\015'  |~/Linguakit-master/linguakit tok es |$PROG/7grams.perl  |$PROG/model_setegrams.perl $Target 
#cat $TREINO/$Target |tr -d '\015'  |~/Linguakit-master/linguakit tok es  |$PROG/2grams.perl  |$PROG/model_bigrams.perl $Target
#cat $TREINO/$Target |tr -d '\015'  |~/Linguakit-master/linguakit tok es |cut -f 1 |sed "s/ /@/g"   |$PROG/model_unigrams.perl $Target 

##character ngrams
cat $TREINO/$Target |tr -d '\015'  |$PROG/tokenizer_ch.perl  |$PROG/7grams.perl  |$PROG/model_setegrams.perl $Target 
