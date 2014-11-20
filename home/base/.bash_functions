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

function unpack() {
	if test ! "$1"
	then
		printf "Usage: unpack <file> [<file> ...]\n" 1>&2
		return 1
	fi

	while test "$1"
	do
		local base
		local file
		local filebasename
		local target
		local basedir="."
		local LIST
		local UNPACK
		file="$1"
		shift

		case $file in
			*.tgz)
				filebasename=${file%%.tgz}
				LIST="tar ztf"
				UNPACK="tar xzf"
				;;
			*.tbz)
				filebasename=${file%%.tbz}
				LIST="tar jtf"
				UNPACK="tar xjf"
				;;
			*.tar.gz)
				filebasename=${file%%.tar.gz}
				LIST="tar ztf"
				UNPACK="tar xzf"
				;;
			*.tar.bz)
				filebasename=${file%%.tar.bz}
				LIST="tar jtf"
				UNPACK="tar xjf"
				;;
			*.tar.bz2)
				filebasename=${file%%.tar.bz2}
				LIST="tar jtf"
				UNPACK="tar xjf"
				;;
			*.zip)
				filebasename=${file%%.zip}
				LIST="unzip -Z1"
				UNPACK="unzip -qq"
				;;
			*.tar)
				filebasename=${file%%.tar}
				LIST="tar tf"
				UNPACK="tar xf"
				;;
			*)
				printf "Unknown extension for %b!\n" "$file" 1>&2
				return 1
		esac

		if test ! -r "$file"
		then
			printf "File not found or unreadable: %b\n" "$file" 1>&2
			return 1
		fi

		for line in $($LIST "$file")
		do
			test ! "$base" && base="$item"
			test "${item#$base}" != "$item" && continue
			basedir="$filebasename"
			break
		done

		target="$basedir"
		if test "$target" = "."
		then
			printf "Extracting $file in $base\n"
			$UNPACK "$file"
		else
			local n=0
			while test -e "$target"
			do
				n=$((n+1))
				target="$basedir.$n"
			done
			mkdir "$target"
			printf "Extracting $file in $target/\n"
			(cd "$target" && $UNPACK "../$file")
		fi
	done
}
