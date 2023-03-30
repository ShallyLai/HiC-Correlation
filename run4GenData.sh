# TODO: tool to extract matrix from .hic files
# file path of straw form Juicer
# must need the absolute path 
straw="/Users/shallylai/Juicer/straw-master/bin/Mac/straw"

# store the output file
cd data 

# $1: name of dataset
mkdir $1
cd ..

# TODO: mapping tools' name
declare -a Tools=("hicpro" "hicup" "hicpipe" "hickit" "5" "5SP")

# path of Hi-C data
HiC_data_Path="/Users/shallylai/Special_Topics/HiC"

# TODO: loop for HiC map normalization methods
for nor in NONE #VC VC_SQRT KR
do
	# TODO: chromosome we want to get
	for chr in 1 22 
	do
		# TODO: HiC binszies
		for bin_size in 10 #25 
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

