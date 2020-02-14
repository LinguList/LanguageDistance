#!/bin/bash

TEST="./corpora/test"
PROG="./scripts"
MODEL="./models"

Train=$1
Target=$2

#echo $Target
#cat $TEST/$Target |tr -d '\015' |~/Linguakit-master/linguakit tok es  |$PROG/7grams.perl  |$PROG/perplexity_setegrams.perl $Train $Target
#cat $TEST/$Target |tr -d '\015' |~/Linguakit-master/linguakit tok es  |$PROG/2grams.perl  |$PROG/perplexity_bigrams.perl $Train $Target
#cat $TEST/$Target |tr -d '\015' |~/Linguakit-master/linguakit tok es  |$PROG/perplexity_unigrams.perl $Train $Target

cat $TEST/$Target |tr -d '\015' |$PROG/tokenizer_ch.perl  |$PROG/7grams.perl  |$PROG/perplexity_setegrams.perl $Train $Target
