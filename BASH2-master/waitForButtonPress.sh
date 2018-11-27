#!/bin/bash


#Write a shell script that monitors the value of gpio
#pin 5. It should busy wait (continually check and loop) as long as the pin
#is 1 (not pressed). It should then busy wait as long as the pin is 0
#(pressed). The goal here is that this shell should wait until the button is
#pressed and then released

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
