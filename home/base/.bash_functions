function hextobin () {
	if [ "$#" -ne 2 ]; then
		echo Please provide two arguments: input txt file, and output bin file
		return 1
	fi
	if [ ! -f "$1" ]; then
		echo File not found: $1
		return 1
	fi
	sed -e 's/#.*$//' <"$1" | tr "[:blank:]" "\n" | sed '/^$/d' | xxd -c 1 -r -p >"$2"
}
