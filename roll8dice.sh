#!/bin/bash
#
# Script that rolls n dice and sums their output, m times.
echo "How many rolls?"
read rolls
# Check if input is integer only
if ! [[ "$rolls" =~ ^[0-9]+$ ]]
    then
        echo "Sorry, integers only"
        exit 1
fi
echo "How many dice?"
read dice
# Check if input is integer only
if ! [[ "$dice" =~ ^[0-9]+$ ]]
    then
        echo "Sorry, integers only"
        exit 1
fi
echo "-"
SECONDS=0
for (( rolltimes=1; rolltimes<=$rolls; rolltimes++))
do
   for (( dicenumber=1; dicenumber<=$dice; dicenumber++))
      do
         rolled=$(( ( $RANDOM % 6 ) + 1 ))
         sum=$(( sum + rolled ))
         #echo $rolled
      done
   #echo "-"
   #echo $sum
   eval "total$sum=$((total$sum+1))"
   # Clear $sum
   unset sum
done
 
# Output the total of sums
for (( result=$dice; result<=$dice*6; result++ ))
do
   echo "Result "$result": "$((total$result))
done
echo "-"
echo "Elapsed time: "$SECONDS" seconds."
