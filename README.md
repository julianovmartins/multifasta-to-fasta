# multifasta-to-fasta
### Multi-FASTA to individual FASTA files

This script is designed to process files in multi-FASTA format, extracting individual FASTA content blocks.

**Usage:**
Place this script in the root directory containing your FASTA files and execute it from the command line.

**Functionality:**
- **Line 2**: Searches recursively for FASTA files in all directory trees.
- **Line 4**: Counts the number of sequence headers in each FASTA file.
- **Line 5**: Process files if they contain more than one sequence (multi-FASTA).
- **Line 6-8**: Sets up file and directory names for processing.
- **Line 9-11**: Creates a new directory for each multi-FASTA file if it doesn't exist.
- **Line 12**: Extracts each sequence from the multi-FASTA file, saving it as an individual FASTA file in the newly created directory.
- **Line 13**: Outputs the completion status with the path of the processed file.

**To give execute permission:**
```sh
chmod +x multifasta_to_fasta.sh
```

**Run:**
```sh
./multifasta_to_fasta.sh
```
