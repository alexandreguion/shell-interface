
#!/bin/bash
MAINDIR=$PWD
cd $MAINDIR


for ub in 10 #5 10 
do
                levels=8
                for angles in 10 #40 70
                do
                DIRECTORY=pwr-$levels-$angles-$ub.
                cd $DIRECTORY
                cp /Volumes/SDcard/SPRING15/VALIDATION-SCRIPT-6-90/interface.gfv .

                for j in 0 1 2 #3 4 5 6 7 8 9 10 11 12 13 14 15
                do
                        for k in 000 #100 200 300 400 500 600 700 800 900 
                        do

                                for ipp in 1 ;
                                do
                                POS=velo_wall$ipp
                                VELO=veloslice-$ipp-$j.$k.dat
                                gerris2D -e "OutputLocation {}$VELO $POS " out-$j.$k.gfs | gfsview2D
                                done #position
                        done #decimals 
                done #microseconds
                cd $MAINDIR
        done
done #ub
