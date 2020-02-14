#!/usr/bin/perl -w


#$arq = shift(@ARGV);
#open(FILE, $arq) || die "Can't open search-patterns: $!\n";

#$train = shift(@ARGV);
#$test = shift(@ARGV);
$i=0;
while (<>) {
   chomp $_;
   ($sim, $obj1, $obj2) = split (" ", $_);
   if (!$Found{$obj1} && !$Found{$obj2}) {
     $i++;
     $cluster[$i] .= "$obj1:$sim" . "|" . "$obj2:$sim" . "|";        
   }
   elsif (!$Found{$obj1} && $Found{$obj2}) {
       for ($j=1;$j<=$i;$j++) {
	   if ($cluster[$j] =~ /$obj2/) {
	       $cluster[$j] .= "$obj1:$sim" . "|"  ;
	       #print STDERR "i = #$i# j = #$j# $obj2 - $cluster[$j]\n";
	   }
       }
       			
   }
   elsif ($Found{$obj1} && !$Found{$obj2}) {
       for ($j=1;$j<=$i;$j++) {
	   if ($cluster[$j] =~ /$obj1/) {
              $cluster[$j] .= "$obj2:$sim" . "|"  
	   }
       }
   }
       
      $Found{$obj1}++;
      $Found{$obj2}++;
		
}

for ($i=1;$i<=$#cluster;$i++) {
       
	  print "$cluster[$i]\n"; 
      
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








