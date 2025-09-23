#!/bin/bash

#EVERYTHING IN SHELL IS CONSIDERD AS STRING
NUMBER1=100
NUMBER2=200
NAME=devops 

SUM=$(($NUMBER1+NUMBER2+NAME))

echo "sum is : ${sum}"

LEADERS=("Modi" "putin" "Trudo" "Trump")

echo "all leaders: ${LEADERS[@]}