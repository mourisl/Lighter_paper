First:

1. Change to the `Evaluation` subdirectory of the repo
2. Obtain [Quake]; we used version 0.3
3. Obtain [Musket]; we used version 1.1. 
4. Obtain [BLESS]; we used v0p17
5. Obtain [SOAPec]: we used version 2.01

(For Musket, we changed the 156th line of kseq.cpp to "if (ks_getuntil(ks, '\n', &seq->name, &c) < 0)", so it can output Mason's id field )

[Quake]: http://www.cbcb.umd.edu/software/quake/
[Musket]: http://musket.sourceforge.net/homepage.htm#latest
[BLESS]: http://sourceforge.net/projects/bless-ec/
[SOAPec]: http://soap.genomics.org.cn/about.html

To generate simulated E. coli data set:

1. Download FASTA from refseq: http://www.ncbi.nlm.nih.gov/nuccore/NC_010473.1
2. Move `sequnce.fa` to current directory and rename 
3. Run `sh scripts/generate_simulate.sh`.  This will take a while and use several gigabytes of memory.

To generate simualted diploid test data:

1. Run `generate_diploid.sh`

To generate simulated data set using art:
1. Run `generate_art_simulate.sh`
2. Run `perl MasonHeader.pl xxx.fq xxx.aln` to add Mason-style id field for each data set.

To generating the 2x100bp 75x ERR022075 data set:

1. Download `ERR022075_1.fastq.gz` from the [European Nucleotide Archive](http://www.ebi.ac.uk/ena/data/view/ERR022075)
2. Unzip it: `gunzip ERR022075_1.fastq.gz`
3. Make untrimmed read set: `perl Sample.pl 0.077 < ERR022075_1.fastq > read1.fq`
4. Make trimmed read set`perl Sample.pl 0.077 < ERR022075_1.fastq > read2_tmp.fq ; perl Trim.pl read2_tmp.fq > read2.fq`

To generate simulated data using art_illumina:

Generating the kmers to test:
perl GetRefKmers.pl 17 < e_coli_k12.fa
perl GetKmersAroundpos.pl 17 ref1.fa ref2.fa mutate.pos

Softwares:
quake v0.3 : run_quake.sh
musket v1.1 : run_musket.sh
soapec v2.01: run_soapec.sh
bless v0.17 : run_bless.sh
lighter : run_lighter.sh

Evaluating simulated data set:
Compile verify.cpp
simulate/run.sh

Evaluating real data set:
in the corresponding fold:
run_bowtie.sh
evaluate_bowite.sh
run_velvet.sh
(pick the parameter giving best NG50)
run_quast.sh

Evaluating memory usage:
compile memusage.cpp (obtained from musket's project)
memusage (command to the program).
For musket, we tested different number of size of bloom filter and choose the result with minimum memory consumption.
e.g.
For gage_chr14 data set:
~/Tools/memusage ./musket -p 10 -inorder -k 19 2200000000 -omulti tmp ~/data/Lighter/gage_chr14/frag_1.fastq ~/data/Lighter/gage_chr14/frag_2.fastq
