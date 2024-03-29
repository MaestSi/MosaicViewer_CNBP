# MosaicViewer_CNBP

**MosaicViewer_CNBP** is a pipeline for schematic visualization of expanded alleles with somatic mosaicism. Due to mosaicism, long sequencing reads can not be collapsed into an accurate consensus sequence. Therefore, only repeat annotation of each single read can be performed. MosaicViewer_CNBP integrates tool for performing repeat annotation of noisy long reads, performs alignment to left and right flanking regions, and generates "simplified" reads, for easier identification of alternative motifs in IGV visualization. The pipeline has only been used for CNBP expanded alleles, but its applicability can be extended with minor modification.

<p align="center">
  <img src="Figures/MosaicViewer.png" alt="drawing" width="400" title="MosaicViewer_pipeline">
</p>


## Getting started

**Prerequisites**

* Miniconda3.
Tested with conda 4.9.2.
```which conda``` should return the path to the executable.
If you don't have Miniconda3 installed, you could download and install it with:
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod 755 Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
```

* A fastq file containing reads from one sample. Tested with files produced with Guppy v3.4.5 specifying ```--pt_scaling TRUE``` parameter.
* A fasta file containing reference sequence (e.g. hg38)
* Coordinates of flanking regions (e.g. used for designing Crispr-Cas9 guides)

**Installation**

```
git clone https://github.com/MaestSi/MosaicViewer_CNBP.git
cd MosaicViewer_CNBP
chmod 755 *
./install.sh
```

Otherwise, you can download a docker image with:

```
docker pull maestsi/mosaicviewer_cnbp:latest
```

A conda environment named _MosaicViewer\_env_ is created, where seqtk, minimap2, samtools, NoiseCancellingRepeatFinder and BBMap are installed. Another conda environment named _NanoFilt\_env_ is created, where NanoFilt and R with package Biostrings are installed. 
Then, you can open the **config_MosaicViewer.sh** file with a text editor and set the variables _PIPELINE_DIR_ and _MINICONDA_DIR_ to the value suggested by the installation step.

## Usage
As a first step, open the **config_MosaicViewer.sh** file with a text editor and set all the variables. Depending on the reference coordinates set in the file, in-silico PCR primers and flanking regions for performing left or right alignment are extracted.

<p align="center">
  <img src="Figures/CNBP_left_right_alignment.png" alt="drawing" width="800" title="CNBP_left_right_alignment">
</p>

**MosaicViewer.sh**

Usage: ./MosaicViewer.sh

Note: the file **config_MosaicViewer.sh** should be in the same directory. It currently supports only TG, CCTG and TCTG repeat motifs.

Outputs:

* $SAMPLE_NAME"\_trimmed\_"$SIDE".bam": bam file containing expanded reads aligned to $GENE_NAME"\_masked\_reference\_"$SIDE".fasta"
* $SAMPLE_NAME"\_trimmed\_simplified\_"$SIDE"\_final.bam": bam file containing simplified version of expanded reads aligned to $GENE_NAME"\_masked\_reference\_"$SIDE".fasta", where the sequence of each identified repeat has been replaced with a single repeated nucleotide (TG -> GG; CCTG -> CCCC; TCTG -> TTTT; CCCG -> A; other -> N)
* Other temporary files

## Results visualization

For example, this is how the left alignment of trimmed reads (with or without colouring based on annotated repeats) would look like.

<p align="center">
  <img src="Figures/MosaicViewer_output_example.png" alt="drawing" width="800" title="MosaicViewer_output_example">
</p>

## Citation

If this tool is useful for your work, please consider citing our [manuscript](https://elifesciences.org/articles/80229).

Alfano M., De Antoni L., Centofanti F., Visconti V. V., Maestri S., Degli Esposti C., Massa R., D'Apice M. R., Novelli G., Delledonne M., Botta A. and Rossato M. (2022) Characterization of full-length CNBP expanded alleles in myotonic dystrophy type 2 patients by Cas9-mediated enrichment and nanopore sequencing eLife 11:e80229.

For further information, please refer to the following manuscripts:

Grosso V, Marcolungo L, Maestri S, Alfano M, Lavezzari D, Iadarola B, Salviati A, Mariotti B, Botta A, D'Apice MR, Novelli G, Delledonne M and Rossato M. Characterization of FMR1 repeat-expansion and intragenic variants by indirect sequence capture. Front. Genet. doi: 10.3389/fgene.2021.743230.

Harris RS, Cechova M, Makova KD. Noise-cancelling repeat finder: uncovering tandem repeats in error-prone long-read sequencing data. Bioinformatics. 2019 Nov 1;35(22):4809-4811. doi: 10.1093/bioinformatics/btz484. PMID: 31290946; PMCID: PMC6853708.

De Coster W, D'Hert S, Schultz DT, Cruts M, Van Broeckhoven C. NanoPack: visualizing and processing long-read sequencing data. Bioinformatics. 2018;34(15):2666-2669. doi:10.1093/bioinformatics/bty149

Li H. Minimap2: pairwise alignment for nucleotide sequences. Bioinformatics. 2018 Sep 15;34(18):3094-3100. doi: 10.1093/bioinformatics/bty191. PMID: 29750242; PMCID: PMC6137996.

R Core Team (2017). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.

Li H, Handsaker B, Wysoker A, Fennell T, Ruan J, Homer N, Marth G, Abecasis G, Durbin R; 1000 Genome Project Data Processing Subgroup. The Sequence Alignment/Map format and SAMtools. Bioinformatics. 2009 Aug 15;25(16):2078-9. doi: 10.1093/bioinformatics/btp352. Epub 2009 Jun 8. PMID: 19505943; PMCID: PMC2723002.

Thorvaldsdóttir H, Robinson JT, Mesirov JP. Integrative Genomics Viewer (IGV): high-performance genomics data visualization and exploration. Brief Bioinform. 2013 Mar;14(2):178-92. doi: 10.1093/bib/bbs017. Epub 2012 Apr 19. PMID: 22517427; PMCID: PMC3603213.

[BBMap – Bushnell B.](sourceforge.net/projects/bbmap/)

[seqtk](https://github.com/lh3/seqtk)
