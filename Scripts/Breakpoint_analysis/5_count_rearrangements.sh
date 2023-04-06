#!/bin/bash

cd /home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS

printf "Rearrangements in "$1"\n\n" > "$1".count

printf "fi_swe: " >> "$1".count
grep "fi_swe" "$1" | wc -l >> "$1".count

printf "fi_spa: " >> "$1".count
grep "fi_spa" "$1" | wc -l >> "$1".count

printf "fi_rea: " >> "$1".count
grep "fi_rea" "$1" | wc -l >> "$1".count

printf "fi_anc_sin: " >> "$1".count
grep "fi_anc_sin" "$1" | wc -l >> "$1".count

printf "fu_swe: " >> "$1".count
grep "fu_swe" "$1" | wc -l >> "$1".count

printf "fu_spa: " >> "$1".count
grep "fu_spa" "$1" | wc -l >> "$1".count

printf "fu_rea: " >> "$1".count
grep "fu_rea" "$1" | wc -l >> "$1".count

printf "fu_anc_sin: " >> "$1".count
grep "fu_anc_sin" "$1" | wc -l >> "$1".count

printf "BR/ILS_juv/spa: " >> "$1".count
grep "BR/ILS_juv/spa" "$1" | wc -l >> "$1".count

printf "BR/ILS_juv/swe: " >> "$1".count
grep "BR/ILS_juv/swe" "$1" | wc -l >> "$1".count

printf "BR/ILS_rea/spa: " >> "$1".count
grep "BR/ILS_rea/spa" "$1" | wc -l >> "$1".count

printf "BR/ILS_rea/swe: " >> "$1".count
grep "BR/ILS_rea/swe" "$1" | wc -l >> "$1".count

printf "fi_juv/fu_anc_rea/sin: " >> "$1".count
grep "fi_juv/fu_anc_rea/sin" "$1" | wc -l >> "$1".count 

printf "fu_juv/fi_anc_rea/sin: " >> "$1".count
grep "fu_juv/fi_anc_rea/sin" "$1" | wc -l >> "$1".count
