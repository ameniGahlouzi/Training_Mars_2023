#!/bin/bash

: 'script1.
1. zip the whole source directory(whithout files ignore)
2.encrupt a file
3.send the script to your teamate(email,..)
4.write on file the log of the program zipping directopryt
'



# set the input folder name and output file name
input_folder="myfolder"
output_file="myfolder.zip.gpg"
# zip the input folder
zip -r "$input_folder.zip" "$input_folder" >> log.out
# encrypt the zipped folder using GPG
gpg --output "$output_file" --symmetric "$input_folder.zip"
# delete the zipped folder
rm "$input_folder.zip"


 
# set the recipient's email address and the file to send
recipient="gahlouzi.ameni@gmail.com"
file_to_send="$output_file"
# create a temporary file for the email message
email=$(mktemp)
# write the email message to the temporary file
echo "To: $recipient" >> $email
echo "Subject: File attached" >> $email
echo "Hello," >> $email
echo "" >> $email
echo "Please find attached the file you requested." >> $email
echo "" >> $email
echo "Best regards," >> $email
echo "Your Name" >> $email
# send the email using sendmail
echo "Sending email..."
sendmail -t < $email -a $file_to_send
echo "Email sent successfully!"
# remove the temporary file
rm $email





