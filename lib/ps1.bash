function gemset_name(){
  rvm gemset name
}

export PS1='\[\e[30;102m\] \u \[\e[m\] \[\e[37;101m\] $(gemset_name)💎 \[\e[m\] \[\e[1;96m\]\w\[\e[m\] ⚡ '
export PROMPT_COMMAND='echo'
