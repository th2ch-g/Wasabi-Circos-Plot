#!/bin/bash

# v1.1.2 fasta
genome=""

# chr.txt
echo -n "" > chr.txt
for i in chr1_B1 chr1_B2 chr2_B1 chr2_B2 chr3_B1 chr3_B2 chr4_B1 chr4_B2 chr5_B1 chr5_B2 chr6_B1 chr6_B2 chr7_B1 chr7_B2 dammy chr7_A2 chr7_A1 chr6_A2 chr6_A1 chr5_A2 chr5_A1 chr4_A2 chr4_A1 chr3_A2 chr3_A1 chr2_A2 chr2_A1 chr1_A2 chr1_A1
do
    if [ $i != "damy" ]; then
        length=$(seqkit grep -np $i $genome | seqkit stats | tail -n +2 | choose 4 | choose -f "," -o "" : )
    else
        length="50000000"
        color="white"
    fi

    if [[ $i =~ "_A1" ]]; then
        color="vvdgreen"
    elif [[ $i =~ "_A2" ]]; then
        color="green"
    elif [[ $i =~ "_B1" ]]; then
        color="vvdblue"
    elif [[ $i =~ "_B2" ]]; then
        color="blue"
    fi
    echo "chr - $i $i 0 $length $color" >> chr.txt
done


# GC content
echo -n "" > GC_percent.tsv
for i in $(rg ">" $genome | choose -f ">" : );
do
    python3 GC_percent.py $i $genome >> GC_percent.tsv
done


# Repeat content
echo -n "" > Repeat_percent.tsv
./prepare_Repeat_percent.sh
for i in $(rg ">" $genome | choose -f ">" : );
do
    python3 Repeat_percent.py $i $genome RM.reformated.out >> Repeat_percent.tsv
done


# LTR content
echo -n "" > LTR_percent.tsv
./prepare_LTR_percent.sh
for i in $(rg ">" $genome | choose -f ">" : );
do
    python3 Repeat_percent.py $i $genome RM.LTR.reformated.out >> LTR_percent.tsv
done

