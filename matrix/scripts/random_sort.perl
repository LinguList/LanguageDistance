#!/usr/bin/perl -w

use List::Util 'shuffle';
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open qw(:std :utf8);


$Total=shift(@ARGV);

$N=0;
while (my $line = <STDIN>) {
  chomp $line;
  #my ($val, $name) = split ('\t', $line);
  $Dico{$line}++
}

foreach $sent (shuffle keys %Dico) {
    (@sent) = split (" ", $sent);
    $N += $#sent+1;

    
    printf "%s\n", $sent if $N <= $Total;
}
