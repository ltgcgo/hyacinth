#!/bin/bash
if [ "$1" == "" ]; then
	echo "Available targets:"
	ls -1 web | while IF= read -r folder; do
		if [ -f "web/$folder/index.htm" ]; then
			echo "- $folder (normal)"
		fi
	done
	exit
fi
# Build HTML files
if [ -f "$(which minify)" ]; then
	if [ "$IS_BUILD" == "" ] ; then
		minify --type html ${2:---html-keep-document-tags --html-keep-quotes} -w -o "dist/${1}.htm" "web/${1}/index.htm"
	else
		minify --type html ${2:---html-keep-document-tags --html-keep-quotes} -o "dist/${1}.htm" "web/${1}/index.htm"
	fi
else
	echo -e "\033[1;31mError\033[0m: tdewolff-minify is not available. Will copy the file directly."
	cp -pv "web/${1}/index.htm" "dist/${1}.htm"
fi
exit