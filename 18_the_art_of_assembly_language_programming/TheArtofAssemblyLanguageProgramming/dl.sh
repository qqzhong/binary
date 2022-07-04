files=(
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/aoaTOC1.pdf 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/aoaTOC2.pdf 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/FORWARD.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH01.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH02.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH03.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH04.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH05.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH06.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH07.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH08.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH09.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH10.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH11.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH12.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH13.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH14.PDF
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH15.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH16.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH17.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH18.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH19.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH20.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH21.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH22.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH23.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH24.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/CH25.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/APNDXB.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/APNDXC.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/APNDXD.PDF 
https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/aoaIndex.pdf 
)


for f in "${files[@]}"
do
	echo $f
	wget -c $f
	sleep 3
done


