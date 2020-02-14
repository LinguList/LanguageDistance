#!/usr/bin/perl -w


$arq = shift(@ARGV);
open(FILE, $arq) || die "Can't open search-patterns: $!\n";

$train = shift(@ARGV);
$test = shift(@ARGV);

while ($line = <FILE>) {
    chomp $line;
    ($lema, $prob) = split (" ", $line);

    $dic1{$lema} = $prob;
    $o1 += $prob **2 ;
    $q +=  $prob;
    
    #$nrels++;
}

$min=0;
while (<>) {
   chomp $_;
   ($lema, $prob) = split (" ", $_);

   $o2 += $prob **2 ;
   if ($dic1{$lema}) {
       $intersection += $prob *  $dic1{$lema} ;
       $euclidean += ($prob -  $dic1{$lema}) **2 ;
       $camberra += abs ($prob -  $dic1{$lema})  ;
       $min += Min ($prob, $dic1{$lema}) ;
      # print STDERR "$lema - $min\n";
   }
   else {
       $euclidean +=  $prob **2 ;
   }
   $dic2{$lema} = $prob;
   $p += $prob;
}

foreach $l (sort keys %dic1) {
    if (!$dic2{$l}) {
      $euclidean +=  $dic1{$l} **2 ;
    }
}

  ##cosine
  if ( ($o1 > 0) && ($o2 > 0) )  {
    $cosine = $intersection / (sqrt ($o1 * $o2) ) ;
    $cosine = 1 - $cosine;

  ##euclidean:
   $euclidean = sqrt ($euclidean);

  #dice:
   $diceMin = (2*$min) / ($q + $p) ;
    $diceMin = 1 - $diceMin;
    
   #camberra
   $camberra  = $camberra / ($p + $q);
    

  $mean = ($cosine + $camberra + $diceMin + $euclidean) / 4;
 
  #if  ($cosine)  {
   printf "%s %s %.4f %.4f %.4f %.4f %.4f\n", $train, $test, $mean, $camberra, $cosine,  $diceMin, $euclidean;
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








