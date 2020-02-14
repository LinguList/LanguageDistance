#!/usr/bin/perl

$file = shift(@ARGV);
open (FILE, $file) or die "O ficheiro nao pode ser aberto: $!\n";
$NumberTokens = shift(@ARGV);

$train =shift(@ARGV);
$test = shift(@ARGV);

$freq=0;
$rank = 1;

while ($line = <FILE>) {
      chomp($line);
    if ($rank <= $NumberTokens){
      my ($freq, $uni) = split (" ", $line) ;
    
      $Uni{$uni} = $rank;
    }
    $rank++;
}


$rank=1;
while ($line = <STDIN>) {
    if ($rank <= $NumberTokens){
      chomp($line);
      
      ($freq, $uni) = split (" ", $line) ;
      

      if ($Uni{$uni}) {
         $valor_uni += abs ($Uni{$uni} - $rank)  ;


          #print STDERR "$tetra - $valor_tetra - $Tetra{$tetra}\n" ;
	  $countUni++;
          #$norm +=  Min ($Tetra{$tetra} , $rank)  ;
	  $norm +=  $rank  ;
      }
      else {

         $valor_uni += abs ($NumberTokens - $rank) ;

         #print STDERR "1. $tetra - #$valor_tetra# - #$rank#  #$NumberTokens# \n" ;
	 
     }
    
      
   }
   
   $rank++ ;
  
}


$dist =  ($valor_uni / $countUni) if ($countUni) ;
$dist2 =  ($valor_uni / $norm)  if ($norm);
#$dist =  ($countTetra / $mean) ;

if (!$dist2) {$dist2=10000.00}
#print STDERR "#$train# $test -- #$dist2#\n";
#printf "Basic: %d -- Ranked: %.3f -- Ranked2: %.3f\n", $countTetra, $dist, $dist2;
printf "%s %s %.3f\n",  $train, $test, $dist2 ;


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
