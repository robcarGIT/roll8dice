#!/bin/bash
#
# Script that rolls n dice and sums their output, m times.
# Do 10 rolls
echo "How many rolls?"
read rolls
echo "How many dice?"
read dice

for (( rolltimes=1; rolltimes<=$rolls; rolltimes++))
#for rolltimes in {1..1000000}
do
   #for i in {1..8}
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
#for result in {8..48}
do
   echo "Result "$result": "$((total$result))
done

