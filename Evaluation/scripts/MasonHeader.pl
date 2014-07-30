#!/bin/perl

# Put the mason-style header
# usage: a.pl xxx.fq yyy.aln 

open FP1, $ARGV[0] ;
open FP2, $ARGV[1] ;
#@simulate/ecoli_reads_35_1.fq.000000000 contig=gi|49175990|ref|NC_000913.2| haplotype=0 length=101 orig_begin=1305707 orig_end=1305808 snps=0 indels=0 haplotype_infix=AGATCTTCCGGAAAGCCGGGGCCAGAAGCAATTGTGTGAATGGTGTGACCGCTGGCCTGTTCAAACGGCATAATATTGACATCTGGTGGTGGCGGCAGAAT edit_string=MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMEMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM strand=forward

#skip the header of the aln file
while ( <FP2> )
{
	last if ( /Header End/ ) ;
}
my $line ;
my $ref ;
my $seq ;
my $i ;
while ( <FP1> )
{
	chomp ;
	$id = $_ ;	

	$line = <FP2> ;
	$ref = <FP2> ;
	$seq = <FP2> ;
	
	chomp $ref ;
	chomp $seq ;
	my $edit = "" ;
	for ( $i = 0 ; $i < length( $ref ) ; ++$i )
	{
		if ( substr( $ref, $i, 1 ) eq substr( $seq, $i, 1 ) )
		{
			substr( $edit, $i, 1, "M" ) ;
		}
		else
		{
			substr( $edit, $i, 1, "E" ) ;
		}
	}

	$id = $id." haplotype_infix=".$ref." edit_string=".$edit." strand=forward" ;
	print $id, "\n" ;
	$line = <FP1> ;
	print $line ;
	$line = <FP1> ;
	print $line ;
	$line = <FP1> ;
	print $line ;

}
