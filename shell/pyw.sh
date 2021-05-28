#!/bin/bash
week=`date +"%V"`
numWeeks=`date -v12m -v31d +"%V"`
percent=`echo "scale=2; ${week}/${numWeeks}" | bc`
percent=`echo "${percent}*100" | bc`
percent=`printf "%.0f\n" $percent`
echo "**${percent}%** - ${week}/${numWeeks}"
