# script by Luis Leal (adapted)

###### START UPPMAX RUNS (CALLS trimgalore_run_query.sh BASH FILE FOR EACH SET OF PAIRED-END READS)

echo
echo "Starting Uppmax jobs ..."
echo

#input data files


#path to where raw files are located (top folder)
PATH_RAW=/proj/uppoff2020002/private/group_member_backups/LarsH/READ_MAPPING

#path to project folder (my analysis)
PATH_MAIN=/proj/uppoff2020002/private/group_member_backups/LarsH/READ_MAPPING

#file with names of files containing raw reads
RAW_FN=/home/larshook/SCRIPTS/ASSEMBLY_MS/ASSEMBLY/leptidea_raw_reads.txt


N_SAMPLES=8                                       #number of samples

declare -A READS                                   #declare variable as array

i=1
j=1

while read -r LINE                                 #reads each filename at a time, stores names (paired) in array 
do
   if [ "$j" -eq 1 ]
   then
      READS[$i,1]=$PATH_RAW/$LINE
      let "j=2"
   else
      READS[$i,2]=$PATH_RAW/$LINE
      let "i+=1"
      let "j=1"
   fi
   echo ${READS[$i,$j]}
done < ${RAW_FN}



# prepare output folder

SRCDIR=$(pwd)                                      #remember current path

cd $PATH_MAIN/                                     #cd to project folder
OUT_FOLDER=TrimGalore/                          #output folder

if [ -d "$OUT_FOLDER" ]                            #check whether output folder already exists
   then
      { echo "Error: $PATH_MAIN/$OUT_FOLDER folder already exists."; echo ; exit 1; }
   else
      mkdir $OUT_FOLDER                            #create output folder
fi



# start jobs

cd $SRCDIR

for i in `seq 1 1 $N_SAMPLES`; do                  
   DNAFILE_A=${READS[$i,1]}
   DNAFILE_B=${READS[$i,2]}
   echo $DNAFILE_A                                          #display fastq file names (paired)
   echo $DNAFILE_B
   sbatch trimgalore_run_query.sh $DNAFILE_A \
                                  $DNAFILE_B \
                                  $PATH_MAIN/$OUT_FOLDER/   #starts job
   sleep 1                                                  #pauses for 1 sec
   echo
done


squeue -u $USER                                    #check job status
echo
