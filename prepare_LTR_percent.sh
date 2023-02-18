#!/bin/bash

# RepeatMasker out file path
RM_out=""
cat $RM_out | tail -n +4 | rg LTR | choose 4 5 6 > RM.LTR.reformated.out
