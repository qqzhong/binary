# declare -A animals
# animals=( ["moo"]="cow" ["woof"]="dog")
# declare -A animals=( ["moo"]="cow" ["woof"]="dog")
# animals['key']='value' to set value
# "${animals[@]}" to expand the values
# "${!animals[@]}" (notice the !) to expand the keys
# for sound in "${!animals[@]}"; do echo "$sound - ${animals[$sound]}"; done

declare -A names=(
["1"]="Chapter 1"
["2"]="Chapter 2"
["3"]="Chapter 3"
["4"]="Chapter 4"
["5"]="Chapter 5"
["6"]="Chapter 6"
["7"]="Chapter 7"
["8"]="Chapter 8"
["9"]="Chapter 9"
["10"]="Chapter 10"
["11"]="Chapter 11"
["12"]="Chapter 12"
["13"]="Chapter 13"
["14"]="Chapter 14"
["15"]="Chapter 15"
["16"]="Chapter 16"
)

cd programming-with-64-bit-ARM-assembly-language || { echo "cd xx error"; };

for key in "${!names[@]}";
do
	echo "$key - ${names[$key]}";
	#mv "${key}"  "${names[$key]}";
done
cd .. || { echo "cd .. error"; };
