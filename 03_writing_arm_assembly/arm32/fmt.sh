# @date: Sun 30 Jan 2022 12:57:32 PM HKT

find $(pwd) -regextype posix-extended -regex '.*\.(js|c|h|cpp|cxx|hpp|hxx|java)' -type f | while read -r f
do
	clang-format-11 -i ${f}
done
