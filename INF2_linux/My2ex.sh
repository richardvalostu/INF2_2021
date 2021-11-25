#!/bin/bash
adresa=$(pwd)
menoAutora="El Cid"
sed 's/\\author{.*}/\\author{'"$menoAutora"'}/g' "$adresa/HWspec.tex" > "$adresa/HWspecFinal.tex"
sed -i 's/ *:[^\/].*$/:/g' "$adresa/HWspecFinal.tex"
PCman=$(sudo dmidecode -s baseboard-manufacturer)
sed -i 's/PC Manufacturer:/PC Manufacturer: '"$PCman"'/g' "$adresa/HWspecFinal.tex"
PCmodel=$(sudo dmidecode -s system-product-name)
sed -i 's/PC Model:/PC Mocdel: '"$PCmodel"'/g' "$adresa/HWspecFinal.tex"

#sed -i 's/itemize/description/1' "$adresa/HWspecFinal.tex"
echo -n "Enter a number: "
cislo_ROT=$(cat /sys/block/sda/queue/rotational)

if [[ $cislo_ROT -eq 0 ]]
then
  	DiskTyp="SSD"
else 
	DiskTyp="HDD"
fi

sed -i 's/Disk Type:/Disk Type: '"$DiskTyp"'/g' "$adresa/HWspecFinal.tex"

pdflatex "$adresa/HWspecFinal.tex"
xdg-open "$adresa/HWspecFinal.pdf"
