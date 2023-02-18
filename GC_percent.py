#!/usr/bin/env python3

import numpy as np
import os
import sys
import subprocess as sb

# 1%
target_chr_name = sys.argv[1]
ref_path = sys.argv[2]

cmd = 'seqkit grep -w 0 -nrp ' + target_chr_name + ' ' + ref_path + ' | tail -n +2'
target_chr_seq = os.popen(cmd).read().strip()

target_chr_len = len(target_chr_seq)
target_chr_GC = np.zeros(100)
for i in range(0, target_chr_len):
    tmp_now_percent = int(i/target_chr_len*100)
    if target_chr_seq[i] == "G" or target_chr_seq[i] == "C":
        target_chr_GC[tmp_now_percent] += 1
    elif target_chr_seq[i] == "g" or target_chr_seq[i] == "c":
        target_chr_GC[tmp_now_percent] += 1


for i in range(0, 100):
    print(target_chr_name + "\t" + str(int(target_chr_len * i / 100)) + "\t" + str(int(target_chr_len * (i+1) / 100)) + "\t" + str(target_chr_GC[i] / (target_chr_len / 100) * 100) )

