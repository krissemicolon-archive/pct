#!/bin/sh
PROJECT_PATH="$HOME/Projects"
TEMPLATE_PATH="$HOME/Documents/template"

# INPUT
printf "Enter Project Name: "
read -r PROJECT_NAME
mkdir $PROJECT_PATH/$PROJECT_NAME
cd $PROJECT_PATH/$PROJECT_NAME
git init
printf "Enter Language File Extension: "
read -r FILE_EXTENSION
printf "Create GitHub Repository? (y/n): "
read -r GHREPO
if [ $GHREPO = "y" ]; then
    gh repo create
fi
printf "Open in Editor? (y/n): "
read -r OPEN_EDITOR

# LOGIC
cp -r $TEMPLATE_PATH/* $PROJECT_PATH/$PROJECT_NAME
echo "<h1 align=\"center\">$PROJECT_NAME<h1>" >> $PROJECT_PATH/$PROJECT_NAME/README.md
touch src/main.$FILE_EXTENSION
if [ $OPEN_EDITOR = "y" ]; then
	vim .
fi
