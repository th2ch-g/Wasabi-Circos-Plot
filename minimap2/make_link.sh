#!/bin/bash

out_paf="out.paf"
min_len_1="70000"
min_len_2="30000"

A1_A2_plus_color="color=107,142,35"
B1_B2_plus_color="color=0,191,255"

A1_A2_minus_color="color=205,92,92"
B1_B2_minus_color="color=205,92,92"


A1_B1_plus_color="color=169,169,169"
A2_B2_plus_color="color=169,169,169"

A1_B1_minus_color="color=205,92,92"
A2_B2_minus_color="color=205,92,92"

## plus
# A1 A2
cat $out_paf | rg _A1 | rg _A2 \
    | awk '{if($5 == "+"){print}}' \
    | choose 0 2 3 5 7 8 \
    | awk -v color=$A1_A2_plus_color '{print $0, color}' \
    | awk -v min_len=$min_len_1 '{if($3-$2 > min_len && $6-$5 > min_len){print}}' > A1_A2.link.plus

# B1 B2
cat $out_paf | rg _B1 | rg _B2 \
    | awk '{if($5 == "+"){print}}' \
    | choose 0 2 3 5 7 8 \
    | awk -v color=$B1_B2_plus_color '{print $0, color}' \
    | awk -v min_len=$min_len_1 '{if($3-$2 > min_len && $6-$5 > min_len){print}}' > B1_B2.link.plus

# A1 B1, A2 B2
cat $out_paf | rg _A1 | rg _B1 \
    | awk '{if($5 == "+"){print}}' \
    | choose 0 2 3 5 7 8 \
    | awk -v color=$A1_B1_plus_color '{print $0, color}' \
    | awk -v min_len=$min_len_2 '{if($3-$2 > min_len && $6-$5 > min_len){print}}' > A1_B1.link.plus

cat $out_paf | rg _A2 | rg _B2 \
    | awk '{if($5 == "+"){print}}' \
    | choose 0 2 3 5 7 8 \
    | awk -v color=$A2_B2_plus_color '{print $0, color}' \
    | awk -v min_len=$min_len_2 '{if($3-$2 > min_len && $6-$5 > min_len){print}}' > A2_B2.link.plus


## minus
# A1 A2
cat $out_paf | rg _A1 | rg _A2 \
    | awk '{if($5 == "-"){print}}' \
    | choose 0 2 3 5 7 8 \
    | awk -v color=$A1_A2_minus_color '{print $0, color}' \
    | awk -v min_len=$min_len_1 '{if($3-$2 > min_len && $6-$5 > min_len){print}}' > A1_A2.link.minus

# B1 B2
cat $out_paf | rg _B1 | rg _B2 \
    | awk '{if($5 == "-"){print}}' \
    | choose 0 2 3 5 7 8 \
    | awk -v color=$B1_B2_minus_color '{print $0, color}' \
    | awk -v min_len=$min_len_1 '{if($3-$2 > min_len && $6-$5 > min_len){print}}' > B1_B2.link.minus

# A1 B1, A2 B2
cat $out_paf | rg _A1 | rg _B1 \
    | awk '{if($5 == "-"){print}}' \
    | choose 0 2 3 5 7 8 \
    | awk -v color=$A1_B1_minus_color '{print $0, color}' \
    | awk -v min_len=$min_len_2 '{if($3-$2 > min_len && $6-$5 > min_len){print}}' > A1_B1.link.minus

cat $out_paf | rg _A2 | rg _B2 \
    | awk '{if($5 == "-"){print}}' \
    | choose 0 2 3 5 7 8 \
    | awk -v color=$A2_B2_minus_color '{print $0, color}' \
    | awk -v min_len=$min_len_2 '{if($3-$2 > min_len && $6-$5 > min_len){print}}' > A2_B2.link.minus


cat *.link.* | wc -l
