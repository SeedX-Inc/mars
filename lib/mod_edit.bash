function what_edit(){
  if [[ "$1" == "vim" ]]; then
    vim ~/.mars/perks/_vimrc
  elif [[ "$1" == "git" ]]; then
    vim ~/.mars/perks/_gitconfig
  elif [[ "$1" == "core" ]]; then
    vim ~/.mars/lib/loader.bash
  elif [[ "$1" == "hello" ]]; then
    vim ~/.mars/perks/ps1.bash
  else
    echo "[ERROR] Incorrect command."
  fi
}
