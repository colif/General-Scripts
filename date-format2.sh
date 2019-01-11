echo "Reformat 3rd column. i.e. 6/30/2004 0:00  to 2004-30-6 0:00";
# NR - skip lines, Tab separated file
# https://www.gnu.org/software/gawk/manual/gawk.html
for f2 in *.txt
do awk -F"\t" 'BEGIN{f2[1]=3; regex="[^/: ]+" }
         NR>0{
                 for (i in f2){
                 patsplit($f2[i], a, regex)
                 b="%s-%s-%s %s:%s"
                 $f2[i]=sprintf(b,a[3],a[1],a[2],a[4],a[5])
             }
     } 1' OFS="\t" "$f2" > ./out2/"$f2"
done
