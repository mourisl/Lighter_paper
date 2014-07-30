#!/bin/sh
cd orig
bwa mem -t 8 ~/data/Lighter/gage_chr14/chr14.fa orig_read1.fq orig_read2.fq > orig_bwa.sam 2> bwa.log
cd ../
exit 
for prog in quake soapec musket bless lighter
do
#echo "# ${prog}_${cov}_${err}" >> summary.out
#../../verify ${prog}/${prog}_simulate_${cov}_${err}.fq | head -13 | tail -4 >> summary.out
	cd $prog 
	rm bwa.log
	for k in 17 19 23 27 31
	do
		bwa mem -t 8 ~/data/Lighter/gage_chr14/chr14.fa ${prog}_${k}_read1.fq ${prog}_${k}_read2.fq > ${prog}_${k}_bwa.sam 2>> bwa.log
	done
	cd ..
done
