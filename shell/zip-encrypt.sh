#!/bin/bash

# Enter the directory that you want to zip and encrypt
directory='myfolder'
cd $directory
# Prompt the user for the password to encrypt the zip file
read -s -p "Enter password for zip file: " password
# Create a zip archive of the directory and encrypt it using the provided password
zip -r -e -P "$password" "$directory.zip" .

