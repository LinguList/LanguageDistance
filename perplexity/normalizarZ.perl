#!/usr/bin/perl

#GERA UM FICHEIRO COM PESOS OU FREQS  NORMALIZADOS
#lê UM ficheiros:
#1. um ficheiro de freqs: "cntx pal freq" (pipe)


##uso da formula z = (x - min_x) / (max_x - min_x)

 
my $tmp="";
my @list;
while ($line = <STDIN>) {
      chop($line);
      ($tmp, $obj, $peso) = split(" ", $line);

      $Dico{$obj} = $peso;
  
      push (@list, $peso);
     
}

my ($Min, $Max);

for (@list) {
    $Min = $_ if !$Min || $_ < $Min;
    $Max = $_ if !$Max || $_ > $Max;
};
if ($Max == $Min) {
    $Max += 0.01;
}
foreach $o (keys %Dico) {
        $peso = $Dico{$o} ;
	
       $z = ($peso - $Min) / ($Max - $Min) ;
       if ($z >= 0) {
         printf "%.4f %s\n",  $z, $o;
       }
  
}
