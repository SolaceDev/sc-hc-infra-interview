#!/bin/sh

if [[ "$1" = "help" ]]; then
  echo "This is how you use this script..."
fi

echo -n "Enter the AWS Access Key ID: "
read AWS_ACCESS_KEY_ID

export AWS_ACCESS_KEY_ID

echo -n "Enter the AWS Secret Access Key: "
read AWS_SECRET_ACCESS_KEY

export AWS_SECRET_ACCESS_KEY

if [[ "$1" = "plan" ]]; then
  terraform plan
fi

if [[ "$1" = "apply" ]]; then
  terraform apply
fi

if [[ $1 = "destroy" ]]; then
  terraform destroy
fi
