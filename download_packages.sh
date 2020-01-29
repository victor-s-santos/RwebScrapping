#!/bin/bash
N=0
input="links2.txt"
while IFS= read -r line
do
  wget "$line"
  N=$((N + 1))
  if [ $N == 10 ]
  then 
    sleep 10
    N=0
  fi
done < "$input"
