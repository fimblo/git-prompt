# -*- mode: shell-script -*-
#
# For details on all the environment variables supported, see
# README.org
#
# usage:
#  $ source profile
#


##################################################
# Activate generate-prompt
#
# This assumes that the binary generate-prompt has been copied into PATH
# Use `make install` or `make install-local` to make it so.
prompt_cmd() {
  PS1="$(generate-prompt)"
}
PROMPT_COMMAND=prompt_cmd


##################################################
# Patterns
#
# Default prompt pattern
unset GP_DEFAULT_PROMPT
export GP_DEFAULT_PROMPT="\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\] $ "


# Git prompt pattern
unset GP_GIT_PROMPT
export GP_GIT_PROMPT="[\pR/\pL/\pC]\n$ ";

# All instructions, mostly for testing
# export GP_GIT_PROMPT="[\pb\pR\pa\pd/\pL/\pC]\n$ ";


# Pre- and postfix patterns
unset GP_UP_TO_DATE
unset GP_MODIFIED
unset GP_NO_DATA
unset GP_RESET
# The state colours mentioned above can be overridden using these
# environment variables.
# export GP_UP_TO_DATE="\033[0;32m"
# export GP_MODIFIED="\033[0;33m"
# export GP_NO_DATA="\033[0;37m"
# export GP_RESET="\033[0m"

##################################################
# Styles

unset GP_GIT_WD_STYLE
# export GP_GIT_WD_STYLE='basename'
# export GP_GIT_WD_STYLE='cwd'
# export GP_GIT_WD_STYLE='gitrelpath'
