#!/bin/bash


## douvre visual studio, importf code frfom git yysaker chromett lkol, y7l chrome


# Check if Visual Studio Code is installed
if ! command -v code &> /dev/null
then
    # If it is not installed, install it
    echo "Visual Studio Code is not installed. Installing now..."
    sudo apt update
    sudo apt install code
fi
    echo "visual studio code already installed"
    # Bring Visual Studio Code to the front
    osascript -e 'tell application "Visual Studio Code" to activate'

    # Simulate keypress for closing all windows
    osascript -e 'tell application "System Events" to tell process "Visual Studio Code" to keystroke "w" using {command down, shift down}'
    ## Clone the repository from GitHub
    #git clone https://github.com/ameniGahlouzi/ameni_test_publish_npm.git

    # Read the file containing the GitHub project URLs
    
    while read -r url; do
        # Extract the repository name from the URL
        echo "$url"
        repo=$(echo "$url")
        repo_name=$(basename "$repo" .git)

        if [ -d "$repo_name" ]; then
            echo "The folder exists."
        else
            echo "The folder does not exist."

            echo "Cloning $repo"
            # Clone the repository and check out the master branch
            git clone "$url" && cd "$repo_name" && git checkout master && cd ..
        fi
    done < config



    # Open the specified folder in Visual Studio Code

    echo $repo_name
    open -a "Visual Studio Code" "$repo_name"

    # Close all Chrome windows
    osascript -e 'tell application "Google Chrome" to close windows'

    # Open a new Chrome window
    open -a "Google Chrome"

 

     while read -r tab; do
        echo "$tab"
         /usr/bin/open -a "/Applications/Google Chrome.app" '$tab'
    done < tabs