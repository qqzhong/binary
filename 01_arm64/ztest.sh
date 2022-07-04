clear;
n=$*;
t=example${n};
make ${t};
./run.sh ${t};
sleep 1;
echo "";
./objdump.sh ${t};
echo "";
