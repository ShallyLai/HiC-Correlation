# run for the correlation plot

# $1 means the dataset we choose in our pipeline
# Jin Rao Dixon
mkdir ./pngs/$1

# TODO: change normalization methods
for nor in NONE #VC VC_SQRT KR 
do 
	for chromosome in 1 22	
	do 
		for bin_size in 10  
		do
			Rscript ./calCor-4-ncontacts.r list/$1_${nor}_chr${chromosome}_${bin_size}kb.list $1_${nor}_chr${chromosome}_${bin_size}kb
		done
	done
done
