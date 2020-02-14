
train=$1

rm corpus/train/*
rm corpus/test/*
rm perplexity/models/*
rm perplexity/corpora/test/*
rm perplexity/corpora/train/*
rm kullbackleibler/test/*
rm kullbackleibler/train/*


cat corpus/all/$1 |corpus/transcript.perl >  corpus/test/$1
for i in corpus/all/*; do file=`basename "$i"`; cat $i |./corpus/transcript.perl > corpus/train/$file ;done
       
rm corpus/train/$train

echo "perplexity"
cd perplexity
#sh run_create.sh 50000 test
#sh run_create.sh 250000 train
sh run_create.sh 5000 test
sh run_create.sh 50000 train
sh RUN.sh $train

cd ../
rm corpus/train/*
rm corpus/test/*
#cp corpus/all/$1 corpus/train/.
#cp corpus/all/* corpus/test/.
cat corpus/all/$1 |corpus/transcript.perl >  corpus/train/$1
for i in corpus/all/*; do file=`basename "$i"`; cat $i |./corpus/transcript.perl > corpus/test/$file ;done
rm corpus/test/$train


cd ./kullbackleibler
echo "KL"
sh run_create.sh 5000 test
sh run_create.sh 5000 train
sh RUN.sh $train

cd ../ranking
echo "ranking" ##N=100
sh RUN.sh $train

cd ../matrix
echo "matrix"
sh RUN.sh $train 50000


cd ../mean
echo "mean"
sh run_mean.sh

