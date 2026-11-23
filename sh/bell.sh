#!/bin/bash
exit # Not ready yet, and may never be unless rewritten.
if type -P deno >/dev/null 2>&1; then
	deno run --allow-all ( "$@" )
elif type -P bun >/dev/null 2>&1; then
	bun ( "$@" )
elif type -P node >/dev/null 2>&1; then
	node --enable-source-maps ( "$@" )
	#node --enable-source-maps --import deno/bell/belladona.mjs ( "$@" )
else
	echo "No JS runtime detected."
	exit 1
fi
exit