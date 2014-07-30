for c in 35 70 140
do
	art_illumina -sam -i ../e_coli_k12.fa -l 101 -f $c -ir 0 -dr 0 -rs 17 -o art_ecoli_reads_$c
done
