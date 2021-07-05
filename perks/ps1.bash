function gemset_name(){
  string=$(rvm gemset name)
  # the same to string=`rvm gemset name`
  if [[ $string == *"/"* ]]; then
    echo "default"
  else
    echo $string
  fi
}

__git_branch() {
    STATUS=$(git status 2>/dev/null |
    awk '
    /^On branch / {printf($3)}
    ')
    if [ -n "$STATUS" ]; then
        echo -ne "$STATUS "
    fi
}

__git_status() {
    STATUS=$(git status 2>/dev/null |
    awk '
    /^Initial commit/ {printf("*")}
    /^Untracked files/ {printf("*")}
    /^Changes not staged / {printf("*")}
    /^Changes to be committed/ {printf("*")}
    /^Your branch is ahead of/ {printf("")}
    ')
    if [ -n "$STATUS" ]; then
        echo -ne "$STATUS "
    fi
}

LIGHT_RED_COLOR="\e[91m"
LIGHT_YELLOW_COLOR="\e[93m"
YELLOW_COLOR="\e[33m"
LIGHT_GREEN_COLOR="\e[92m"
WHITE_COLOR="\e[97m"
LIGHT_CYAN_COLOR="\e[96m"
LIGHT_MAGENTA_COLOR="\e[95m"
END_COLOR="\e[0m"

export PS1='\[\e[97m\]\[\e[1m\] ➜ \[\e[0m\]\[\e[0m\]\[\e[96m\]\[\e[1m\]\w\[\e[0m\]\[\e[0m\] 💎 \[\e[91m\]\[\e[1m\]$(gemset_name)\[\e[0m\]\[\e[0m\] ⚡ \[\e[93m\]\[\e[1m\]$(__git_branch)\[\e[0m\]\[\e[0m\]\[\e[92m\]\[\e[1m\]$(__git_status)\[\e[0m\]\[\e[0m\]'
export PROMPT_COMMAND='echo'
#
#This file connects separately because
#some user maybe don't need rewriting PROMPT line
#
