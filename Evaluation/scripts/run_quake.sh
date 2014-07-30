#!/bin/sh

prog=quake

cd CElegans
for k in 19 23 27 31
do
	rm *db* *qcts* *.cor.fq *.err.fq
	quake.py -p 10 --hash_size=1000000 -k $k -f reads_files
	mv SRR065390_1.cor.fastq  ~/lighter/results/${prog}/CElegans/${prog}_${k}_read1.fq 
	mv SRR065390_2.cor.fastq  ~/lighter/results/${prog}/CElegans/${prog}_${k}_read2.fq
done
cd ../
exit


cd simulate_chr14
for k in 19 23 27 31
do
	rm *db* *qcts* *.cor.fq *.err.fq
	quake.py -u -p 10 --hash_size=1000000 -k $k -r chr14_reads_35_1.fq
	cat chr14_reads_35_1.cor.fq chr14_reads_35_1.err.fq > ~/lighter/results/${prog}/simulate_chr14/${prog}_simulate_35_1_${k}.fq 
done
cd ../


cd simulate
for cov in 35 70 140
do
	for err in 1 3
	do
		for k in 17 19 23 27 31
		do
			rm *db* *qcts* *.cor.fq *.err.fq
			quake.py -u -p 10 --hash_size=1000000 -k $k -r ecoli_reads_${cov}_${err}.fq
			cat ecoli_reads_${cov}_${err}.cor.fq ecoli_reads_${cov}_${err}.err.fq > ~/lighter/results/${prog}/simulate/${prog}_simulate_${cov}_${err}_${k}.fq
		done
	done
done
cd ../

cd ERR022075
for k in 17 19 23 27 31
do
	rm *db* *qcts* *.cor.fq *.err.fq
	quake.py -p 10 --hash_size=1000000 -k $k -f reads_files
	mv read_1.cor.fq ~/lighter/results/${prog}/ERR022075/${prog}_${k}_read1.fq
	mv read_2.cor.fq ~/lighter/results/${prog}/ERR022075/${prog}_${k}_read2.fq
done
cd ..



cd simulate_art
for cov in 35 70 140
do
	for k in 17 19 23 27 31
	do
		rm *db* *qcts* *.cor.fq *.err.fq
		quake.py -u -p 10 --hash_size=1000000 -k $k -r art_ecoli_reads_${cov}.fq
		cat art_ecoli_reads_${cov}.cor.fq art_ecoli_reads_${cov}.err.fq > ~/lighter/results/${prog}/simulate_art/${prog}_simulate_${cov}_${k}.fq
	done
done
cd ..


cd gage_chr14
for k in 19 23 27 31
do
	rm *db* *qcts* *.cor.fq *.err.fq
	quake.py -p 10 --hash_size=1000000 -k $k -f reads_files
	mv frag_1.cor.fastq ~/lighter/results/${prog}/gage_chr14/${prog}_${k}_read1.fq
	mv frag_2.cor.fastq ~/lighter/results/${prog}/gage_chr14/${prog}_${k}_read2.fq
	rm *db* *qcts*
done
cd ..

cd simulate_CElegans
for k in 19 23 27 31 
do
	rm *db* *qcts* *.cor.fq *.err.fq
	quake.py -u -p 10 --hash_size=1000000 -k $k -r CElegans_reads_35_1.fq
	cat CElegans_reads_35_1.cor.fq CElegans_reads_35_1.err.fq > ~/lighter/results/${prog}/simulate_CElegans/${prog}_simulate_35_1_${k}.fq 
done
cd ../

