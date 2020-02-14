#!/usr/bin/perl -w

$th = shift(@ARGV);

while (my $tok = <STDIN>) {
    chomp $tok;
    if ($tok eq "") {next}
     if ( $tok =~ /http/){next}    
   #  ($tok) = split(" ", $line);
    
     $tok = lc ($tok);
    
     $Dico{$tok}++ ;
     $N++;
      
      
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

