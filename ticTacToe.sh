#!/bin/bash -x
echo "Welcome to Tic Tac Toe"

function resetBoard(){
	for (( i=1; i<=9; i++ ))
	do
		gameBoard[$i]=$i
	done
}
resetBoard

function toss(){
	assignLetter=$((RANDOM%2))
	if [ $assignLetter -eq 1 ]
	then
		player="X"
		echo "Player play first"
	else
		player="O"
		echo "Computer play first"
	fi
}

function displayBoard(){
	echo "+---+---+---+"
	echo "| ${gameBoard[1]} | ${gameBoard[2]} | ${gameBoard[3]} |"
	echo "+---+---+---+"
	echo "| ${gameBoard[4]} | ${gameBoard[5]} | ${gameBoard[6]} |"
	echo "+---+---+---+"
	echo "| ${gameBoard[7]} | ${gameBoard[8]} | ${gameBoard[9]} |" 
	echo "+---+---+---+"
}

function validateCell(){
	displayBoard
	count=0
	read -p "Enter cell position between 1 to 9:- " position
	gameBoard[$(($position))]="X"
	count=$(($count+1))
}

function rowCheckforWinning(){
	for (( i=1; i<=9; i=$((i+3)) ))
	do
		if [[ ${gameBoard[$i]} -eq ${gameBoard[(($i+1))]} && ${gameBoard[$i]} -eq ${gameBoard[(($i+2))]} ]]
		then
			row=0
			break;
		else
			row=1
		fi
	done
		echo $row
}

function columnCheckforWinning()
{
	column=0
	for (( i=1; i<4; i++ ))
	do
		if [[ ${gameBoard[$i]} -eq ${gameBoard[(($i+3))]} && ${gameBoard[$i]} -eq ${gameBoard[(($i+6))]} ]]
		then
				column=0
				break;
		else
				column=1
		fi
	done
	echo $column
}

function diagonalCheckforWinning()
{
	if [[ ${gameBoard[1]} -eq ${gameBoard[5]} && ${gameBoard[1]} -eq ${gameBoard[9]} || ${gameBoard[3]} -eq ${gameBoard[5]} && ${gameBoard[3]} -eq ${gameBoard[7]} ]]
	then
			diagonal=0
	else
			diagonal=1
	fi
	echo $diagonal
}

function winner(){
	toss
	count=0
	while [ $count -ne 9 ]
	do
		validateCell
		row=$(rowCheckforWinning)
		column=$(columnCheckforWinning)
		diagonal=$(diagonalCheckforWinning)
		if [[ $row -eq 0 || $column -eq 0 || $diagonal -eq 0 ]]
		then
			echo "You Win"
			break
		fi
	done
}
winner
