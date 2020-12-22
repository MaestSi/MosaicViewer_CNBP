#!/bin/bash

#
# Copyright 2020 Simone Maestri. All rights reserved.
# Simone Maestri <simone.maestri@univr.it>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

#FASTQ is the file containing demultiplexed and quality filtered reads
FASTQ=/path/to/sample/reads.fastq
#REFERENCE is the file used for extracting flaking regions
REFERENCE=/path/to/reference.fasta
#FW_PRIMER_COORD and RV_PRIMER_COORD are coordinates of primers for in-silico PCR
FW_PRIMER_COORD="chr3:129171681-129171781"
RV_PRIMER_COORD="chr3:129175831-129175931"
#GENE_NAME
GENE_NAME="CNBP"
#GENE_STRAND is used for calculating the reverse-complement of reference region is the gene is in the minus strand
GENE_STRAND="-"
#THR is the alignment identity threshold for in-silico PCR
THR=0.7
#MINLENGTH is the minimum expected length of reads from expanded allele
MINLENGTH=4500

#right alignment
#SIDE="right"
#FLANKING_REF_COORD are coordinates of genomic regions used to create a reference for alignment
#FLANKING_REF_COORD="chr3:129171681-129172577"
#FLANKING_COORD_TRIMMED are coordinates of genomic regions used to trim the other flanking region
#FLANKING_COORD_TRIMMED="chr3:129172733-129175931"

#left alignment
SIDE="left"
#FLANKING_REF_COORD are coordinates of genomic regions used to create a reference for alignment
FLANKING_REF_COORD="chr3:129172733-129175931"
#FLANKING_COORD_TRIMMED are coordinates of genomic regions used to trim the other flanking region
FLANKING_COORD_TRIMMED="chr3:129171681-129172577"

#TOOLS
MSA=msa.sh
CUTPRIMERS=cutprimers.sh
SAMTOOLS=samtools
MINIMAP2=minimap2
SEQTK=seqtk
NANOFILT="/path/to/NanoFilt"
NCRF_DIR="/path/to/NoiseCancellingRepeatFinder/directory"
SIMPLIFY_READS="Rscript /path/to/simplify_reads.R"
