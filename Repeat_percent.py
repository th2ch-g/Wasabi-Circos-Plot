#!/usr/bin/env python3

import os
import sys
import subprocess as sb
import numpy as np


target_chr_name = sys.argv[1]
ref_path = sys.argv[2]
reformated_file = sys.argv[3]

cmd = 'seqkit grep -w 0 -nrp ' + target_chr_name + ' ' + ref_path + ' | seqkit stats | tail -n +2 | choose 4 | choose : -f "," -o "" '
target_chr_len = int(os.popen(cmd).read().strip())

target_chr_Repeat = np.zeros(100)
with open(reformated_file) as ref:
    for line in ref:
        line = line.rstrip()
        if target_chr_name not in line:
            continue
        a = line.split(" ")
        chr_name = a[0]
        start = int(a[1])
        end = int(a[2])

        tmp_position = int((start+end)/2 / target_chr_len * 100)
        target_chr_Repeat[tmp_position] += (end-start+1)


for i in range(0, 100):
    print(target_chr_name + "\t" + str(int(target_chr_len * i / 100)) + "\t" + str(int(target_chr_len * (i+1) / 100)) + "\t" + str(target_chr_Repeat[i] / (target_chr_len / 100) * 100) )


