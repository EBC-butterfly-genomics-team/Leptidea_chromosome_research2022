script by Luis Leal (adapted)

###### START UPPMAX RUNS 

#calls FastQ Screen bash file for each read library 

echo
echo "Starting Uppmax jobs ..."
echo

#input data files (DM)

PATH_MAIN=/home/larshook/LarsH/READ_MAPPING		#project main folder
PATH_LOCAL=TrimGalore                                    #folder containing input data
N_SAMPLES=8                                                  #number of samples

SRCDIR=$(pwd)                                                #remember current path

cd $PATH_MAIN/$PATH_LOCAL

find * -maxdepth 0 -type f >$SRCDIR/list_all_files.txt       #gets names of all files present in 
                                                             #input data folder, saves names to file

cd $SRCDIR

grep "\.fq.gz" list_all_files.txt>input_data_file_names.txt	#(.fq.gz)
#grep "\.fastq$" list_all_files.txt>input_data_file_names.txt   #gets names of all data files (.fastq)


RAW_FN=$SRCDIR/input_data_file_names.txt

declare -A READS                                             #declare variable as array

i=1
j=1

while read -r LINE                                 #reads each filename at a time, stores names
                                                   #(paired) in array 
do
   if [ "$j" -eq 1 ]
   then
      READS[$i,1]=$LINE
      let "j=2"
   else
      READS[$i,2]=$LINE
      let "i+=1"
      let "j=1"
   fi
#   echo ${READS[$i,$j]}
done < ${RAW_FN}




# create output folder

cd $PATH_MAIN/                                     #cd to project folder
OUT_FOLDER=FastQScreen                       #main output folder

if [ -d "$OUT_FOLDER" ]                          #check whether main output folder already exists
   then
      { echo "Error: $PATH_MAIN/$OUT_FOLDER folder already exists."; echo ; exit 1; }
   else
      mkdir $OUT_FOLDER                            #create output folder
fi



# run jobs

cd $PATH_MAIN/$OUT_FOLDER

for i in `seq 1 1 $N_SAMPLES`; do                  #loop starting all jobs
   for j in `seq 1 1 2`; do

      DNAFILE_A=${READS[$i,$j]}
      echo $DNAFILE_A                                          #display fastq file name

      sbatch $SRCDIR/fastQScreen_run_query.sh \
                              $PATH_MAIN/$PATH_LOCAL/$DNAFILE_A \
                              ${READS[$i,$j]} \
                              $PATH_MAIN/$OUT_FOLDER

      sleep 1                                                  #pauses for 1 sec
      
      echo
   done
done


squeue -u $USER                                    #check job status
echo
