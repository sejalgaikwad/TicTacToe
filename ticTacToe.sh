#!/bin/bash -x
echo " Welcome to Tic Tac Toe"

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
toss

