#!/bin/bash -l

ASSEMBLY=P14502_103
BLOBTOOLS_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH/BLOBTOOLS/RESULTS


echo "Log for stats of filtering BlobTools output table for $ASSEMBLY" > $ASSEMBLY-log_stats_for_blobtools.txt
date >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt


echo "busco scaffolds:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -wf $BLOBTOOLS_PATH/busco_scaffolds_$ASSEMBLY.txt $BLOBTOOLS_PATH/$ASSEMBLY.FINAL-deduped-nuc.blobDB.table.txt | awk 'NR>10 {print}' | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "busco scaffolds total seq:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -wf $BLOBTOOLS_PATH/busco_scaffolds_$ASSEMBLY.txt $BLOBTOOLS_PATH/$ASSEMBLY.FINAL-deduped-nuc.blobDB.table.txt | awk 'NR>10 {sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

####

echo "Arthropoda scaffolds kept after filter A:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Arthropoda" $BLOBTOOLS_PATH/$ASSEMBLY-cds_a-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "Arthropoda seq kept after filter A:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Arthropoda" $BLOBTOOLS_PATH/$ASSEMBLY-cds_a-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "undef scaffolds kept after filter A:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "undef" $BLOBTOOLS_PATH/$ASSEMBLY-cds_a-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "undef seq kept after filter A:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "undef" $BLOBTOOLS_PATH/$ASSEMBLY-cds_a-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

####

echo "no-hit scaffolds kept after filter B:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "no-hit" $BLOBTOOLS_PATH/$ASSEMBLY-cds_b-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "no-hit seq kept after filter B:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "no-hit" $BLOBTOOLS_PATH/$ASSEMBLY-cds_b-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "Proteobacteria scaffolds kept after filter B:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Proteobacteria" $BLOBTOOLS_PATH/$ASSEMBLY-cds_b-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "Proteobacteria seq kept after filter B:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Proteobacteria" $BLOBTOOLS_PATH/$ASSEMBLY-cds_b-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "unresolved scaffolds kept after filter B:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "unresolved" $BLOBTOOLS_PATH/$ASSEMBLY-cds_b-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "unresolved seq kept after filter B:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "unresolved" $BLOBTOOLS_PATH/$ASSEMBLY-cds_b-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "Streptophyta scaffolds kept after filter B:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Streptophyta" $BLOBTOOLS_PATH/$ASSEMBLY-cds_b-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "Streptophyta seq kept after filter B:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Streptophyta" $BLOBTOOLS_PATH/$ASSEMBLY-cds_b-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

####

echo "Arthropoda scaffolds kept after filter C:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Arthropoda" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_c-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "Arthropoda seq kept after filter C:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Arthropoda" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_c-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "undef scaffolds kept after filter C:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "undef" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_c-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "undef seq kept after filter C:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "undef" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_c-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

####

echo "no-hit scaffolds kept after filter D:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "no-hit" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_d-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "no-hit seq kept after filter D:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "no-hit" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_d-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "Proteobacteria scaffolds kept after filter D:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Proteobacteria" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_d-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "Proteobacteria seq kept after filter D:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Proteobacteria" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_d-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "unresolved scaffolds kept after filter D:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "unresolved" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_d-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "unresolved seq kept after filter D:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "unresolved" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_d-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "Streptophyta scaffolds kept after filter D:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Streptophyta" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_d-filtered.txt | wc -l >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

echo "Streptophyta seq kept after filter D:" >> $ASSEMBLY-log_stats_for_blobtools.txt
grep -w "Streptophyta" $BLOBTOOLS_PATH/$ASSEMBLY-non_cds_d-filtered.txt | awk '{sum+=$2} END {print sum}' >> $ASSEMBLY-log_stats_for_blobtools.txt
echo >> $ASSEMBLY-log_stats_for_blobtools.txt

####

echo "printed output to: $ASSEMBLY-log_stats_for_blobtools.txt"
