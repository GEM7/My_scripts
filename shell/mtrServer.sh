#!/bin/bash
GN="\033[32m"
END="\033[0m"

RESULT="./mtrresult.txt"

IP=(
    "211.136.150.66"
    "210.22.70.3"
    "202.96.209.133"
    "202.121.48.100"
    "39.100.15.5"
    )
ISP=(
    "Mob"
    "Uni"
    "Tel"
    "Edu"
    "Ali"
)

if [ $( cat ${RESULT} | grep `date +%y.%m.%d` | wc -c ) -eq 0 ];then
printf "Date:\t`date +%y.%m.%d`" >> ${RESULT}
printf "-----------------------" >> ${RESULT}
fi

for i in ${!IP[@]};do
    if [ `mtr -nTr ${IP[i]} | grep "59.43" |wc -c` -ne 0 ];then
        printf "${ISP[i]}:\tON\tCN2\n" >> ${RESULT}
    else
        printf "${ISP[i]}:\tOFF\tCN2\n" >> ${RESULT}
    fi
done

exit 0;