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
echo $toss

function displayBoard(){
	echo "+---+---+---+"
	echo "| ${gameBoard[1]} | ${gameBoard[2]} | ${gameBoard[3]} |"
	echo "+---+---+---+"
	echo "| ${gameBoard[4]} | ${gameBoard[5]} | ${gameBoard[6]} |"
	echo "+---+---+---+"
	echo "| ${gameBoard[7]} | ${gameBoard[8]} | ${gameBoard[9]} |" 
	echo "+---+---+---+"
}

function validateCell()
{
	displayBoard
	count=0
	read -p "enter a cell position between 1 to 9 " position
	for (( i=1;i<=9;i++ ))
	do
		if [ $position -eq $i ]
		then
			count=1
			break
		else
			count=0
		fi
	done

	if [ $count -eq 1 ]
	then
	 	gameBoard[$i]=X
		displayBoard  ${gameBoard[$i]}
	else
		validateCell
	fi
}
validateCell
