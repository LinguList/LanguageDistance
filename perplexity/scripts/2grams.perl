#!/usr/bin/env perl

# O GERADOR DE 6-GRAMAS
#lê um texto taggeado com TreeTagger
#escreve quatro lemas taggeados por linha (4gramas)

#$ling = shift(@ARGV);

#open (INPUT, "tokens.txt") or die "O ficheiro não pode ser aberto: $!\n";
#open (OUTPUT, ">bigramas.txt");

binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open qw(:std :utf8);

$prev1 = "#";
$N=2;
$i=1;
while ($token = <STDIN>) {
      chomp($token);
      $i++;
      
    #if ( $prev2 ne "\#" && $prev3 ne "\#" &&  $prev4 ne "\#" &&  $prev5 ne "\#" &&  $prev6 ne "\#") {

      print "$prev1 $token\n" if ($i>=$N);
     
    #}

      $prev1 = $token;  
}


#print STDERR "foi gerado o ficheiro de 4gramas\n";
