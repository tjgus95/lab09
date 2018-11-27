#!/bin/bash

#COUNTER=0

#while [ $COUNTER -lt 4 ] 

pins='0 1 2 3 4' 
for pins in $pins 
do
		#echo $COUNTER # do this
		gpio mode $pins out; 
		gpio write $pins 0; 
		
		
		#((COUNTER++)) 
done


pins2='5' 
for pins2 in $pins2 
do
		#echo $COUNTER # do this
		gpio mode $pins2 in; 
		gpio mode $pins2 up; 	
		gpio read $pins2 ; 
		
		#((COUNTER++)) 
done

#echo "done"
#echo "set to output and initalized to value 0 (off)"
