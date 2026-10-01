#!/bin/bash

#!/bin/bash

# ============================================
# Cleanup Script - Destroy all created resources
# ============================================

REGION="us-east-2"
KEY_NAME="MyKeyPair"
SG_NAME="mysg"

echo "Starting cleanup of all resources..."
echo "======================================"

# Step 1: Get Instance IDs by Name tags
echo "Fetching Instance IDs..."
INSTANCE_ID1=$(aws ec2 describe-instances \
    --filters "Name=tag:Name,Values=web01" \
              "Name=instance-state-name,Values=running,stopped,pending" \
    --query "Reservations[0].Instances[0].InstanceId" \
    --output text \
    --region $REGION)

INSTANCE_ID2=$(aws ec2 describe-instances \
    --filters "Name=tag:Name,Values=web02" \
              "Name=instance-state-name,Values=running,stopped,pending" \
    --query "Reservations[0].Instances[0].InstanceId" \
    --output text \
    --region $REGION)

echo "web01 Instance ID: $INSTANCE_ID1"
echo "web02 Instance ID: $INSTANCE_ID2"

# Step 2: Terminate EC2 Instances
echo ""
echo "Terminating EC2 instances..."
aws ec2 terminate-instances \
    --instance-ids $INSTANCE_ID1 $INSTANCE_ID2 \
    --region $REGION

echo "Waiting for instances to terminate..."
aws ec2 wait instance-terminated \
    --instance-ids $INSTANCE_ID1 $INSTANCE_ID2 \
    --region $REGION

echo "Instances terminated successfully!"

# Step 3: Delete Security Group
echo ""
echo "Deleting security group: $SG_NAME..."
SG_ID=$(aws ec2 describe-security-groups \
    --filters "Name=group-name,Values=$SG_NAME" \
    --query "SecurityGroups[0].GroupId" \
    --output text \
    --region $REGION)

aws ec2 delete-security-group \
    --group-id $SG_ID \
    --region $REGION

echo "Security group $SG_NAME ($SG_ID) deleted!"

# Step 4: Delete Key Pair
echo ""
echo "Deleting key pair: $KEY_NAME..."
aws ec2 delete-key-pair \
    --key-name $KEY_NAME \
    --region $REGION

# Also remove the local .pem file if it exists
if [ -f "$KEY_NAME.pem" ]; then
    rm -f $KEY_NAME.pem
    echo "Local key file $KEY_NAME.pem deleted!"
fi

echo "Key pair $KEY_NAME deleted!"

# Step 5: Confirm all resources are cleaned up
echo ""
echo "======================================"
echo "Cleanup Complete! Summary:"
echo "======================================"
echo "Terminated Instances : $INSTANCE_ID1, $INSTANCE_ID2"
echo "Deleted Security Group: $SG_NAME ($SG_ID)"
echo "Deleted Key Pair      : $KEY_NAME"
echo "======================================"

