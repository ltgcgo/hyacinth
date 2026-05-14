#!/bin/bash
if [ "$1" == "" ]; then
	echo "Available targets:"
	ls -1 css | while IF= read -r folder; do
		if [ -f "css/$folder/index.css" ]; then
			echo "- $folder (normal)"
		fi
	done
	exit
fi
# Build CSS files
if [ -f "$(which lightningcss)" ]; then
	lightningcss --bundle ${2:---minify --sourcemap} $3 "css/${1}/index.css" -o "dist/${1}.css"
elif [ "$(shx esbuild 2>&1 >/dev/null;echo $?)" == "0" ]; then
	if [ "$IS_BUILD" == "" ]; then
		esbuild --log-level=info --log-limit=0 --charset=utf8 --bundle ${2:---minify --sourcemap} $3 "css/${1}/index.css" --outfile="dist/${1}.css" --watch
	else
		esbuild --log-level=warning --log-limit=0 --charset=utf8 --bundle ${2:---minify --sourcemap} $3 "css/${1}/index.css" --outfile="dist/${1}.css"
	fi
else
	echo -e "\033[1;31mError\033[0m: LightningCSS is not available."
fi
exit