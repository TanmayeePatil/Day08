#!/bin/bash

#echo "How many time you want to roll dice:"
#read num

echo "Repeat till any one of the numbers has reached x times:"
read xTime

declare -A dictDice
count=1
i=1

#for i in `seq $num`
#do
#  echo "Rolling dice $i th time... "
#  myVar=$(( ( RANDOM % 6 )  + 1 ))
#  echo "Result: $myVar"
#  echo -e "Storing result in Dictonary\n"
#  dictDice[$i]=$myVar
#done

while [ $count -lt $xTime ]
do
  echo "Rolling dice $i th time... "
  myVar=$(( ( RANDOM % 6 )  + 1 ))
  echo "Result: $myVar"
  echo -e "Storing result in Dictonary\n"
  dictDice[$i]=$myVar
  ((i++))
  count=`printf '%d\n' "${dictDice[@]}" | sort -n | uniq -c | sort -n | tail -1 | awk -F" " '{print $1}'`
done

echo "All Dice result value:" ${dictDice[@]}
echo "All Dice result Key:" ${!dictDice[@]} #All Keys

echo -e "\nNumber that reached maximum times:"
printf '%d\n' "${dictDice[@]}" | sort -n | uniq -c | sort -n | tail -1

echo "Number that reached minimum times:"
printf '%d\n' "${dictDice[@]}" | sort -n | uniq -c | sort -n | head -n 1
