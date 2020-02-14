#!/bin/bash

train=$1

rm y
for i in test/*; do  file=`basename "$i"`; 
		     a=`cat train/$train |./kl.perl test/$file`;
		     b=`cat test/$file |./kl.perl train/$train`;
		     z=`./mean.perl $a $b`
		     echo "$z $train $file" >> y ;
		     
done
cat y |awk '{print $4,$5,$1}' |./normalizarZ.perl |sort -g > yy
