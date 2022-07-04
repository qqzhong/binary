while read -r line;
do
	file=$(basename ${line});
	echo ${file} | awk -F'.' '{print $1}';
done < modified.json
