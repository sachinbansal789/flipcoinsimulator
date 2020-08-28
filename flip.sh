#!/usr/local/bin/bash -x

#VARIABLES

heads=0
tails=0

#FUNCTIONS

function getResult()					    				
{
	flip_Result=$((RANDOM%2))                       #get flip result for current coin flip
	if [[ $flip_Result -eq 1 ]]
        then
                heads=$((heads + 1))                    #increment heads if flip result is 1
        else
                tails=$((tails + 1))                    #increment tails if flip result is 0
        fi

}


function display()					#displays final result
{
        if [[ $heads -gt $tails ]]
        then
                echo "HEADS won by" $((heads - tails ))         #Print results of winner and margin of win
        else
                echo "TAILS won by" $((tails - heads ))
        fi


}


#MAIN PROGRAM

while [[ $heads -lt 21 && $tails -lt 21 ]]      	#While loop that runs until either one has appeared 21 times
do
	getResult					#call to simulator
done

if [[ $heads -eq $tails ]]				#In the event of a tie,run tie breaker
then 
	 echo "TIE with points= " $heads                #Print tie with points

         diff=0						#stores magnitude of difference 
         while [[ $diff -lt 2 ]]			#while loop runs till difference is 2
         do
                getResult				#call to simulator
		if [[ $heads -ge $tails ]]		#gets magnitude of difference
                then
                        diff=$(( heads - tails ))
                else
                        diff=$(( tails - heads ))
                fi
	 done
	 display
else							#No tie event
	 display					#Print result
fi
