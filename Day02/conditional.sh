#!/bin/bash

<< disclaimer
This is scripting for conditional like if, else and elif. 
disclaimer

read -p "Examination result" marks

if [[ $marks -le 100 && $marks -ge 90 ]];
then
	echo "A grade"
elif [[ $marks -le 89 && $marks -ge 80 ]];
then
	echo "B grade"
elif [[ $marks -le 79 && $marks -ge 70 ]];
then
	echo "C grade"
elif [[ $marks -le 69 && $marks -ge 60 ]];
then
	echo "D grade"
else
	echo "Fail"	
fi
