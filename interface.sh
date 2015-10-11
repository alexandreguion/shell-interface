for j in 0 1 2 3 4 #5 6 7 8 9 10 11 12 13 14 15
do
			for k in 000 100 200 300 400 500 600 700 800 900 
			do

			INT=interface-$j.$k.dat

			for u in 0; do
			cat out-$j.$k.gfs 
			echo "Save $INT { format = Gnuplot }"   
			done | gfsview2D interface.gfv
			
			done #decimals 
	done #microseconds
