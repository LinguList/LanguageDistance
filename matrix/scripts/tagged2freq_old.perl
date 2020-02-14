#!/usr/bin/perl -w


$pal="";
while (my $line = <STDIN>) {
    chomp $line;
    if ($line eq "") {next}
     if ( $line =~ /http/){next}    
     ($pal, $lema, $tag) = split(" ", $line);
    

     $lema = lc ($lema);
     if ($tag =~ /^V/ || $tag =~ /^AQ/ || $tag =~ /^NN/ || $tag =~ /^R/){
         $Dico{$lema}++ ;
         $N++;
      }
      
}
  

foreach my $l (sort keys %Dico) {
    $prob= ($Dico{$l} / $N) if ($N);
    print "$l $prob\n";
}

