#!/bin/bash

# RepeatMasker out file
RM_out=""
cat $RM_out | tail -n +4 | choose 4 5 6 > RM.reformated.out
