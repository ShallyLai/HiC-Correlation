# none normalization
Rscript ./calCor-4-ncontacts.R lists/NONE_chr1_500kb.list NONE_chr1_500kb
Rscript ./calCor-4-ncontacts.R lists/NONE_chr22_500kb.list NONE_chr22_500kb
Rscript ./calCor-4-ncontacts.R lists/NONE_chr1_100kb.list NONE_chr1_100kb
Rscript ./calCor-4-ncontacts.R lists/NONE_chr22_100kb.list NONE_chr22_100kb

# for KR normalization (Knight-Ruiz or Balanced normalization)
Rscript ./calCor-4-ncontacts.R lists/KR_chr1_500kb.list KR_chr1_500kb
Rscript ./calCor-4-ncontacts.R lists/KR_chr22_500kb.list KR_chr22_500kb
Rscript ./calCor-4-ncontacts.R lists/KR_chr1_100kb.list KR_chr1_100kb
Rscript ./calCor-4-ncontacts.R lists/KR_chr22_100kb.list KR_chr22_100kb

# for VC normalization (vanilla coverage)
Rscript ./calCor-4-ncontacts.R lists/VC_chr1_500kb.list VC_chr1_500kb
Rscript ./calCor-4-ncontacts.R lists/VC_chr22_500kb.list VC_chr22_500kb
Rscript ./calCor-4-ncontacts.R lists/VC_chr1_100kb.list VC_chr1_100kb
Rscript ./calCor-4-ncontacts.R lists/VC_chr22_100kb.list VC_chr22_100kb

# for VC_SQRT normalization (square root of vanilla coverage)
Rscript ./calCor-4-ncontacts.R lists/VC_SQRT_chr1_500kb.list VC_SQRT_chr1_500kb
Rscript ./calCor-4-ncontacts.R lists/VC_SQRT_chr22_500kb.list VC_SQRT_chr22_500kb
Rscript ./calCor-4-ncontacts.R lists/VC_SQRT_chr1_100kb.list VC_SQRT_chr1_100kb
Rscript ./calCor-4-ncontacts.R lists/VC_SQRT_chr22_100kb.list VC_SQRT_chr22_100kb
