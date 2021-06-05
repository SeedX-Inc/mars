###################
###---Sidekiq--###
##################
function configure_sidekiq(){
  # проверка существования файла
  if [[ -f /lib/systemd/system/sidekiq.service ]]; then
    echo "[ERROR] sidekiq.service file already exist."
    sleep 5
    echo "[Message] Opening sidekiq.service file for edit..."
    vim /lib/systemd/system/sidekiq.service #edit sidekiq file
  else

sudo bash << EOF
  echo 'Hello World'
  sudo cp $HOME/.mars/perks/sidekiq.service /lib/systemd/system/sidekiq.service
EOF

    if [[ -f /lib/systemd/system/sidekiq.service ]]; then
      echo "[OK] sidekiq.service file copied successfully."
      echo "[Message] Please, edit file /lib/systemd/system/sidekiq.service "
    else
      echo "[ERROR] sidekiq.service file not copied. Unknown error!"
    fi
  fi
}


###################
###---PS1 var--###
##################
function configure_hello(){
  if ! grep -q "source ~/.mars/lib/ps1.bash" "$HOME/.bashrc" ; then
    if echo "source ~/.mars/lib/ps1.bash" >> $HOME/.bashrc ; then
      echo "[OK] Hello prompt message changed successfully. Make 'mars s' for reloading shell." 
    else
      echo "[ERROR] Couldn't change your prompt hello message"
    fi
  else
    echo "[OK] Your PS1 var already redefined"
  fi
}



###################
#####---GIT--#####
##################
function configure_gitconfig(){
  echo "[include]" > $HOME/.gitconfig #rewrite old file
  echo "  path = ~/.mars/lib/_gitconfig" >> $HOME/.gitconfig #append to new file
  echo "[user]" >> $HOME/.gitconfig #append to new file
  echo "  name = $1" >> $HOME/.gitconfig #append to new file
  echo "  email = $2" >> $HOME/.gitconfig #append to new file
  echo "  username = $3" >> $HOME/.gitconfig #append to new file
  echo "[core]" >> $HOME/.gitconfig #append to new file
  echo "  editor = vim" >> $HOME/.gitconfig
  echo "[OK] Gitconfig rewrited succussfully!"
}

###################
#####---VIM--#####
##################
function install_vimplug(){
    if ! type git &> /dev/null ; then
      echo "Git installing ..."
      if sudo apt install git ; then
        echo "[OK] Git installed successfully!"
      else
        echo "[ERROR] Couldn't install git."
        exit
      fi
    fi
    
    if curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ; then
      echo "[OK] Vim Plug installed successfully!"
    else
     echo "[ERROR] Couldn't install 'Vim Plug'."
     exit
    fi
}

function install_colorscheme(){
  if ! [[ -d $HOME/.vim/colors ]]; then
    mkdir $HOME/.vim/colors
  fi

  if ! [[ -f $HOME/.vim/colors/jellybeans.vim ]]; then
    if cd ~/.vim/colors && curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim ; then
       echo "[OK] Colorscheme Jellybeans installed successfully!"
    else
      echo "[ERROR] Couldn't install Jellybeans colorscheme for vim."
      exit
    fi
  else
    echo "[OK] Jellybeans colorscheme already exist"
  fi
}

function configure_vim(){
  if type vim &> /dev/null ; then
	  if [[ -f $HOME/.vimrc ]]; then
		  if rm $HOME/.vimrc ; then
			  echo "[OK] Old (~/.vimrc) file removed"
		  else
			  echo "[ERROR] Couldn't remove old (~/.vimrc) file"
        exit
		  fi
	  else
      echo "[OK] .vimrc not exist yet. But will be created."
	  fi
  
    if echo "source $HOME/.mars/lib/_vimrc" >> $HOME/.vimrc ; then
		  echo "[OK] New configuration wrote to new (~/.vimrc) file"
      install_curl
      install_vimplug
      install_colorscheme
	  else
		  echo "[ERROR] Couldn't write new configuration to (~/.vimrc)"
      exit
	  fi
  else
	   echo "Seems like Vim not installed"
  fi
}