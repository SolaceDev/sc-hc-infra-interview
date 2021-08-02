#!/bin/sh

command=$1

terraform_version=`terraform version`
terraform_version_grep=$(echo $terraform_version | grep '^Terraform ' | sed -r 's/^Terraform v(.*)$/\1/')

if [ "$terraform_version_grep" != "0.12.24" ]; then
  echo "Incorrect version of Terraform on local workstation"
  exit
fi

if [[ "$1" = "help" ]]; then
  echo "This is how you use this script..."
fi

if [ -d $HOME/sc-hc-infra ]; then
  source $HOME/sc-hc-infra/defaults.rc
fi

if [[ ${AWS_ACCESS_KEY_ID+x} != "x" ]]; then
  echo -n "Enter the AWS Access Key ID: "
  read AWS_ACCESS_KEY_ID

  export AWS_ACCESS_KEY_ID
fi

if [[ ${AWS_SECRET_ACCESS_KEY+x} != "x" ]]; then
  echo -n "Enter the AWS Secret Access Key: "
  read AWS_SECRET_ACCESS_KEY

  export AWS_SECRET_ACCESS_KEY
fi

if [[ "$command" = "plan" ]]; then
  terraform plan
fi

if [[ "$command" = "apply" ]]; then
  terraform apply
fi

if [[ $command = "destroy" ]]; then
  terraform destroy
fi
