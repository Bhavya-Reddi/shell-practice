#!/bin/bash

AMI_ID="09c813fb71547fc4f"
SG_ID="sg-0220111a6044e051a" # replace with my sg id

for instance in $@
do
   INSTANCE_ID=$(aws ec2 run-instances --image-id ami-09c813fb71547fc4f --instance-type t3.micro --security-group-ids sg-0220111a6044e051a --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=$instance}]' --query 'Instances[0].InstanceID' --output text)

   #get private IP
   if [ $instance != "fronted" ]; then
       IP=$(aws ec2 describe-instances --instance-ids i-060189197a6c4bf63 --query 'Reservations[0].Instances[0].PrivateIpAddress' --output text)
   else
       IP=$(aws ec2 describe-instances --instance-ids i-060189197a6c4bf63 --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
   fi

   echo "$instance: $IP"
done