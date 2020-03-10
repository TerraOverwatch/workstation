#!/bin/bash

function checkbrew () {
  echo "Did brew finish install? 'yes' or 'no'"
  read didbrew
   case $didbrew in
    "yes") 
      echo "Moving on."
      return 1
      ;;
    *)
      echo "try again:"
      checkbrew
      ;;
  esac
}

# Install brew
if hash brew 2> /dev/null
then
  echo "# Found brew."
else
  echo "# Adding brew."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  checkbrew
fi

# Setup base applications
sleep 5
brew install ansible

