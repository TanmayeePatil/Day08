#!/bin/bash

declare -A dictBirth

function checkMonth
{

myMonth=$1

if [ $myMonth == 1 ];then
       birthMonth="Jan"
  elif [ $myMonth == 2 ];then
       birthMonth="Feb"
  elif [ $myMonth == 3 ];then
       birthMonth="Mar"
  elif [ $myMonth == 4 ];then
       birthMonth="Apr"
  elif [ $myMonth == 5 ];then
       birthMonth="May"
  elif [ $myMonth == 6 ];then
       birthMonth="June"
  elif [ $myMonth == 7 ];then
       birthMonth="July"
  elif [ $myMonth == 8 ];then
       birthMonth="Aug"
  elif [ $myMonth == 9 ];then
       birthMonth="Sept"
  elif [ $myMonth == 10 ];then
       birthMonth="Oct"
  elif [ $myMonth == 11 ];then
       birthMonth="Nov"
  elif [ $myMonth == 12 ];then
       birthMonth="Dec"
fi
echo $birthMonth
}


echo "Number of individulas:"
read n

echo "Generating a birth birthMonth of $n individulas-"

for i in `seq $n`
do
  myMonth=$((RANDOM%12+1))
  myBirthMonth=$(checkMonth $myMonth)
  dictBirth[$i]="$myBirthMonth"
done

echo -e "\nRecords:"
for k in "${!dictBirth[@]}"
do
  echo $k "==>" ${dictBirth["$k"]}
done | sort -n -k3

echo -e "\nEnter month:"
read givenMonth

echo -e "\nFinding all individuals having birthdays in the $givenMonth month: "
for j in `seq $n`
do
  individual=${dictBirth[$j]}
  if [[ $individual == $givenMonth ]];then
   echo "$j ==> $givenMonth"
  fi
done
