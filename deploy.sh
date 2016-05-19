#!/bin/sh
# use this file to deploy the dist file to github pages (must first build by running 'gulp').
# run using the following command: './deploy.sh dist', where dist is the name of the folder containing the website
echo "deploying to github pages"
if [ -z "$1" ]
then
  echo "Which folder do you want to deploy to GitHub Pages?"
  exit 1
fi
git subtree push --prefix $1 origin gh-pages
