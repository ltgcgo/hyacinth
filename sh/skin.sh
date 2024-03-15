#!/bin/bash
if [ -f "$(which lightningcss)" ]; then
	lightningcss --bundle ${2:--m --sourcemap} $3 "css/${1}/index.css" -o "dist/${1}.css"
else
	echo -e "\033[1;31mError\033[0m: LightningCSS is not available."
fi
exit