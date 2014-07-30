#!/bin/sh
rm summary.out
for prog in quake soapec musket bless lighter
do
	for cov in 35 70 140
	do
		for err in 1 3
		do
			for k in 17 19 23 27 31
			do
				echo "# ${prog}_${cov}_${err}_${k}" 
				echo "# ${prog}_${cov}_${err}_${k}" >> summary.out
				./verify ${prog}/${prog}_simulate_${cov}_${err}_${k}.fq | head -13 | tail -4 >> summary.out
			done
		done
	done
done
