rootDir=$1
##echo `find $1 -name "_tex.sc"`
##find $1 -name "*_tex.sc"
##files=`find $1 -name "_tex.sc"`
##while IFS= read -r line
##do
##	echo $line
##done < <(printf '%s\n' "$files")
for file in `find $1 -name "*_tex.sc"`
do
    python3 dumpsc.py "$file"
	mv "$file" "${file}.bak"
done

for file in `find $1 -name "*.sc"`
do
    python3 dumpsc.py "$file" --old
done

for file in `find $1 -name "*.csv"`
do
    python3 dumpsc.py "$file"
done
