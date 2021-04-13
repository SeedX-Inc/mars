#! /bin/bash

function reload_terminal(){
	source $HOME/.bashrc
}

  echo "Mars initializing..."
  
  if ! grep -q "source ~/.mars/lib/aliases.bash" "$HOME/.bashrc" ; then
    if echo "source ~/.mars/lib/aliases.bash" >> $HOME/.bashrc ; then 
      reload_terminal
	    echo "[OK] Mars connected successfully!"
    else
      echo "[ERROR] Couldn't connect Mars to your .bashrc"
      exit
    fi
  else
    echo "[OK] Mars already connected to your '.bashrc' :)"
  fi
