find $(pwd) -type f  -name "*.S" |while read -r f
do
	#echo "${f}"
	awk '{print $0;
	if("msgLen = . - msg"==$0){
		print "\n";
		print "bFormat: .asciz \"c=%d\\n\"";
		print "sFormat: .asciz \"s=%d\\n\"";
		print "iFormat: .asciz \"i=%d\\n\"";
		print "iiFormat: .asciz \"i=%d,%d\\n\"";
		print "iiiFormat: .asciz \"i=%d,%d,%d\\n\"";
		print "\n";
	}}' "${f}" > "${f}.tmp";
	mv "${f}.tmp" "${f}"
done
