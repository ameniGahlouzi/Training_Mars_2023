#!/bin/bash

output_file='myfolder/myfolder.zip'
# set the recipient's email address and the file to send
recipient="gahlouzi.ameni@gmail.com"
file_to_send="$output_file"
# create a temporary file for the email message
email=$(mktemp)

# Set email parameters
TO="gahlouzi.ameni@gmail.com"
FROM="nova167943@gmail.com"
USERNAME="nova167943@gmail.com"
PASSWORD="ohbcqklzbdyfnwrw"
SUBJECT="Test Email with Attachment"
BODY="Hello,\n\nPlease find attached the file you requested.\n\nRegards,\nSender"

# Set file path and name
FILEPATH="."
FILENAME="$file_to_send"

# Send email with attachment
sendemail -f $FROM -t $TO -u $SUBJECT -m $BODY -s smtp.gmail.com:587 -o tls=yes -xu $USERNAME -xp $PASSWORD -a $FILEPATH/$FILENAME