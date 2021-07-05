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

  if [[ -f ~/marsvars.bash ]]; then
    echo "Warning: ~/marsvars.bash file already exist."
  else
    echo "Paste your rails variables here. Let's read examples in ~/.mars/perks/marsenv.bash" > marsvars.bash
    if [[ -f ~/marsvars.bash ]]; then
      echo "[OK] File ~/marsvars.bash successfully created. Let's read variables example in ~/.mars/perks/marsenv.bash"
    else
      echo "[ERROR] Couldn't create ~/marsvars.bash file."
    fi
  fi
