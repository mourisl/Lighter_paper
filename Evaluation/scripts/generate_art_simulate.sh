art_illumina -sam -i ../gage_chr14/chr14.fa -l 101 -f 35 -ir 0 -dr 0 -rs 17 -o art_chr14_35
exit

for c in 35 70 140
do
	art_illumina -sam -i ../e_coli_k12.fa -l 101 -f $c -ir 0 -dr 0 -rs 17 -o art_ecoli_reads_$c
done
