#!/bin/bash
for fasta_file in $(find ./ -name '*.fasta'); do
    count_header=`grep -c '^>' $fasta_file`;
    if [[ $count_header -gt 1 ]]; then
        file_name=$(basename "$fasta_file" ".fasta");
        directory=$(dirname $fasta_file);
        new_directory=$directory"/"$file_name"/";
        if [ ! -d "$new_directory" ]; then
            mkdir $new_directory;
        fi
        awk -v dir="$new_directory" '/^>/ {close(F); split(substr($1,2), a, " "); F = dir"/"a[1]".fasta"} {print >> F}' $fasta_file;
        echo "File splitted: $fasta_file";
    fi
done
