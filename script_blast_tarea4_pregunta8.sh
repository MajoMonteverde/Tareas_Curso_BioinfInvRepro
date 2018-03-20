#!/bin/bash

####Script for downloading sequences and using blast 
### by Majo Monteverde 


##Download and "install" blast in your local machine.
docker pull biocontainers/blast

##Running BLAST (check it works)
docker run biocontainers/blast blastp -help

##Download a human prion sequence from uniport in fasta format
wget http://www.uniprot.org/uniprot/P04156.fasta

##Download the zebrafish database from NCBI
curl -O ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz

##Unpack the zebrafish database
gunzip zebrafish.1.protein.faa.gz

##Mount volume in my computer and run blast
docker run -v /home/majo/Escritorio/BioinfinvRepro/Unidad4/tarea_4_blast:/data/ biocontainers/blast makeblastdb -in zebrafish.1.protein.faa -dbtype prot

## Blast sequences and save a results file in my computer
docker run -v /home/majo/Escritorio/BioinfinvRepro/Unidad4/tarea_4_blast:/data/ biocontainers/blast blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt
