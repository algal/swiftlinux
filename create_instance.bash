#!/bin/bash

# Creates an AWS Ubuntu instance with a large drive
#
# Requires:
# - you have configured the key-name and security_groups variables below
# - you have the AWS command line tool installed
# - you have python3 installed

set -e

# Configs: set these based on your AWS settings

# name of an already created AWS key pair
key_name=bespoke-alexis
# string with space-separated security group names
security_groups="sshable moshable https default"

# implementation

# Ubuntu 16 as of 2019-02-09T1651
aws_ami_id=ami-0f26d4c9992650142
instance_type=c4.8xlarge

run_instances_output=$(
    aws ec2 run-instances \
        --instance-type $instance_type \
        --block-device-mapping "[ { \"DeviceName\": \"/dev/sda1\", \"Ebs\": { \"VolumeSize\": 64 } } ]" \
        --image-id $aws_ami_id \
        --key-name $key_name \
        --security-groups $security_groups
                    )

instance_id=$(echo $run_instances_output \
                  | python3 -c 'import sys, json; print(json.load(sys.stdin)["Instances"][0]["InstanceId"])'
           )

echo "Created:          $instance_id"

# we blithely assume it will be assigned a public DNS name within 10 seconds
sleep 10

instance_public_dns_name=$(
    aws ec2 describe-instances --instance-ids "$instance_id" | python3 -c 'import sys, json; print(json.load(sys.stdin)["Reservations"][0]["Instances"][0]["PublicDnsName"])'
)

echo "PublicDnsName:    $instance_public_dns_name"
echo ""
echo "To connect to the instance:"
echo ""
echo "  ssh -i ~/.ssh/bespoke_identity -L localhost:8888:localhost:8888 -l ubuntu $instance_public_dns_name"
echo ""
