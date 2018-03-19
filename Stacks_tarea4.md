# 4. Running the pipeline
----------------------------------

#### 4.1 Clean the data

In a typical analysis, data will be recieved from a Illumina sequencer, or some other type of sequencer as FASTQ files. The first requirment is to demultiplex, or sort, the raw data to recover the individual samples in the Illumina library. While doing this, we will use the <span style="color:blue"> Phred </span> scores provided in the FASTQ files to discard sequencing reads of low quality. These tasks are accomplished using the <span style="color:green"> **process_radtags** </span> program.

![process_radtags.png](https://github.com/MajoMonteverde/Tareas_Curso_BioinfInvRepro/blob/master/process_radtags.png)


Some things to consider when running this program:

* <span style="color:green"> **process_radtags** </span> can handle both single-end or paired-end Illumina sequencing.

* The raw data can be compressed, or gzipped (files end with a `".gz"` suffix).

* You can supply a list of barcodes, or indexes, to <span style="color:green"> **process_radtags** </span> in order for it to demultiplex your samples. These barcodes can be single-end barcodes or combinatorial barcodes (pairs of barcodes, one on each of the paired reads). Barcodes are specified, one per line (or in tab separated pairs per line), in a text file.

	* If, in addition to your barcodes, you also supply a sample name in an extra column within the barcodes file, <span style="color:green"> **process_radtags** </span> will namde your output files according to sample name instead of barcode.

* If you believe your reads may contain adapter contaminetion, <span style="color:green"> **process_radtags** </span> can filter it out.

* You can supply the restricion enzyme used to contruct the library. In the case of double-digest RAD, you can supply both restriction enzymes.

* If instructed, (`-r`command line option), <span style="color:green"> **process_radtags** </span> will correct barcodes and restriction enzyme sites that are within a certain distance form the true barcode or restriction enzyme cutsite.
