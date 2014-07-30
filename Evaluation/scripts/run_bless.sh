#!/bin/sh

prog=bless



cd simulate_fa
for cov in 35 70 140
do
	for err in 1
	do
		for k in 17 19 23 27 31
		do
			../bless -prefix bless_simulate_${cov}_${err} -read ~/data/Lighter/simulate/ecoli_reads_${cov}_${err}.fa -kmerlength $k -notrim 
			mv bless_simulate_${cov}_${err}.corrected.fastq ~/lighter/results/${prog}/simulate_fa/${prog}_simulate_${cov}_${err}_${k}.fa
		done
	done
done
cd ..

cd simulate_art
for cov in 35 70 140
do
	for k in 17 #19 23 27 31
	do
		../bless -prefix bless_simulate_${cov} -read ~/data/Lighter/simulate_art/art_ecoli_reads_${cov}.fq -kmerlength $k -notrim 
		mv bless_simulate_${cov}.corrected.fastq ~/lighter/results/${prog}/simulate_art/${prog}_simulate_${cov}_${k}.fq
	done
done
cd ..
exit

cd simulate_chr14
for k in 19 23 27 31
do
	../bless -prefix bless_simulate_35_1 -read ~/data/Lighter/simulate/chr14_reads_35_1.fq -kmerlength $k -notrim 
	mv bless_simulate_35_1.corrected.fastq ~/lighter/results/${prog}/simulate_chr14/${prog}_simulate_35_1_${k}.fq
done
cd ..

cd simulate
for cov in 35 70 140
do
	for err in 1 3
	do
		for k in 17 19 23 27 31
		do
			../bless -prefix bless_simulate_${cov}_${err} -read ~/data/Lighter/simulate/ecoli_reads_${cov}_${err}.fq -kmerlength $k -notrim 
			mv bless_simulate_${cov}_${err}.corrected.fastq ~/lighter/results/${prog}/simulate/${prog}_simulate_${cov}_${err}_${k}.fq
		done
	done
done
cd ..

cd ERR022075
for k in 17 19 23 27 31
do
	../bless -prefix bless_read -read1 ~/data/Lighter/ERR022075_75x_trim/read_1.fq -read2 ~/data/Lighter/ERR022075_75x_trim/read_2.fq -kmerlength $k -notrim 
	mv bless_read.1.corrected.fastq ~/lighter/results/${prog}/ERR022075/${prog}_${k}_read1.fq
	mv bless_read.2.corrected.fastq ~/lighter/results/${prog}/ERR022075/${prog}_${k}_read2.fq
done
cd ..



cd CElegans
for k in 19 23 27 31
do
	../bless -prefix bless_read -read1 ~/data/Lighter/CElegans/SRR065390_1.fastq -read2 ~/data/Lighter/CElegans/SRR065390_2.fastq -kmerlength $k -notrim 
	mv bless_read.1.corrected.fastq ~/lighter/results/${prog}/CElegans/${prog}_${k}_read1.fq
	mv bless_read.2.corrected.fastq ~/lighter/results/${prog}/CElegans/${prog}_${k}_read2.fq
done
cd ..

cd gage_chr14
for k in 19 23 27 31
do
	../bless -prefix bless_read -read1  ~/data/Lighter/gage_chr14/frag_1.fastq -read2 ~/data/Lighter/gage_chr14/frag_2.fastq -kmerlength $k -notrim
	mv bless_read.1.corrected.fastq ~/lighter/results/${prog}/gage_chr14/${prog}_${k}_read1.fq
	mv bless_read.2.corrected.fastq ~/lighter/results/${prog}/gage_chr14/${prog}_${k}_read2.fq
done
cd ..

cd simulate_CElegans
for k in 19 23 27 31
do
	../bless -prefix bless_simulate_35_1 -read ~/data/Lighter/simulate/CElegans_reads_35_1.fq -kmerlength $k -notrim 
	mv bless_simulate_35_1.corrected.fastq ~/lighter/results/${prog}/simulate_CElegans/${prog}_simulate_35_1_${k}.fq
done
cd ..

