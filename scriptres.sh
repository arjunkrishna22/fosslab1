pdftotext -layout results1.pdf s1.txt
pdftotext -layout results2.pdf s2.txt

cut  -f4,5 c4b.txt>cs4b.txt
awk '{ print($1,$2,$3)}' cs4b.txt >c4b1.txt
tr -d '\040\012'<s1.txt>s1t.txt
tr -d '\040\012'<s2.txt>s2t.txt
sed -i 's/MDL16CS/\nMDL16CS/g' s1t.txt
sed -i 's/MDL16CS/\nMDL16CS/g' s2t.txt
sed -i 's/TCE16CS/\nTCE16CS/g' s1t.txt
sed -i 's/TCE16CS/\nTCE16CS/g' s2t.txt
sed -i 's/ELECTRONICSANDBIOMEDICAL/\nELECTRONICSANDBIOMEDICAL/g' s1t.txt
sed -i 's/ELECTRONICSANDBIOMEDICAL/\nELECTRONICSANDBIOMEDICAL/g' s2t.txt
grep 'MDL16CS' s1t.txt >s11.txt       
grep 'MDL16CS' s2t.txt >s21.txt
grep 'MDL16CS' c4b1.txt >c4bf.txt
sed -i 's/MA101/  :Ma101/g' s11.txt
sed -i 's/CY100/  :CY100/g' s21.txt
join  c4bf.txt s11.txt>joins1.txt
join  c4bf.txt s21.txt>joins2.txt
column -t -s $':' joins1.txt >joins11.txt
column -t -s $':' joins2.txt >joins21.txt
sed -i 's/(O)/ 10/g' joins21.txt
sed -i 's/(A+)/ 9/g' joins21.txt
sed -i 's/(A)/ 8.5/g' joins21.txt
sed -i 's/(B+)/ 8/g' joins21.txt
sed -i 's/(B)/ 7/g' joins21.txt
sed -i 's/(C)/ 6/g' joins21.txt
sed -i 's/(P)/ 5/g' joins21.txt
sed -i 's/(F)/ 0/g' joins21.txt
sed -i 's/CY100/  4/g' joins21.txt
sed -i 's/MA102/4/g' joins21.txt
sed -i 's/BE100/4/g' joins21.txt
sed -i 's/BE102/3/g' joins21.txt
sed -i 's/EC100/3/g' joins21.txt
sed -i 's/CS100/ 3/g' joins21.txt
sed -i 's/,CS120/ 1/g' joins21.txt
sed -i 's/EC110/1/g' joins21.txt
sed -i 's/CY110/1/g' joins21.txt
sed -i 's/,/ /g' joins21.txt
sed -i 's/(O)/ 10/g' joins11.txt
sed -i 's/(A+)/ 9/g' joins11.txt
sed -i 's/(A)/ 8.5/g' joins11.txt
sed -i 's/(B+)/ 8/g' joins11.txt
sed -i 's/(B)/ 7/g' joins11.txt
sed -i 's/(C)/ 6/g' joins11.txt
sed -i 's/(P)/ 5/g' joins11.txt
sed -i 's/(F)/ 0/g' joins11.txt
sed -i 's/Ma101/4/g' joins11.txt
sed -i 's/PH100/4/g' joins11.txt
sed -i 's/BE110/3/g' joins11.txt
sed -i 's/BE10105/3/g' joins11.txt
sed -i 's/BE103/3/g' joins11.txt
sed -i 's/EE100/3/g' joins11.txt
sed -i 's/PH110/1/g' joins11.txt
sed -i 's/EE110/1/g' joins11.txt
sed -i 's/CS110/ 1/g' joins11.txt
sed -i 's/,/ /g' joins11.txt
awk '{ print ($1" "$2" "$3":"($4 * $5 + $6 * $7 + $8* $9 + $10 * $11 + $12 * $13 + $14 * $15 + $16 * $17 + $18 * $19 + $20 * $21) /23) }' joins11.txt>s1sgpa1.txt
awk '{ print ($1" "$2" "$3":"($4 * $5 + $6 * $7 + $8* $9 + $10 * $11 + $12 * $13 + $14 * $15 + $16 * $17 + $18 * $19 + $20 * $21) /23) }' joins21.txt>s2sgpa1.txt
column -t -s $':' s1sgpa1.txt > s1sgpa.txt
column -t -s $':' s2sgpa1.txt > s2sgpa.txt
cut -d ':' -f2 s2sgpa1.txt>s2sgpa3.txt
paste s1sgpa.txt s2sgpa3.txt |awk '{ print ($1" "$2" "$3"  :"($4*23 + $5*24) /47) }'|column -t -s $':'>cgpa.txt
cat cgpa.txt
