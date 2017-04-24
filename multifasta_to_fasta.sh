#!/bin/bash
for fasta_file in $(find ./ -name '*.fasta'); 
do 
    count_header=`grep -c '^>' $fasta_file`;
    if [[ $count_header -gt 1 ]]; then
        file_name=$(basename "$fasta_file" ".fasta");
        directory=$(dirname $fasta_file);
        new_directory=$directory"/"$file_name"/";
        if [ ! -d "$new_directory" ]; then
            mkdir $new_directory;
        fi
        awk -v dir="$new_directory" -F'[|, ]' '/^>/ {if ($0 ~ /([NC|AC|NG|NT|NW|NS|NZ|NM|NR|XM|XR|AP|NP|YP|XP|ZP]_*)/)  s=$1".fasta"; else s=$0".fasta";} {print > dir"/"s}' $fasta_file;
        mv $fasta_file $fasta_file".splitted";
        echo "File splitted: $fasta_file";
    fi
done
