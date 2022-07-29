#Downloading some (>2) sample datasets
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R1.fastq.gz?raw=true -O Alsen_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R2.fastq.gz?raw=true -O Alsen_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Baxter_R1.fastq.gz?raw=true -O Baxter_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Baxter_R2.fastq.gz?raw=true -O Baxter_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Chara_R1.fastq.gz?raw=true -O Chara_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Chara_R2.fastq.gz?raw=true -O Chara_R2.fastq.gz
# Installation of fastqc 
conda install -c bioconda fastqc
sample=("Alsen_R1"
"Alsen_R2"
"Baxter_R1"
"Baxter_R2"
"Chara_R1"
"Chara_R2"
)
#Using FASTQC 
mkdir Output
cd Output
mkdir Fastqc_Reports
cd ..
for sample in "${sample[@]}";
do
       fastqc Raw_Fastq/${sample}*.fastq.gz -o Output/Fastqc_Reports
done
#Downloading .bam files
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/alignment_map/Alsen.bam?raw=true -O Alsen.bam
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/alignment_map/Baxter.bam?raw=true -O Baxter.bam
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/alignment_map/Chara.bam?raw=true -O Chara.bam
#Using samtool
sample=("Alsen"
"Baxter"
"Chara"
)
mkdir flagstat_report
for sample in "${sample[@]}";
do
        samtools flagstat ${sample}.bam > flagstat_report/${sample}.flagstat.txt 
        echo done
done
#Sorting .bam files
mkdir sorted
for sample in "${sample[@]}";
do
     samtools sort -o sorted/${sample}.bam ${sample}.bam
     echo done
done
#Installation and Using Qualimap
conda install -c bioconda qualimap
for sample in "${sample[@]}";
do
   qualimap bamqc -bam BAM_Files/sorted/${sample}.bam -outdir Output/qualimap_results/${sample}.txt -outfile ${sample}.pdf
   echo done
done 
#Installation htseq 
conda install -c bioconda htseq 
#Using htseq
#Getting human GTF
wget http://ftp.ensembl.org/pub/current_gtf/homo_sapiens/Homo_sapiens.GRCh38.107.chr.gtf.gz
#Unzipping the Zip file
gunzip Homo_sapiens.GRCh38.107.chr.gtf.gz
#Downloading .sam file
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/alignment/ACBarrie.sam?raw=true -O ACBarrie.sam
htseq-count ACBarrie.sam Homo_sapiens.GRCh38.107.chr.gtf --t=gene --stranded=yes --i=gene_id > Output/gene_read.txt
#Error occured when processing SAM input (line 11556 of file ACBarrie.sam):
  #('SAM line does not contain at least 11 tab-delimited fields.', 'line 11556 of file ACBarrie.sam')
exit
  

