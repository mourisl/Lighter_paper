#!/bin/sh
#rm summd
#perl ../Tools/SumMD.pl orig/orig.sam >> summd
for prog in soapec #lighter_rev #quake musket bless lighter
do
	for k in 19 23 27 31
	do
		echo "$prog $k" >> summd
		perl ../Tools/SumMD.pl ${prog}/${prog}_${k}.sam >> summd 
	done
done
