function what_edit(){
  if [[ "$1" == "vim" ]]; then
    vim ~/.mars/lib/_vimrc
  elif [[ "$1" == "git" ]]; then
    vim ~/.mars/lib/_gitconfig
	elif [[ "$1" == "core" ]]; then
		vim ~/.mars/lib/aliases.bash
  elif [[ "$1" == "hello" ]]; then
    vim ~/.mars/lib/ps1.bash
  else
    echo "[ERROR] Incorrect command."
  fi
}