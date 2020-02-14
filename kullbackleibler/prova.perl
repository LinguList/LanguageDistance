#!/usr/bin/perl -w

use List::Util 'shuffle';
use Math::KullbackLeibler::Discrete;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open qw(:std :utf8);

$file = shift(@ARGV);
open (FILE, $file) or die "O ficheiro nom pode ser aberto: $!\n";

#my $P = { a => 1/2, b => 1/4, c => 1/4 };
#    my $Q = { a => 7/12, b => 2/12, d => 3/12 };

while (my $line = <STDIN>) {
  chomp $line;
  my ($freq,$word) = split (' ', $line);
  $P{$word} = $freq if ($freq);
  print STDERR "$word - $freq\n";
  $totalP += $freq;
}

while (my $line = <FILE>) {
  chomp $line;
  my ($freq,$word) = split (' ', $line);
  $Q{$word} = $freq if ($freq);
  print STDERR "$word - $freq\n";
  $totalQ += $freq;
}

#=pod
foreach my $w (sort keys %P) {
    $P{$w} = $P{$w} / $totalP;
}
foreach my $w (sort keys %Q) {
    $Q{$w} = $Q{$w} / $totalQ;
}
#=cut
$P = \%P;
$Q = \%Q;


    my $kl = kl( $P, $Q );

    # optionally set the smoothing epsilon
    my $kl2 = kl( $P, $Q, epsilon => 0.0001 );
print $kl2;
