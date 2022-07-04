# This file is generated automatically by example.sh
# @date: Tue 08 Feb 2022 01:08:05 PM HKT

clang-format-11 -i asm.h
COUNT=25
for ((i = 1; i <= COUNT; i++))
do
	align=$(printf "%03d" ${i})
	echo pe"${align}".S
	trim_files.bash pe"${align}".S
done

misc=(
add_digit_strings.S
clearbytes.S
compare.S
copybytes.S
divide_by_10.S
divide.S
factorial.S
ispalindromic.S
isprime.S
long_divide.S
mul_64to64.S
mul_digit_string.S
mul_int_string.S
prime_vector.S
printbytes.S
)
for f in "$misc[@]"; do
	trim_files.bash "${f}"
done
