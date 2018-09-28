# Get the standard environment variabls setup first of all

export BASH_PROFILE_LOADED="true"

if [ -f ~/.bash_env ]; then
    source ~/.bash_env
fi

# Path to the bash it configuration
export BASH_IT="${STARTUP_DIR}/bash-it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source $BASH_IT/bash_it.sh

# Path to the bash it configuration
export MY_BASH_IT="${STARTUP_DIR}/my-bash-it"

# Load my-bash-it
source $MY_BASH_IT/my-bash-it.sh

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_local ]; then
    source ~/.bash_local
fi
