#!/bin/bash
echo "Enter AWS Access Key ID"
read access_key
export AWS_ACCESS_KEY_ID=$(echo $access_key)
echo "Enter AWS Secret Access Key"
read secret_key
export AWS_SECRET_ACCESS_KEY=$(echo $secret_key)
echo "Enter AWS region e.g. - ap-south-1"
read region
export AWS_DEFAULT_REGION=$(echo $region)
echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY
echo $AWS_DEFAULT_REGION
echo "Please Confirm y/n"
read confirm
echo $confirm
if [ "$confirm" = "y" ] | [ "$confirm" = "Y" ]; then
	echo "Condition True...Its Working! Great :)"
else
	echo "Condition False"
