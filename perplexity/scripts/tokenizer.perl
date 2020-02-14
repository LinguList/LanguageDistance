#!/usr/bin/perl

#Tokenizer:
#lê é um ficheiro texto linha a linha
#separa as pontuaçoes
#quebra as linhas em tokens
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open qw(:std :utf8);

#open (ENTRADA, "<texto.txt");
#open (SAIDA, ">tokens.txt") ;

#foreach $line (<>) {
while ($line=<STDIN>) {
      chop($line);
      $line = SeparateAllComma($line);
      $line = SeparateAllPointComma($line);
      $line = SeparateTwoPoint($line);
      $line = SeparateFinalPoint($line);
      $line = SeparateAllBracket($line);
      $line = SeparateAspas($line);
      $line = SeparateSeveral($line);

      $line = UpperToLower($line);

      @pals = split(" ", $line);
      foreach $p (@pals) {
         print "$p\n";
      }
}


#print STDERR "O arquivo de tokens foi gerado\n\n";



sub SeparateSeveral {
    local ($x) = @_;

       $x =~ s/\</ \< /g;
       $x =~ s/\>/ \> /g;
       $x =~ s/\=/ \= /g;
       $x =~ s/\'/ \' /g;
       $x =~ s/\`/ \` /g;
       $x =~ s/\?/ \? /g;
       $x =~ s/\¿/ \¿ /g;
       $x =~ s/\!/ \! /g;
       $x =~ s/\¡/ \¡ /g;
       return $x;
}

sub SeparateAllComma {
    local ($x) = @_;

       $x =~ s/\,/ \,/g;
       return $x;
}


sub SeparateAllPointComma {
    local ($x) = @_;

       $x =~ s/\;/ \;/g;
       return $x;
}

sub SeparateTwoPoint {
    local ($x) = @_;

       $x =~ s/\:/ \:/g;
       return $x;
}

sub SeparateAllBracket {
    local ($x) = @_;

       $x =~ s/\(/ \( /g;
       $x =~ s/\)/ \) /g;
       return $x;
}


sub SeparateFinalPoint {
    local ($x) = @_;

       $x =~ s/\. [\w]*/ \. /g;
       $x =~ s/\.$/ \./g;
       return $x;
}

sub SeparateAspas {
    local ($x) = @_;

       $x =~ s/\"[ ]*/\" /g;
       $x =~ s/[ ]*\"/ \"/g;
       return $x;
}


sub UpperToLower {
    local ($l) = @_;
     $l =~tr/A-Z/a-z/;
     $l =~tr/\301\311\315\323\332\307\303\325\302\312\324\300\310/\341\351\355\363\372\347\343\365\342\352\364\340\350/;
     return $l;
}

