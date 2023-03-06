#!/bin/bash

## open visual studio, import code from github repo
## close all opened chrome widows and open new tabs from tabs file

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Installing now..."
  # install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check if Visual Studio Code is installed
if ! command -v code &> /dev/null
then
    # If it is not installed, install it
    echo "Visual Studio Code is not installed. Installing now..."
    sudo apt update
    sudo apt install code
fi

# Bring Visual Studio Code to the front
osascript -e 'tell application "Visual Studio Code" to activate'
# Simulate keypress for closing all windows
osascript -e 'tell application "System Events" to tell process "Visual Studio Code" to keystroke "w" using {command down, shift down}'

# Read GitHub url from config file and clone it
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

# check is google chrome is installed
if [ ! -d "/Applications/Google Chrome.app" ]; then
  # install google chrome
  echo "Google Chrome is not installed. Installing now..."
  brew install google-chrome
fi

# Close all Chrome windows
osascript -e 'tell application "Google Chrome" to close windows'

# Open a new Chrome window
open -a "Google Chrome"

# check if tabs file exists
if [ ! -f "tabs" ]; then
  echo "Error: input file not found"
  exit 1
fi

# Open all urls from tabs file in chrome window
while IFS= read -r line || [[ -n "$line" ]]; do
  line=$(echo $line | tr -d '\r')
  echo $line
  /usr/bin/open -a "/Applications/Google Chrome.app" "$line"
done < tabs

