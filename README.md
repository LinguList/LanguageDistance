# AVL: Average Language Distance

## Description:
It uses the mean of 4 distance measures (perplexity, kullback-leibler, ranking based, and average cosine) to compute the distance between languages. In the corpus folder, you'll find 40 files representing forty European languages  

## Requirements:
* Linux, Bash, Perl
* Perl module: Math::KullbackLeibler::Discrete [Alberto Simões](https://metacpan.org/author/AMBS). 
## How to use:

```
sh run.sh basque.txt
```

The final results are in the file `mean/mean.txt`.

The input language texts are in directory `corpus/all`
