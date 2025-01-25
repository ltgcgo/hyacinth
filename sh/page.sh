#!/bin/bash
# Build HTML files
if [ -f "$(which minify)" ]; then
	minify --type html --html-keep-document-tags --html-keep-quotes -o "dist/${1}.htm" "web/${1}/index.htm"
else
	echo -e "\033[1;31mError\033[0m: tdewolff-minify is not available. Will copy the file directly."
	cp -pv "web/${1}/index.htm" "dist/${1}.htm"
fi
exit