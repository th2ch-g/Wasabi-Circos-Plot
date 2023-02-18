#!/bin/bash

# common v1.1.2
genome=""

# A1 vs A2. ex chr_A1 vs chr_A2
for i in {1..7};
do
    for j in A B;
    do
        seqkit grep -nrp chr${i}_${j}1 $genome > chr${i}_${j}1.fa
        seqkit grep -nrp chr${i}_${j}2 $genome > chr${i}_${j}2.fa

        minimap2 --secondary=no -t 20 -c chr${i}_${j}1.fa chr${i}_${j}2.fa >> out.paf &
    done
done
wait


# A1 vs B1
for i in {1..7};
do
    for j in 1 2;
    do
        seqkit grep -nrp chr${i}_A${j} $genome > chr${i}_A${j}.fa
        seqkit grep -nrp chr${i}_B${j} $genome > chr${i}_B${j}.fa

        minimap2 --secondary=no -t 20 -c chr${i}_A${j}.fa chr${i}_B${j}.fa >> out.paf &
    done
done
wait

