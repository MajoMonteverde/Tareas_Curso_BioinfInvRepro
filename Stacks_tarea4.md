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


#### 4.1.1 Understanding barcodes/indexes and specifying the barcode type

Genotype by sequencing libraries sample the genome by selecting DNA adjacent to one or more recognition enzyme cutsites. By reduciong the amount of total DNA sampled, most researchers will multiplex many samples into one molecular library. Individual samples are demarcated in the library by ligating an oligo barcode onto the restriction enzyme-associated DNA for each sample. Alternatively, an index barcode is used, where the barcode is located upstream of the sample DNA within the sequencing adaptor. Regardless of the type of barcode used, after sequencing, the data must be demultiplexed so the samples are again separated. The `process_radtags`program will perform this task, but we much specify the type of barcodes used, and where to find them in the sequencing data.

There are a numbre of different configurations possible, each of them is detailed below.

1. If your data are **single-end** or **paired-end**, with an inline barcode present only on the single-end (marked in red):

```@HWI-ST0747:188:C09HWACXX:1:1101:2968:2083 1:N:0:
<span style="color:red">TTATG</span>ATGCAGGACCAGGATGACGTCAGCACAGTGCGGGTCCTCCATGGATGCTCCTCGGTCGTGGTTGGGGGAGGAGGCA
+
@@@DDDDDBHHFBF@CCAGEHHHBFGIIFGIIGIEDBBGFHCGIIGAEEEDCC;A?;;5,:@A?=B5559999B@BBBBBA
@HWI-ST0747:188:C09HWACXX:1:1101:2863:2096 1:N:0:
<span style="color:red">TTATG</span>ATGCAGGCAAATAGAGTTGGATTTTGTGTCAGTAGGCGGTTAATCCCATACAATTTTACACTTTATTCAAGGTGGA
+
CCCFFFFFHHHHHJJGHIGGAHHIIGGIIJDHIGCEGHIFIJIH7DGIIIAHIJGEDHIDEHJJHFEEECEFEFFDECDDD
@HWI-ST0747:188:C09HWACXX:1:1101:2837:2098 1:N:0:
<span style="color:red">GTGCC</span>TTGCAGGCAATTAAGTTAGCCGAGATTAAGCGAAGGTTGAAAATGTCGGATGGAGTCCGGCAGCAGCGAATGTAAA```


Then you can specify the `--inline_null`flag ro <span style="color:green"> **process_radtags** </span>. This is also the default behavior and the flag can be ommitted in this case.