

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