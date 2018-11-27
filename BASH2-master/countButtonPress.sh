#!/bin/bash

COUNTER=0; 

pinVal=$( gpio read 5 ); #read and save

	until [ $COUNTER -eq 16 ]
	do
		
		pinVal=$( gpio read 5 ); 
		sleep .1s;

		if [ $pinVal -eq 0 ]
		then
			./initMode.sh			
			((COUNTER++));
			sleep .1s;			
			echo number is $COUNTER
			./setbits.sh $COUNTER;
		fi
		
	done

		if [ $COUNTER -eq 16 ]
		then	
			echo BUZZER
			gpio write 4 1; #buzzer on
			sleep 1s;
			gpio write 4 0; #off

		fi		
