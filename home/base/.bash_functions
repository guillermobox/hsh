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

function color () {
	set="$1"
	color="$2"

	if test -z "$set"
	then
		echo "Usage: color <set> <red|green|yellow|blue>[bold]"
		return 1
	fi

	case "$color" in
	red)     colorspec=31 ;;
	green)   colorspec=32 ;;
	yellow)  colorspec=33 ;;
	blue)    colorspec=34 ;;
	*) colorspec=0 ;;
	esac

	case "$color" in
	*bold)   colorspec="${colorspec};1"
	esac

	case "$set" in
	c)       filespec="*.c=${colorspec}:*.h=${colorspec}" ;;
	python)  filespec="*.py=${colorspec}" ;;
	reset)   export LS_COLORS="${LS_COLORS_BASE}"; return 0 ;;
	esac

	export LS_COLORS="${LS_COLORS}:${filespec}"
}
