#!/bin/bash

TREINO="../corpus/train"
MODEL="./models"
LEX="./lexicon"


Target=$1
#Test=$2
#Size=$3

#echo "criando ngrams: lm = $Target -- teste = $Test"
#cat $TREINO/$Target  |~/Linguakit-master/linguakit tok es  > $MODEL"/unigram_"$Target".ngram"
cat $TREINO/$Target   |./tokenizer_ch.perl  |./7grams.perl  > $MODEL"/unigram_"$Target".ngram"

echo "$Target"
cat $MODEL"/unigram_"$Target".ngram" |sed "s/ /_/g" |sort |uniq -c |sort -nr > $LEX/$Target".lx"
#cat $Target.lx |./ranking_new.perl $Test.lx $Size


