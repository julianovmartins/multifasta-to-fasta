#!/bin/bash
# Start of the bash script.

# Loop through each .fasta file in the current directory and its subdirectories.
for fasta_file in $(find ./ -name '*.fasta'); do

    # Count the number of headers (lines starting with '>') in the FASTA file.
    count_header=`grep -c '^>' $fasta_file`;
    
    # If there is more than one header, it's a multi-FASTA file.
    if [[ $count_header -gt 1 ]]; then

        # Extract the base name of the FASTA file.
        file_name=$(basename "$fasta_file" ".fasta");

        # Get the directory path of the FASTA file.
        directory=$(dirname $fasta_file);
        
        # Create a new directory path for storing individual FASTA files.
        new_directory=$directory"/"$file_name"/";
        
        # Create a new directory if it doesn't exist.
        if [ ! -d "$new_directory" ]; then
            mkdir $new_directory;
        fi

        # For each header line, close the previous file handle, extract the 
        # identifier, and open a new file for writing.
        # Name each file with the file based on the header.
        awk -v dir="$new_directory" '/^>/ {close(F); split(substr($1,2), a, " "); F = dir"/"a[1]".fasta"} {print >> F}' $fasta_file;

        # Output a message indicating the completion of file splitting.
        echo "File splitted: $fasta_file";
        
    fi
done
