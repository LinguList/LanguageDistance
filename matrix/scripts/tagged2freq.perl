#!/usr/bin/perl -w

$th = shift(@ARGV);

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

$i=1;
foreach my $l (sort {$Dico{$b} <=> 
                      $Dico{$a} } 
                      keys %Dico ) {

    if  ($i <= $th) {
	$Dico_filt{$l} = $Dico{$l};
    }
    $i++;
}

foreach my $l (sort keys %Dico_filt) {
    $prob= ($Dico_filt{$l} / $N) if ($N);
    print "$l $prob\n";
}

