#!/bin/bash
N=0
input="links.txt"
while IFS= read -r line
do
  echo "$line"
  N=$((N + 1))
  if [ $N == 10 ]
  then 
    sleep 20
    N=0
  fi
done < "$input"
