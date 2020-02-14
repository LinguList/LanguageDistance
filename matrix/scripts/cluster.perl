#!/usr/bin/perl -w


#$arq = shift(@ARGV);
#open(FILE, $arq) || die "Can't open search-patterns: $!\n";

#$train = shift(@ARGV);
#$test = shift(@ARGV);

while (<>) {
   chomp $_;
   ($obj1, $obj2, $sim) = split (" ", $_);
   $Dico{$obj1}{$obj2} = $sim if  ($obj1 ne $obj2);
   $Dico{$obj2}{$obj1} = $sim if  ($obj1 ne $obj2);
}

foreach my $o1 (keys %Dico) {
      foreach my $o2  (sort {$Dico{$o1}{$a} <=> 
                            $Dico{$o1}{$b} } 
                      keys %{$Dico{$o1}} ) {
	  print "$Dico{$o1}{$o2} $o1 $o2\n"; last
      }
}

 sub Min {
    local ($x) = $_[0];
    local ($y) = $_[1];

    if ($x <= $y) {
      $result = $x
    }
    else {
      $result = $y
    }

    return $result
}



sub Max {
    local ($x) = $_[0];
    local ($y) = $_[1];

    if ($x >= $y) {
      $result = $x
    }
    else {
      $result = $y
    }

    return $result
}








