# This file is generated automatically by example.sh
# @date: Tue 08 Feb 2022 01:08:05 PM HKT

clang-format-11 -i asm.h
COUNT=12
for ((i = 1; i <= COUNT; i++))
do
	align=$(printf "%02d" ${i})
	echo example"${align}".S
	trim_files.bash example"${align}".S
done
