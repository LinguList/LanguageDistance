#!/usr/bin/perl -w


my $arq = shift(@ARGV);
open(WORDLIST, $arq) || die "Can't open search-patterns: $!\n";

while (my $token = <WORDLIST>) {
    chomp $token;

    #$token = lc ($token);
    $Wordlist{$token}++;
}

$N=0;
$Diff=0;
while (my $tok = <STDIN>) {
    chomp $tok;
    if ($tok eq "") {next}
     if ( $tok =~ /http/){next}    
   #  ($tok) = split(" ", $line);
    
     #$tok = lc ($tok);
    if ($Wordlist{$tok} ) {
	$Dico{$tok}++  ;
    }
    $N++;
    $Diff++ if (!$Found{$tok});
    $Found{$tok}++;      
}

$mean = ($N / $Diff) if ($Diff);

#standard deviation
$som=0;
$sigma=0;
foreach my $l (keys %Dico) {
    $som+= ($Dico{$l} - $mean)**2;
}
$sigma = sqrt ($som/$N);


foreach $l (sort {$Dico{$b} <=>
                  $Dico{$a} }
                  keys %Dico ) {

    #$prob = (abs($Dico{$l}-$mean))/$sigma; ##z_score
    $prob= ($Dico{$l} / $N) if ($N);
     
    #$prob= ($Dico{$l} / $Diff) if ($Diff);
    print "$l $prob\n";
}

