# run for the correlation plot

# $1 means the dataset we choose in our pipeline
# Jin Rao Dixon
mkdir ./pngs/$1

for nor in NONE #VC VC_SQRT KR 
do 
	for chromosome in 1 22	
	do 
		for bin_size in 10  
		do
			Rscript ./calCor-4-ncontacts.R list/$1_${nor}_chr${chromosome}_${bin_size}kb.list $1_${nor}_chr${chromosome}_${bin_size}kb
		done
	done
done
