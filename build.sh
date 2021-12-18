#/bin/bash

MAIN_BRACH=main
SCAFFOLD_DIR=scaffold

if [[ $# -eq 0 ]] ; then
    echo 'Pass new_name as first argument'
    exit 0
else
  PROGRAM_NAME=$1
fi

echo "/$SCAFFOLD_DIR" >> .gitignore

REPO_NAME=${REPO_NAME:-"docker-$PROGRAM_NAME"}

echo $REPO_NAME

mkdir -p $SCAFFOLD_DIR

git checkout -q $MAIN_BRACH .github && mv .github/ $SCAFFOLD_DIR/

git checkout -q $MAIN_BRACH Dockerfile && mv Dockerfile $SCAFFOLD_DIR/

git checkout -q $MAIN_BRACH README.md && echo `cat README.md`