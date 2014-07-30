#!/bin/sh
#rm summd
#perl ../Tools/SumMD.pl orig/orig.sam >> summd
rm summd_bwa
echo "orig" >> summd_bwa
perl ../Tools/SumMD.pl orig/orig_bwa.sam >> summd_bwa 
for prog in quake soapec musket bless lighter_rev
do
	for k in 19 23 27 31
	do
		echo "$prog $k" >> summd_bwa
		perl ../Tools/SumMD.pl ${prog}/${prog}_${k}_bwa.sam >> summd_bwa 
	done
done
