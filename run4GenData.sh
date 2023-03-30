# tool to extract matrix from .hic files
# file path of straw form Juicer
# You need run a script by putting the absolute path 
straw="/Users/shallylai/Juicer/straw-master/bin/Mac/straw"

# store the output file
cd data 
# $1: name of dataset
mkdir $1
cd ..
# mapping tools' name
declare -a Tools=("hicpro" "hicup" "hicpipe" "hickit" "5" "5SP")

# path of Hi-C data
HiC_data_Path="/Users/shallylai/Special_Topics/HiC"

# loop HiC map normalization methods
for nor in NONE VC VC_SQRT KR
do
	# chromosome we want to get
	for chr in 1 22 
	do
		# HiC binszies
		for bin_size in 10 25 
		do
			echo "Process: " $nor $chr ${bin_size}000
			# extract sparse upper triangular matrix format for mapping tools
			for MappingTool in "${Tools[@]}"
			do
				out_file="data/$1/$1_${MappingTool}_${nor}_chr${chr}_${bin_size}kb.txt"
                echo out_file
				echo $out_file "create"
				[ ! -e $out_file ] && $straw $nor $HiC_data_Path/$1/"$MappingTool"_$1.hic $chr $chr BP ${bin_size}000 > $out_file
			done
		done
	done
done

