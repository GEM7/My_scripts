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

[[ `command -v mtr` ]] && echo "mtr already installed" || apt-get install -y mtr
if [[ $(crontab -l | egrep -v "^(#|$)" | grep -q 'bash /root/mtrr/mtrServer.sh'; echo $?) == 1 ]]
then
    echo $(crontab -l ; echo '0 12 * * * bash /root/mtrr/mtrServer.sh') | crontab -
fi

if [ -f ${RESULT} ];then
    if [ $( cat ${RESULT} | grep `date +%y.%m.%d` | wc -c ) -eq 0 ];then
        printf "Date:\t`date +%y.%m.%d`\n" >> ${RESULT}
        printf "=====================\n" >> ${RESULT}
    else
        exit 0;
    fi
else
    printf "Date:\t`date +%y.%m.%d`\n" >> ${RESULT}
    printf "=====================\n" >> ${RESULT}
fi

for i in ${!IP[@]};do
    if [ `mtr -nTr ${IP[i]} | grep "59.43" |wc -c` -ne 0 ];then
        printf "%-6s | %-6s | %-6s\n" "${ISP[i]}" "ON" "CN2 " >> ${RESULT}
    else
        printf "%-6s | %-6s | %-6s\n" "${ISP[i]}" "OFF" "CN2 " >> ${RESULT}
    fi
done

exit 0;
