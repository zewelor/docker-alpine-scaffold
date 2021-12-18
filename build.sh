#/bin/bash

MAIN_BRACH=main
SCAFFOLD_DIR=scaffold

if [[ $# -eq 0 ]] ; then
    echo 'Pass new_name as first argument'
    exit 0
else
  PROGRAM_NAME=$1
fi

if ! grep -q "/$SCAFFOLD_DIR" .gitignore; then
  echo "/$SCAFFOLD_DIR" >> .gitignore
fi

REPO_NAME=${REPO_NAME:-"docker-$PROGRAM_NAME"}

export PROGRAM_NAME=$PROGRAM_NAME
export REPO_NAME=$REPO_NAME
export $(cat .env | xargs)

echo "New repo name: '$REPO_NAME'. Set it up here: https://github.com/new"

mkdir -p $SCAFFOLD_DIR

git checkout -q $MAIN_BRACH .github && mv .github/ $SCAFFOLD_DIR/

git checkout -q $MAIN_BRACH Dockerfile && mv Dockerfile $SCAFFOLD_DIR/

git checkout -q $MAIN_BRACH README.md && envsubst < README.md > $SCAFFOLD_DIR/README.md && rm README.md

cd $SCAFFOLD_DIR
git init -q
