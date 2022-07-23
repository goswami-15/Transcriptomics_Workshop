#First name and last name are assigned to different variables, and the script prints out full name
A="Sharmistha"
B="Goswami"
echo "$A $B"
# A version where the strings are printed on the same line and a version where the strings are printed on different lines
echo "$A $B"
echo "$A" 
echo "$B"
#Bash Story One 
#Create a new folder titled your name
mkdir goswami
#Create another new directory titled biocomputing and change to that directory with one line of command
mkdir biocomputing && cd biocomputing
#Downloading of 3 given files
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
#moving the .fna file to the folder titled my name directly
mv biocomputing/wildtype.fna goswami
#Deleting the duplicate .gbk file
cd biocomputing
rm wildtype.gbk.1
#Confirmation command if the file is mutant or wild type
cd goswami
grep tatatata *.fna
#This is the mutant file
#printing all the lines that show it is a mutant into a new file
grep -n tatatata *.fna > mutant_lines
#mutant_lines is the new file containing all lines and line numbers with tatatata 
#Clearing terminal space and printing all the commands used today
Ctrl l 
history
#Exiting the terminal
exit
#Bash Story Two
#Using  figlet command to draw a graphical representation of name.
figlet Sharmistha
#creating a folder called compare
mkdir compare
#Downloading one file [5MB] into the compare directory
cd compare
wget https://www.bioinformatics.babraham.ac.uk/training/Introduction%20to%20Unix/unix_intro_data.tar.gz
#Unzip using gunzip command
gunzip unix_intro_data.tar.gz
#untar the .tar file 
tar -xvf unix_intro_data.tar
#Getting into seqmonk_genomes/Saccharomyces cerevisiae/EF4 and identify the rRNAs present in Mito.dat.
cd seqmonk_genomes/Saccharomyces cerevisiae/EF4
grep -n rRNA Mito.dat
#Using (cp)command copy Mito.dat into the compare directory
cp Mito.dat /home/sharmistha/compare
#Use nano  to do the following:
#Changing Mito to Mitochondrion in the ID and AC header lines
nano
#!/usr/bin/bash
sed -i 's/Mito/Mitochondrion/g' Mito.dat
#Saved as Mitochondrion.sh 
chmod +x Mitochondrion.sh
#executed this script from terminal 
#Renaming the file from Mito.dat to Mitochondrion.txt
mv Mito.dat Mitochondrion.txt
#In compare directory, cd into FastQ_Data directory.
cd FastQ_Data/
#Calculate the total number of lines in lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
wc -l lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
#Print the total number of lines in all fastq.gz files and save it as a new file.
wc -l *.fastq.gz > line_numb
#Exiting terminal
exit
