

function gend {
  git add .
  git commit -m "$1"
  git push
}

function condae {
  echo "Activating conda environment $1"
  conda activate $1
}

# Returncode.
function returncode
{
  returncode=$?
  if [ $returncode != 0 ]; then
    echo "[$returncode]"
  else
    echo ""
  fi
}


### AWS Stuff

function instances
{
  aws ec2 describe-instances \
    --filters Name=tag-key,Values=Name  \
    --query "Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key=='Name']|[0].Value,IP:NetworkInterfaces[0].PrivateIpAddress,State:State.Name}" --output table
}