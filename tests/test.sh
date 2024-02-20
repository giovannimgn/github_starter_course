#!/bin/bash

BRANCH_NAME='issue1'
TAG_NAME='1.0'
FILE_NAME='test.txt'

# Check if branch exists
if git rev-parse --verify $BRANCH_NAME > /dev/null 2>&1; then
  echo "Branch $BRANCH_NAME found"
else
  echo "Branch $BRANCH_NAME not found. Exiting."
  exit 1
fi

# Check if tag exists on main branch
if git rev-list $TAG_NAME > /dev/null 2>&1; then
  echo "Tag $TAG_NAME found."
else
  echo "Tag $TAG_NAME not found. Exiting."
  exit 1
fi

# Check if file exists in $BRANCH_NAME
git switch $BRANCH_NAME
if [ -e $FILE_NAME ]; then
  echo "File $FILE_NAME found. All done correctly! Well done!"
  exit 0
else
  echo "File $FILE_NAME not found. Exiting."
  exit 1
fi
