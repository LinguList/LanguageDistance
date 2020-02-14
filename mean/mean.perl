#!/usr/bin/perl

$file = shift(@ARGV);
open (FILE, $file) or die "O ficheiro nom pode ser aberto: $!\n";

while ($line = <FILE>) {
      chomp($line);
      ($peso, $obj) = split(" ", $line);
      $Dico{$obj} = $peso;
}

while ($line = <STDIN>) {
      chomp($line);
      ($peso, $obj) = split(" ", $line);
      if ($Dico{$obj}) {
          $av = ($peso + $Dico{$obj})/2;
	  
          printf "%0.4f %s\n", $av, $obj;
       }
}



