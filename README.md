# AVL: Average Language Distance

## Description:
It uses the mean of 4 distance measures (perplexity, kullback-leibler, ranking based, and average cosine) to compute the distance between languages. In the corpus folder, you'll find 40 files representing 40 European languages.

## Requirements:
* Linux, Bash, Perl
* Perl module: Math::KullbackLeibler::Discrete [Alberto Simões](https://metacpan.org/author/AMBS). 
## How to use:
It takes as input the name of one of the files in `corpus/all`, compute all the distances against the rest of files and gives as result the final mean. For instance, if you wish to compare the Basque lanaguage against the rest of languages, you need to run this:

```
sh ald.sh basque.txt
```

The final results are in the file `mean/mean.txt`.

The input language texts are in directory `corpus/all`
