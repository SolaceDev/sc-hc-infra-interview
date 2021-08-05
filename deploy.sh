#!/bin/sh

if [[ "$1" = "help" ]]; then
  echo "This is how you use this script..."
fi

export AWS_ACCESS_KEY_ID="AKIARGVNRBIM7D6FEM9S"
export AWS_SECRET_ACCESS_KEY="jDR6agy7SeUt7uN1ATEg+tboZObG5IfEKAGn9tRt"

if [[ "$1" = "plan" ]]; then
  terraform plan
fi

if [[ "$1" = "apply" ]]; then
  terraform apply
fi

if [[ $1 = "destroy" ]]; then
  terraform destroy
fi
