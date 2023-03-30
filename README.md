# HiC-Correlation
## Step 1: download straw 
https://github.com/aidenlab/straw

## Step 2: extract matrix from _.hic_ files
Example
```
./run4GenData.sh Rao
```
## Step 3: modify _.list_ files
List the matrix which extracted from straw (i.e _.txt_ files) you want to compare into _.list_.  
  
Example
```
***.list/
HiC-Pro data/Rao/Rao_hicpro_NONE_chr1_10kb.txt
HiCUP data/Rao/Rao_hicup_NONE_chr1_10kb.txt
Hi-CPIPE data/Rao/Rao_hicpipe_NONE_chr1_10kb.txt
Hickit data/Rao/Rao_hickit_NONE_chr1_10kb.txt
Bin3C_5 data/Rao/Rao_5_NONE_chr1_10kb.txt
Bin3C_5SP data/Rao/Rao_5SP_NONE_chr1_10kb.txt
```

## Step 4: run correlation codes
Example
```
./run4analysis.sh Rao
```
or
```
Rscript ./calCor-4-ncontacts.r list/Rao_NONE_chr1_10kb.list Rao_NONE_chr1_10kb
```

Please see illustration in ***run4GenData.sh*** and ***run4analysis.sh*** to modify the TODO parts for other analysis.
