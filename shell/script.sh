#!/bin/bash

## open visual studio, import code from github repo
## close all opened chrome widows and open new tabs from tabs file

# Check if Homebrew is installed
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Check if Homebrew is installed on macOS
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Installing now..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Check if Homebrew is installed on Linux
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Installing now..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        if [[ "$PATH" != *"$HOME/.linuxbrew/bin"* ]]; then
            echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.profile
            eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        fi
    fi
fi

# Check if Visual Studio Code is installed
if [ "$(uname)" == "Darwin" ]; then
    # If on macOS, check if Visual Studio Code is installed
    if ! command -v code &> /dev/null
    then
        # If it is not installed, install it
        echo "Visual Studio Code is not installed. Installing now..."
        brew update
        brew install --cask visual-studio-code
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # If on Linux, check if Visual Studio Code is installed
    if ! command -v code &> /dev/null
    then
        # If it is not installed, install it
        echo "Visual Studio Code is not installed. Installing now..."

        # Check the package manager used by the system
        if [ -x "$(command -v apt)" ]; then
            # If using apt package manager
            sudo apt update
            sudo apt install code
        elif [ -x "$(command -v dnf)" ]; then
            # If using dnf package manager (Fedora, Red Hat, CentOS)
            sudo dnf install code
        elif [ -x "$(command -v yum)" ]; then
            # If using yum package manager (older Fedora, Red Hat, CentOS)
            sudo yum install code
        elif [ -x "$(command -v zypper)" ]; then
            # If using zypper package manager (openSUSE)
            sudo zypper install code
        else
            # If package manager not found
            echo "Error: Could not determine package manager. Please install Visual Studio Code manually."
            exit 1
        fi
    fi
else
    # If on an unsupported operating system
    echo "Error: Operating system not supported. Please install Visual Studio Code manually."
    exit 1
fi

# Bring Visual Studio Code to the front
osascript -e 'tell application "Visual Studio Code" to activate'
# Simulate keypress for closing all windows
osascript -e 'tell application "System Events" to tell process "Visual Studio Code" to keystroke "w" using {command down, shift down}'

# Define the command to use for cloning
if command -v git >/dev/null 2>&1; then
    # Git is installed
    clone_command="git clone"
else
    # Git is not installed
    if command -v apt-get >/dev/null 2>&1; then
        # Debian-based distribution
        clone_command="sudo apt-get install git -y && git clone"
    elif command -v yum >/dev/null 2>&1; then
        # Red Hat-based distribution
        clone_command="sudo yum install git -y && git clone"
    else
        echo "Error: Git is not installed, and we could not determine how to install it for your distribution."
        exit 1
    fi
fi

# Loop through the URLs in the config file
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
        eval "$clone_command $url && cd $repo_name && git checkout master && cd .."
    fi
done < config

# Open the specified folder in Visual Studio Code
echo $repo_name
open -a "Visual Studio Code" "$repo_name"

# Define the command to use for installing packages
if command -v brew >/dev/null 2>&1; then
    # Homebrew is installed
    install_command="brew install"
elif command -v apt-get >/dev/null 2>&1; then
    # Debian-based distribution
    install_command="sudo apt-get install"
elif command -v yum >/dev/null 2>&1; then
    # Red Hat-based distribution
    install_command="sudo yum install"
else
    echo "Error: We could not determine how to install packages for your distribution."
    exit 1
fi

# Check if Google Chrome is installed
if [ ! -d "/Applications/Google Chrome.app" ]; then
    # Google Chrome is not installed
    echo "Google Chrome is not installed. Installing now..."
    # Install Google Chrome using the appropriate package manager
    eval "$install_command google-chrome"
fi

# Close all Chrome windows
# Define the command to use for closing windows
if command -v osascript >/dev/null 2>&1; then
    # macOS
    close_command='tell application "Google Chrome" to close windows'
elif command -v wmctrl >/dev/null 2>&1; then
    # Linux
    close_command='wmctrl -c "Google Chrome"'
else
    echo "Error: We could not determine how to close windows for your distribution."
    exit 1
fi

# Close Google Chrome windows using the appropriate command
eval "$close_command"

# Open a new Chrome window
open -a "Google Chrome"

# check if tabs file exists
if [ ! -f "tabs" ]; then
  echo "Error: input file not found"
  exit 1
fi

# Define the command to use for opening URLs
if command -v open >/dev/null 2>&1; then
    # macOS
    open_command="/usr/bin/open"
elif command -v xdg-open >/dev/null 2>&1; then
    # Linux
    open_command="xdg-open"
else
    echo "Error: We could not determine how to open URLs for your distribution."
    exit 1
fi

# Loop through the URLs in the tabs file
while IFS= read -r line || [[ -n "$line" ]]; do
    line=$(echo $line | tr -d '\r')
    echo $line
    # Open the URL using the appropriate command
    eval "$open_command \"$line\""
done < tabs

