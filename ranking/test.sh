#!/bin/bash

TEST="../corpus/test"
MODEL="./models"
LEX="./lexicon"


Train=$1
Test=$2
Size=$3

#echo "criando ngrams: lm = $Target -- teste = $Test"
#cat $TEST/$Test  |~/Linguakit-master/linguakit tok es  > $MODEL"/unigram_"$Test".ngram"
cat $TEST/$Test  |./tokenizer_ch.perl  |./7grams.perl  > $MODEL"/unigram_"$Test".ngram"

#echo "$Target -- $Test"
cat $MODEL/unigram_$Test.ngram |sed "s/ /_/g" |sort |uniq -c |sort -nr > $LEX/$Test".lx"
cat $LEX/$Train".lx" |./ranking_new.perl $LEX/$Test".lx" $Size $Train $Test


