#!/bin/bash 

# Get Security Group ID
SG_ID=$(aws ec2 describe-security-groups \
    --filters "Name=group-name,Values=mysg" \
    --query "SecurityGroups[0].GroupId" \
    --output text \
    --region us-east-2)

# Get Subnet ID from default VPC
SUBNET_ID=$(aws ec2 describe-subnets \
    --filters "Name=defaultForAz,Values=true" \
    --query "Subnets[0].SubnetId" \
    --output text \
    --region us-east-2)

# Launch EC2 instance
INSTANCE_ID1=$(aws ec2 run-instances \
    --image-id ami-04b3f3bf99ec556c1 \
    --instance-type t2.micro \
    --key-name MyKeyPair \
    --security-group-ids $SG_ID \
    --subnet-id $SUBNET_ID \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=web01}]' \
    --region us-east-2 \
    --query 'Instances[0].InstanceId' \
    --output text)

# Launch EC2 instance
INSTANCE_ID2=$(aws ec2 run-instances \
    --image-id ami-04b3f3bf99ec556c1 \
    --instance-type t2.micro \
    --key-name MyKeyPair \
    --security-group-ids $SG_ID \
    --subnet-id $SUBNET_ID \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=web02}]' \
    --region us-east-2 \
    --query 'Instances[0].InstanceId' \
    --output text)

echo "Instance launched: $INSTANCE_ID1"
echo "Instance launched: $INSTANCE_ID2"
