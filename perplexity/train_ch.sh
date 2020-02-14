#!/bin/bash

TREINO="./corpora/train"
PROG="./scripts"
MODEL="./models"

Target=$1

 echo "building model of $Target"
 cat $TREINO/$Target |tr -d '\015'  |$PROG/tokenizer_ch.perl  |$PROG/7grams.perl  |$PROG/model_setegrams.perl $Target 


