#!/bin/sh

prog=musket
cd simulate_art
for cov in 35 70 140
do
	for k in 17 19 23 27 31
	do
		../musket -p 10 -inorder -k $k 500000000 -o musket_simulate_${cov}.fq ~/data/Lighter/simulate_art/art_ecoli_reads_${cov}.fq
		mv musket_simulate_${cov}.fq ~/lighter/results/${prog}/simulate_art/${prog}_simulate_${cov}_${k}.fq
	done
done
cd ../

cd simulate
for cov in 35 70 140
do
	for err in 1 3
	do
		for k in 17 19 23 27 31
		do
			../musket -p 10 -inorder -k $k 500000000 -o musket_simulate_${cov}_${err}.fq ~/data/Lighter/simulate/ecoli_reads_${cov}_${err}.fq
			mv musket_simulate_${cov}_${err}.fq ~/lighter/results/${prog}/simulate/${prog}_simulate_${cov}_${err}_${k}.fq
		done
	done
done
cd ../

cd ERR022075
for k in 17 19 23 27 31
do
	../musket -p 10 -inorder -k $k 500000000 -omulti musket ~/data/Lighter/ERR022075_75x_trim/read_1.fq ~/data/Lighter/ERR022075_75x_trim/read_2.fq
	mv musket.0 ~/lighter/results/${prog}/ERR022075/${prog}_${k}_read1.fq
	mv musket.1 ~/lighter/results/${prog}/ERR022075/${prog}_${k}_read2.fq
done
cd ..

cd simulate_fa
for cov in 35 70 140
do
	for err in 1 
	do
		for k in 17 19 23 27 31
		do
			../musket -p 10 -inorder -k $k 500000000 -o musket_simulate_${cov}_${err}.fa ~/data/Lighter/simulate/ecoli_reads_${cov}_${err}.fa
			mv musket_simulate_${cov}_${err}.fa ~/lighter/results/${prog}/simulate_fa/${prog}_simulate_${cov}_${err}_${k}.fa
		done
	done
done
cd ../

cd simulate_art
for cov in 35 70 140
do
	for k in 17 19 23 27 31
	do
		../musket -p 10 -inorder -k $k 500000000 -o musket_simulate_${cov}.fq ~/data/Lighter/simulate_art/art_ecoli_reads_${cov}.fq
		mv musket_simulate_${cov}.fq ~/lighter/results/${prog}/simulate_art/${prog}_simulate_${cov}_${k}.fq
	done
done
cd ../

cd simulate_chr14
for k in 19 23 27 31
do
	../musket -p 10 -inorder -k $k 11000000000 -o musket_simulate_35_1.fq ~/data/Lighter/simulate/chr14_reads_35_1.fq
	mv musket_simulate_35_1.fq ~/lighter/results/${prog}/simulate_chr14/${prog}_simulate_35_1_${k}.fq
done
cd ..

cd CElegans
for k in 19 23 27 31
do
	../musket -p 10 -inorder -k $k 11000000000 -omulti musket ~/data/Lighter/CElegans/SRR065390_1.fastq ~/data/Lighter/CElegans/SRR065390_2.fastq
	mv musket.0 ~/lighter/results/${prog}/CElegans/${prog}_${k}_read1.fq
	mv musket.1 ~/lighter/results/${prog}/CElegans/${prog}_${k}_read2.fq
done
cd ../

cd gage_chr14
for k in 19 23 27 31
do
	../musket -p 10 -inorder -k $k 11000000000 -omulti musket ~/data/Lighter/gage_chr14/frag_1.fastq ~/data/Lighter/gage_chr14/frag_2.fastq
	mv musket.0 ~/lighter/results/${prog}/gage_chr14/${prog}_${k}_read1.fq
	mv musket.1 ~/lighter/results/${prog}/gage_chr14/${prog}_${k}_read2.fq
done
cd ..

cd simulate_chr14
for k in 19 23 27 31
do
	../musket -p 10 -inorder -k $k 11000000000 -o musket_simulate_35_1.fq ~/data/Lighter/simulate/CElegans_reads_35_1.fq
	mv musket_simulate_35_1.fq ~/lighter/results/${prog}/simulate_CElegans/${prog}_simulate_35_1_${k}.fq
done
cd ..

