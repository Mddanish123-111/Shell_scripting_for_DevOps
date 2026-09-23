#!/bin/bash

<< Comment
This scripting for add new user.
Comment

read -p "Enter username:" username

echo "You entered $username"

sudo useradd -m $username

echo "New user added"
