#!/usr/bin/perl

#$file = shift(@ARGV);
#open (FILE, $file) or die "O ficheiro nom pode ser aberto: $!\n";

while ($line = <STDIN>) {
      chomp($line);
      ($rank, $peso, $obj) = split(" ", $line);
      $Count{$obj}++;
      #$Rank{$obj} += $rank;
      $Rank{$obj} += $peso;
}

foreach $o (sort keys %Rank) {
    $mean = $Rank{$o} / $Count{$o};
    printf "%.3f %s\n", $mean, $o;

}


