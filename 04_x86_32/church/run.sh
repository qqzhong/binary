# This file is generated automatically by example.sh
# @date: Tue 08 Feb 2022 01:08:05 PM HKT

ELF="$*"
COUNT=2
if [ 0 -eq $# ]; then
	for ((i = 1; i <= COUNT; i++))
	do
		align=$(printf "%02d" ${i})
		"$(pwd)/example${align}"
	done
else
	"$(pwd)/${ELF}"
fi
