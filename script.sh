#!/bin/bash

region="us-west-1"
vpc_cidr="10.0.0.0/16"
subnet1_cidr="10.0.1.0/24"

vpc_id=$(aws ec2 create-vpc --cidr-block $vpc_cidr --region $region  --query Vpc.VpcId --output text)
aws ec2 create-subnet --vpc-id $vpc_id  --cidr-block $subnet1_cidr --region $region   
igw_id=$(aws ec2 create-internet-gateway --region $region  --query InternetGateway.InternetGatewayId --output text)
aws ec2 attach-internet-gateway --vpc-id $vpc_id --internet-gateway-id $igw_id --region $region  