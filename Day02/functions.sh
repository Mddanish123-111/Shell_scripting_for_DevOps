#!/bin/bash

<< disclaimer
This is for functions in scripting.
disclaimer

# This is function defination

function is_loyal() {
read -p "$1 is learning with:" TWS
read -p "$1 is learning good %" DevOps

if [[ $TWS == "Subham" ]];
then
	echo "$1 is loyal"
elif [[ $DevOps -ge 100 ]];
then
	echo "$1 is loyal"
else
	echo "$1 is not loyal"
fi
}
# This is function call

is_loyal "Danish"
