#!/bin/bash
input="links.txt"
while IFS= read -r line
do
  wget "$line"
done < "$input"
