#!/bin/bash -x
echo " Welcome to Tic Tac Toe"

function resetBoard(){
	for (( i=1; i<=9; i++ ))
	do
		gameBoard[$i]=$i
	done
}
resetBoard

