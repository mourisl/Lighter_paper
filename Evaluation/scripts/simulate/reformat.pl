#!/bin/perl

my $line ;
my %val ;
my @cols ;
my $key ;
my $i ;
while (<>)
{
	chomp ;
	$line = $_ ;
	@cols = split /\s/, $line ;
	$key = $cols[1] ;

	foreach $i ("recall", "prec", "F-score", "gain")
	{
		$line = <> ;
		chomp $line ;
		@cols = split /\s/, $line ;
		$val{$key."_".$i} = $cols[1] ;
	}
}

my %whichK ;
my %whichKGain ;
foreach $k (17, 19, 23, 27, 31)
{
	foreach $prog ("quake", "musket", "bless", "lighter" )
	{
		foreach $cov (35, 70, 140)
		{
			foreach $err (1, 3)
			{
				$key = $prog."_".$cov."_".$err."_".$k."_gain" ;
				$key2 = $prog."_".$cov."_".$err ;
				if ( !(defined $whichKGain{$key2}) || $val{$key} > $whichKGain{$key2} )
				{
					$whichKGain{$key2} = $val{$key} ;
					$whichK{$key2} = $k ;
				}
			}
		}
	}
}

foreach $i ("recall", "prec", "F-score", "gain")
{
	my $prog ;
	my $cov ;
	my $err ;

	foreach $prog ("quake", "musket", "bless", "lighter" )
	{
		foreach $cov (35, 70, 140)
		{
			foreach $err (1, 3)
			{
				$key2 = $prog."_".$cov."_".$err ;
				$k = $whichK{$key2} ;
				$key = $prog."_".$cov."_".$err."_".$k."_".$i ;

				print $val{$key}* 100.0, "\t" ;
			}
		}
		print "\n" ;
	}
}

# Print out which k value is chosen.
foreach $prog ("quake", "musket", "bless", "lighter" )
{
	foreach $cov (35, 70, 140)
	{
		foreach $err (1, 3)
		{
			$key2 = $prog."_".$cov."_".$err ;
			print $whichK{$key2}, "\t" ;
		}
	}
	print "\n" ;
}
