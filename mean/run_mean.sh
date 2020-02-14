#cat ../kullbackleibler/yy |./mean.perl ../perplexity/xx |./mean.perl ../ranking/zz |./mean.perl ../matrix/ww |sort -g > mean.txt

cat ../perplexity/xx |gawk '{count+=1}{print count, $0}' > results/xx
cat ../kullbackleibler/yy |gawk '{count+=1}{print count, $0}' > results/yy
cat ../ranking/zz |gawk '{count+=1}{print count, $0}' > results/zz
cat ../matrix/ww |gawk '{count+=1}{print count, $0}' > results/ww

cat results/* |./mean_rank.perl  |sort -g > mean.txt

#cat ../kullbackleibler/yy |./mean.perl ../perplexity/xx  |sort -g > mean.txt
