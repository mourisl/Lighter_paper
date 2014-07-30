#!/bin/sh
cd orig
bowtie2 -p 8 -x ~/data/Lighter/ecoli_genome/e_coli_k12 -1 orig_read1.fq -2 orig_read2.fq > orig.sam 2> bowtie2.log
cd ../
#exit 
for prog in quake soapec musket bless lighter
do
#echo "# ${prog}_${cov}_${err}" >> summary.out
#../../verify ${prog}/${prog}_simulate_${cov}_${err}.fq | head -13 | tail -4 >> summary.out
	cd $prog 
	#rm bowtie2.log
	for k in 17 19 23 27 31
	do
		bowtie2 -p 8 -x ~/data/Lighter/ecoli_genome/e_coli_k12 -1 ${prog}_${k}_read1.fq -2 ${prog}_${k}_read2.fq > ${prog}_${k}.sam 2>> bowtie2.log
	done
	cd ..
done
