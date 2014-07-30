#!/bin/sh

prog=lighter

for cov in 35 70 140
do
	if [ $cov -eq 35 ]
	then
		alpha=0.2
	elif [ $cov -eq 70 ]
	then
		alpha=0.1
	else
		alpha=0.05
	fi

	for err in 1 3
	do
		for k in 17 19 23 27 31
		do
			./lighter -t 10 -r ~/data/Lighter/simulate/ecoli_reads_${cov}_${err}.fq -k ${k} 5000000 ${alpha} -od simulate
			mv simulate/ecoli_reads_${cov}_${err}.cor.fq ~/lighter/results/${prog}/simulate/${prog}_simulate_${cov}_${err}_${k}.fq
		done
	done
done

for k in 17 19 23 27 31
do
	./lighter -t 10 -r ~/data/Lighter/ERR022075_75x_trim/read_1.fq -r ~/data/Lighter/ERR022075_75x_trim/read_2.fq -k ${k} 5000000 0.1 -od ERR022075
	cd ERR022075
	mv read_1.cor.fq ~/lighter/results/${prog}/ERR022075/${prog}_${k}_read1.fq
	mv read_2.cor.fq ~/lighter/results/${prog}/ERR022075/${prog}_${k}_read2.fq
	cd ..
done

for k in 19 23 27 31
do
	./lighter -t 10 -r ~/data/Lighter/gage_chr14/frag_1.fastq -r ~/data/Lighter/gage_chr14/frag_2.fastq -k ${k} 110000000 0.2 -od gage_chr14
	cd gage_chr14
	mv frag_1.cor.fq ~/lighter/results/${prog}/gage_chr14/${prog}_${k}_read1.fq
	mv frag_2.cor.fq ~/lighter/results/${prog}/gage_chr14/${prog}_${k}_read2.fq
	cd ..
done

cd CElegans
for k in 19 23 27 31
do
	../lighter -t 10 -r ~/data/Lighter/CElegans/SRR065390_1.fastq -r ~/data/Lighter/CElegans/SRR065390_2.fastq -k $k 110000000 0.11 
	mv SRR065390_1.cor.fq ~/lighter/results/${prog}/CElegans/${prog}_${k}_read1.fq
	mv SRR065390_2.cor.fq ~/lighter/results/${prog}/CElegans/${prog}_${k}_read2.fq
done
cd ..

for cov in 35 70 140
do
	if [ $cov -eq 35 ]
	then
		alpha=0.2
	elif [ $cov -eq 70 ]
	then
		alpha=0.1
	else
		alpha=0.05
	fi

	for err in 1
	do
		for k in 17 19 23 27 31
		do
			./lighter -t 10 -r ~/data/Lighter/simulate/ecoli_reads_${cov}_${err}.fa -k ${k} 5000000 ${alpha} -od simulate_fa
			mv simulate_fa/ecoli_reads_${cov}_${err}.cor.fa ~/lighter/results/${prog}/simulate_fa/${prog}_simulate_${cov}_${err}_${k}.fa
			./lighter -t 10 -r ~/data/Lighter/simulate_art/art_ecoli_reads_${cov}.fq -k ${k} 5000000 ${alpha} -od simulate_art
			mv simulate_art/art_ecoli_reads_${cov}.cor.fq ~/lighter/results/${prog}/simulate_art/${prog}_simulate_${cov}_${k}.fq
		done
	done
done

for k in 19 23 27 31
do
	./lighter -t 10 -r ~/data/Lighter/simulate/chr14_reads_35_1.fq -k ${k} 110000000 0.2 -od simulate
	mv simulate/chr14_reads_35_1.cor.fq ~/lighter/results/${prog}/simulate_chr14/${prog}_simulate_35_1_${k}.fq
done

for k in 19 23 27 31
do
	./lighter -t 10 -r ~/data/Lighter/simulate/CElegans_reads_35_1.fq -k ${k} 110000000 0.2 -od simulate
	mv simulate/CElegans_reads_35_1.cor.fq ~/lighter/results/${prog}/simulate_CElegans/${prog}_simulate_35_1_${k}.fq
done
