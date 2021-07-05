#! /bin/bash
#####################################################
###---WARNING! This file ONLY for first install--###
###---or reinstall. FILE HAVE NOT ANY ALIASES---###
###################################################
echo "Mars initializing..."
#if '.bashrc' not include this string inside itself
if ! grep -q "source ~/.mars/lib/loader.bash" "$HOME/.bashrc" ; then
  if echo "source ~/.mars/lib/loader.bash" >> $HOME/.bashrc ; then 
    echo "[OK] Mars connected successfully!"
  else
    echo "[ERROR] Couldn't connect Mars to your .bashrc"
    exit
  fi
else
  echo "[OK] Mars already connected to your '.bashrc' :)"
fi
