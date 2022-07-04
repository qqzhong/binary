files=(
hello
hola
fib
callmaxofthree
echo
power
callsum
average
callfactorial
)

for f in "${files[@]}"; do echo "$(pwd)/${f}"; $(pwd)/${f} "${f}"; done
