#gets informativeness of posterior file
BEGIN{
	FS="\t"
	inf["0 1.0 0 0 0 0 0 0 0 0"]=1
	inf["0 0 1.0 0 0 0 0 0 0 0"]=1
	inf["0 0 0 1.0 0 0 0 0 0 0"]=1
	inf["0 0 0 0 0 1.0 0 0 0 0"]=1
	inf["0 0 0 0 0 0 1.0 0 0 0"]=1
	inf["0 0 0 0 0 0 0 0 1.0 0"]=1

}

(NR==2){for (i=3; i<=NF; ++i) {f[i]=$i; if (!($i in d)) d[$i]=++numF}}
(NR==4){for (i=3; i<=NF; ++i) if ($i==0)if (p1[d[f[i]]]=="") p1[d[f[i]]]=i; else p2[d[f[i]]]=i}

#(NR==7){print "#"}

(NR>7){
	s = $1 "\t" $2
	for (j = 1; j <= numF; ++j) {
		i = 0
		if (inf[$(p1[j])]==1)
			i +=1
		if (inf[$(p2[j])]==1)
			i +=2
		s = s "\t" i
 	}
	print s
}
