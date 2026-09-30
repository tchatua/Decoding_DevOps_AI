#!/bin/bash 

# Get your public IP
MY_IP=$(curl -s https://checkip.amazonaws.com)

# Get default VPC ID
VPC_ID=$(aws ec2 describe-vpcs \
    --filters "Name=isDefault,Values=true" \
    --query "Vpcs[0].VpcId" \
    --output text)

# Create security group
SG_ID=$(aws ec2 create-security-group \
    --group-name mysg \
    --description "Security group with SSH from my IP and HTTP from anywhere" \
    --vpc-id $VPC_ID \
    --query 'GroupId' \
    --output text)

# Add SSH rule from your IP only
aws ec2 authorize-security-group-ingress \
    --group-id $SG_ID \
    --protocol tcp \
    --port 22 \
    --cidr ${MY_IP}/32

# Add HTTP rule open to anywhere
aws ec2 authorize-security-group-ingress \
    --group-id $SG_ID \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

echo "Security group $SG_ID created successfully!"
