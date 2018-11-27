#!/bin/bash




pinVal=$( gpio read 5 ); 
pressed=1; 
while true
do
		
	if [ $pinVal -eq 1 ] ;#wait
	then
		until [ $pinVal -eq 0 ] #wait value change
		do
			echo $pinVal;
			pressed=0
			export pressed;
			pinVal=$( gpio read 5 )
		done
		
	fi
	
	pinVal=$( gpio read 5 )
	
	if [ $pinVal -eq 0 ] ; 
	then
		until [ $pinVal -eq 1 ] 
		do
			echo $pinVal;
			pressed=1
			export pressed;			
			pinVal=$( gpio read 5 )
		done
		
	fi
	
done
