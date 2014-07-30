#!/bin/perl
use strict ;

#>NODE_1_length_386_cov_4.487047
my @contig;
my @sortedContig ;
my @cols ;
my $totalLength = 0 ;
my $i ;
my $cnt = 0 ;

while ( <stdin> )
{
	next if ( !/^>/ ) ;
	@cols = split /_/, $_ ;
	next if ( $cols[3] < 100 ) ;
	#print $cols[3], " " ;
	$totalLength += $cols[3] ;
	push @contig, $cols[3] ;
}
if ( defined $ARGV[0])
{
	$totalLength = $ARGV[0] ;
}
@sortedContig = sort {$b<=>$a} @contig ;
#print $totalLength, "\n" ;
for ( $i = 0 ; $i < scalar( @sortedContig ) ; ++$i )
{
	#print $sortedContig[$i], " " ;
	$cnt += $sortedContig[$i] ;
	last if ( $cnt >= $totalLength / 2 ) ;
}
print "N50: $sortedContig[$i]\n" ;
