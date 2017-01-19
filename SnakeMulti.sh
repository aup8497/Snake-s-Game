#!/bin/bash

declare i=0

function checkPosition()
{
    case $Position in
	4)
	    newPosition=35
	    ;;
	
	7)
	    newPosition=23
	    ;;
	
	9)
	    newPosition=5
	    ;;
	
	14)
	    newPosition=43
	    ;;
	
	17)
	    newPosition=13
	    ;;
	
	21)
	    newPosition=3
	    ;;
	
	24)
	    newPosition=58
	    ;;
	
	27)
	    newPosition=37
	    ;;
	
	34)
	    newPosition=20
	    ;;
	
	42)
	    newPosition=11
	    ;;
      
	46)
	    newPosition=53
	    ;;
	
	49)
	    newPosition=32
	    ;;
	
	63)
	    newPosition=2
	    ;;
	
	*) 
	    newPosition=$Position
	    ;;
    esac
}

function checkPosition1()
{
    case $Position1 in
	4)
	    newPosition1=35
	    ;;
	
	7)
	    newPosition1=23
	    ;;
	
	9)
	    newPosition1=5
	    ;;
	
	14)
	    newPosition1=43
	    ;;
	
	17)
	    newPosition1=13
	    ;;
	
	21)
	    newPosition1=3
	    ;;
	
	24)
	    newPosition1=58
	    ;;
	
	27)
	    newPosition1=37
	    ;;
	
	34)
	    newPosition1=20
	    ;;
	
	42)
	    newPosition1=11
	    ;;
      
	46)
	    newPosition1=53
	    ;;
	
	49)
	    newPosition1=32
	    ;;
	
	63)
	    newPosition1=2
	    ;;
	
	*) 
	    newPosition1=$Position1
	    ;;
    esac
}


tput clear

printf "Would you like to:\n    1)Read the rules\n    2)Play the game\n\n"
read choice

if ((choice == 1))
then
    printf "\nThe rules are simple: \n   You press enter to roll the die\n   You are then told which space you have landed on\n   If you land on a snake you will move down the board\n   If you land on a ladder then you will move up it\n   In order to win you must land on 64 exactly\n   If you go over 64 then your imaginary piece will be moved backwards for the remainder of your dice roll\n\n Good Luck\n\n"
fi
  
  
if ((choice == 1 || choice == 2))
then
    printf "\nWelcome to Snakes and Ladders.\n"
    printf "\n  64  63  62  61  60  59  58  57       1=Start           27=Ladder to 37\n"
    printf "  49  50  51  52  53  54  55  56       4=Ladder to 35    34=Snake  to 20\n"
    printf "  48  47  46  45  44  43  42  41       7=Ladder to 23    42=Snake  to 11\n"
    printf "  33  34  35  36  37  38  39  40       9=Snake  to 5     46=Ladder to 53\n"
    printf "  32  31  30  29  28  27  26  25      14=Ladder to 43    49=Snake  to 32\n"
    printf "  17  18  19  20  21  22  23  24      17=Snake  to 13    63=Snake  to 2\n"
    printf "  16  15  14  13  12  11  10   9      21=Snake  to 3     64=End\n"
    printf "   1   2   3   4   5   6   7   8      24=Ladder to 58\n"

    
    while ((Position < 64 && Position1 < 64))
    do
	key=$((i%2))
	
	if((key==0))
	then
	    echo " "
	    echo "PLAYER 1"
	    echo -e "Please press 'enter' to roll!" 
	    read ch
	    
	    dice=$(echo "$RANDOM%6+1" | bc)
	    
	    echo -e "\nYou have rolled a $dice."
	    
	    Position=$((Position+dice))
	    
	    #if (($Position > 64))
	    #then 
	    #   above=$((Position-64))
	    #   Position=$((64-above))
	    #fi
	    
	    echo -e "You have landed on space $Position.\n"
	    
	    checkPosition
	    
	    if ((Position < newPosition))
	    then
		echo -e "\nWell done, you have landed on a ladder. You are now on space $newPosition."
	    fi
	    
	    if ((Position > newPosition))
	    then
		echo -e "\nUnlucky, you have landed on a snake. You are now on space $newPosition."
	    fi
	    
	    echo -e "\t\t\t\t\t\t\t\t\t\t\tPlayer 1: $newPosition."
	    Position=$newPosition
	    
	    
	else
	    echo " "
	    echo "PLAYER 2"
	    echo -e "Please press 'enter' to roll!" 
	    read ch
	    
	    dice=$(echo "$RANDOM%6+1" | bc)
	    
	    echo -e "\nYou have rolled a $dice."
	    
	    Position1=$((Position1+dice))
	    
	    #if (($Position1 > 64))
	    #then 
	    #    above=$((Position1-64))
	    #    Position1=$((64-above))
	    #fi
	    
	    echo -e "You have landed on space $Position1.\n"
	    
	    checkPosition1
	    
	    if ((Position1 < newPosition1))
	    then
		echo -e "Well done, you have landed on a ladder. You are now on space $newPosition1."
	    fi
	    
	    if ((Position1 > newPosition1))
	    then
		echo -e "Unlucky, you have landed on a snake. You are now on space $newPosition1."
	    fi
	    echo -e "\t\t\t\t\t\t\t\t\t\t\tPlayer 2: $newPosition."
	    Position1=$newPosition1

	fi

	i=$((i+1))
	
    done
    if((Position1 >= 64))
    then
	tput setab 4  #Sets a background.
	echo -e "PLAYER 2 WINS!\c"
	tput sgr0     #Resets the terminal settings.
	echo " "
    elif((Position >= 64))
    then
	tput setab 4  #Sets a background.
	echo -e "PLAYER 1 WINS!\c"
	tput sgr0     #Resets the terminal settings.
	echo "" 
    fi
	
    echo -e "\n\n\nYour Game starts in 5 Seconds!\n\n\n"
    printf "\n\n CONTROLS: 'h': Left.\t'l': Right.\t'k': Up.\t'j': Down.\n\n"
    for((i = 5; i > 0 ; i--))
    do
	sleep 2
	echo "Starts in $i Seconds!"
    done
		
	 chmod 755 snake.sh
	 ./snake.sh
fi
