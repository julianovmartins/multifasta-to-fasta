# multifasta-to-fasta
Multi-fasta to fasta file

This script was written with the purpose of extracting blocks with FASTA content from files in multi-FASTA format.

Place this file in the root folder where are your FASTA files and run it from the command line.

What this script does

- 2 - Search for FASTA files in all directories of the tree, recursively.
- 4 - Count existing headers.
- 5 - If the headers are greater than one...
- 6 - Set the file name.
- 7 - Set the directory.
- 8 - Set the new directory.
- 9 - If directory not exists...
- 11 - Create one.
- 12 - Extract every FASTA content block and put it in new file inside of the new directory created.
- 13 - Rename the FASTA file with new extension (.splitted)
- 14 - Print path of the FASTA file.

Give execute permission:
```sh
chmod +x multifasta_to_fasta.sh
```

Run:
```sh
./multifasta_to_fasta.sh
```

Suggestions? Collaborate with this script by creating a branch.
