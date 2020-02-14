#!/usr/bin/env perl

binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open qw(:std :utf8);
use Storable qw(store retrieve freeze thaw dclone);

# Absolute path 
use Cwd 'abs_path';
use File::Basename;
my $abs_path = dirname(abs_path($0));
$abs_path =~ s/\/scripts$//;
my $ling = shift(@ARGV);
#my $feat = shift(@ARGV);
my $output = $abs_path."/models/bigrams_"  . $ling . "\.st";
#print STDERR "PATH: $abs_path";


$n=1;
while ($line = <STDIN>) {
    chomp $line;
    ($w1, $w2) = split(" ", $line);
    $bi = $w1 . " " . $w2;
    $bi{$bi}++;
    $uni{$w1}++;

    $n++;
}

foreach $bigram (sort keys %bi) {
    if ($bi{$bigram} > 0) {
	#print >> sys.stderr, freq
       # if 
        ($w1, $w2) = split (" ", $bigram);
        $bigram = $w1 . " " . $w2;
        $unigram = $w1; 
        $prob_bigram{$bigram} = ($bi{$bigram} / $uni{$w1}) if ($uni{$w1}); ##prob (wi|wi-1) prob (b|a)
        $prob_unigram{$unigram} = ($uni{$w2} / $n ) if ($n && $uni{$w2} ); ##prob (c)
	#print '%s %s_%s_%s_%s\t%.6f\t%.6f\t%.6f\t%.6f\t%.6f' % (w5, w1, w2, w3, w4, prob_pentagram, prob_tetragram, prob_trigram, prob_bigram, prob_unigram)
    }
}

store [\%prob_bigram, \%prob_unigram],  $output;
