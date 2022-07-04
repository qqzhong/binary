# This file is generated automatically by example.sh
# @date: Tue 08 Feb 2022 01:08:05 PM HKT

run(){
	ELF="$*"
	[ -f "${ELF}" ] || { echo "${ELF}: No such file or directory"; exit 0; }
	adb devices | awk '{if("device"==$2){print $1}}' | while read -r device
	do
		echo "run ${ELF} on ${device}"
		export ANDROID_SERIAL="${device}"
		adb push "${ELF}" "/data/app/${ELF}" &&
		adb shell "killall ${ELF}; /data/app/${ELF}; echo $?" &
	done
}
COUNT=12
if [ 0 -eq $# ]; then
	for ((i = 1; i <= COUNT; i++))
	do
		align=$(printf "%02d" ${i})
		run "example${align}"
	done
else
	run "$*"
fi
