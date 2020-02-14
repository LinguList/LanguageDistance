#!/usr/bin/env perl 

binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open qw(:std :utf8);
#use Math::BigInt;
use Storable qw(store retrieve freeze thaw dclone);

no warnings 'utf8';

# Absolute path 
use Cwd 'abs_path';
use File::Basename;
my $abs_path = dirname(abs_path($0));
$abs_path =~ s/\/scripts$//;
my $ling1 = shift(@ARGV);
my $ling2 = shift(@ARGV);
utf8::decode($ling2);
#my $feat = shift(@ARGV);
my $model = $abs_path."/models/unigrams_"  . ${ling1} . "\.st";
#print STDERR "PATH: $abs_path";


my $arrayref = retrieve($model); 

#my $bigram =  $arrayref->[0];
my $unigram =  $arrayref->[0];


$infi= 1/1000000;
$n=0;
$summa= 0;
while ($w1 = <STDIN>) {
   chomp $w1;
  # if ($n<=$th){
    $n +=1 ;
   
   # $bi = $w1 . " " . $w2;
    
   # $bi_dec =    ($bigram->{$bi}) if ($bigram->{$bi});
    $uni_dec =  ($unigram->{$w1}) if ($unigram->{$w1}) ;

   #$lambda2=0.7;
   $lambda1=1;#

   #$bi_dec = 0 if (!$bigram->{$bi});
   $uni_dec = 0 if (!$unigram->{$w1});

    $prob =  log2 ( ($uni_dec * $lambda1) + $infi);
    $summa = ($prob + $summa);
}

$perplexity= 2**(-($summa/$n));
#$perplexity = 1 / (-$summa**(1/$n)) ;

print "$ling1 $ling2 $perplexity\n";


sub log2 {
        my $n = shift;
        return log($n)/log(2);
    }
