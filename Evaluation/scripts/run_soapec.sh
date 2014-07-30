#!/bin/sh

prog=soapec

cd simulate
for cov in 35 70 140
do
	for err in 1 3
	do
		for k in 17 19 23 27 31
		do
			echo "ecoli_reads_${cov}_${err}.fq" > read.lst
			../bin/KmerFreq_HA -k $k -l read.lst -p tmp -t 10 -L 101
			../bin/Corrector_HA -t 10 -k $k -o 3 -r 101 -Q 33 -a 1 tmp.freq.gz read.lst
			mv ecoli_reads_${cov}_${err}.fq.cor ~/lighter/results/${prog}/simulate/${prog}_simulate_${cov}_${err}_${k}.fq 
		done
	done
done
cd ../

cd ERR022075
for k in 17 19 23 27 31
do
	echo "read_1.fq" > read.lst
	echo "read_2.fq" >> read.lst
	../bin/KmerFreq_HA -k $k -l read.lst -p tmp -t 10 -L 101
	../bin/Corrector_HA -t 10 -k $k -o 3 -r 100 -Q 33 -a 1 tmp.freq.gz read.lst
	mv read_1.fq.cor.pair_1.fq ~/lighter/results/${prog}/ERR022075/${prog}_${k}_read1.fq
	mv read_2.fq.cor.pair_2.fq ~/lighter/results/${prog}/ERR022075/${prog}_${k}_read2.fq
done
cd ..

cd gage_chr14
for k in 19 23 27 31
do
	echo "frag_1.fq" > read.lst 
	echo "frag_2.fq" >> read.lst
	../bin/KmerFreq_HA -k $k -l read.lst -p tmp -t 10 -L 101
	../bin/Corrector_HA -t 10 -k $k -o 3 -r 101 -Q 33 -a 1 tmp.freq.gz read.lst
	mv frag_1.fq.cor.pair_1.fq ~/lighter/results/${prog}/gage_chr14/${prog}_${k}_read1.fq
	mv frag_2.fq.cor.pair_2.fq ~/lighter/results/${prog}/gage_chr14/${prog}_${k}_read2.fq
done
cd ..

cd CElegans
for k in 19 23 27 31
do
	echo "SRR065390_1.fq" > read.lst
	echo "SRR065390_2.fq" >> read.lst
	../bin/KmerFreq_HA -k $k -l read.lst -p tmp -t 10 -L 101
	../bin/Corrector_HA -t 10 -k $k -o 3 -r 100 -Q 33 -a 1 tmp.freq.gz read.lst
	mv SRR065390_1.fq.cor.pair_1.fq ~/lighter/results/${prog}/CElegans/${prog}_${k}_read1.fq
	mv SRR065390_2.fq.cor.pair_2.fq ~/lighter/results/${prog}/CElegans/${prog}_${k}_read2.fq
done
cd ../

cd simulate_chr14
for k in 19 23 27 31
do
		echo "chr14_reads_35_1.fq" > read.lst
		../bin/KmerFreq_HA -k $k -l read.lst -p tmp -t 10 -L 101
		../bin/Corrector_HA -t 10 -k $k -o 3 -r 101 -Q 33 -a 1 tmp.freq.gz read.lst
		mv chr14_reads_35_1.fq.cor ~/lighter/results/${prog}/simulate_chr14/${prog}_simulate_35_1_${k}.fq 
done
cd ..


cd simulate_fa
for cov in 35 70 140
do
	for err in 1 
	do
		for k in 17 19 23 27 31
		do
			echo "ecoli_reads_${cov}_${err}.fa" > read.lst
			../bin/KmerFreq_HA -k $k -l read.lst -p tmp -t 10 -L 101
			../bin/Corrector_HA -t 10 -k $k -o 2 -r 101 -a 1 tmp.freq.gz read.lst
			mv ecoli_reads_${cov}_${err}.fa.cor ~/lighter/results/${prog}/simulate_fa/${prog}_simulate_${cov}_${err}_${k}.fa 
		done
	done
done
cd ../

cd simulate_art
for cov in 35 70 140
do
	for k in 17 19 23 27 31
	do
		echo "art_ecoli_reads_${cov}.fq" > read.lst
		../bin/KmerFreq_HA -k $k -l read.lst -p tmp -t 10 -L 101
		../bin/Corrector_HA -t 10 -k $k -o 3 -r 101 -Q 33 -a 1 tmp.freq.gz read.lst
		mv art_ecoli_reads_${cov}.fq.cor ~/lighter/results/${prog}/simulate_art/${prog}_simulate_${cov}_${k}.fq 
	done
done
cd ../

cd simulate_CElegans
for k in 19 23 27 31 
do
		echo "CElegans_reads_35_1.fq" > read.lst
		../bin/KmerFreq_HA -k $k -l read.lst -p tmp -t 10 -L 101
		../bin/Corrector_HA -t 10 -k $k -o 3 -r 101 -Q 33 -a 1 tmp.freq.gz read.lst
		mv CElegans_reads_35_1.fq.cor ~/lighter/results/${prog}/simulate_CElegans/${prog}_simulate_35_1_${k}.fq 
done
cd ..

