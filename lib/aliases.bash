function install_curl(){
  if ! type curl &> /dev/null ; then
    echo "Curl installing..."
    if sudo apt install curl ; then
      echo "[OK] Curl installed successfully!"
    else
      echo "[ERROR] Couldn't install curl"
      exit
    fi
  else
    echo "[OK] 'Curl' already installed"
  fi
}

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

function configure_gitconfig(){
  #if ! grep -q "path = ~/.mars/lib/_gitconfig" "$HOME/.gitconfig" ; then
	  echo "[include]" > $HOME/.gitconfig #rewrite old file
		echo "  path = ~/.mars/lib/_gitconfig" >> $HOME/.gitconfig #append to new file
		echo "[user]" >> $HOME/.gitconfig #append to new file
		echo "  name = $1" >> $HOME/.gitconfig #append to new file
		echo "  email = $2" >> $HOME/.gitconfig #append to new file
		echo "  username = $3" >> $HOME/.gitconfig #append to new file
		echo "[core]" >> $HOME/.gitconfig #append to new file
    echo "  editor = vim" >> $HOME/.gitconfig
    echo "[OK] Gitconfig rewrited succussfully!"
  #else
  #  echo "[OK] Seems like mars gitconfig already included"
  #fi
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
		  echo "[OK] New configuration wrote to (~/.vimrc)"
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


function deploy_assets_precompile(){
  bundle exec rake assets:precompile RAILS_ENV=production
}

function deploy_dbmigrate(){
  bundle exec rake db:migrate RAILS_ENV=production
}

function action_processor(){
  if [[ "$1" == "conf" ]]; then
    case "$2" in
	    "vim" )
		    configure_vim
		    ;;
      "hello" )
        configure_hello
        ;;
      "git" )
        configure_gitconfig $3 $4 $5
        ;;
    esac
  elif [[ "$1" == "edit" ]]; then
    what_edit $2
  elif [[  "$1" == "precompile" ]]; then
    deploy_assets_precompile
  elif [[  "$1" == "migrate" ]]; then
    deploy_dbmigrate
  elif [[ "$1" == "s" ]]; then
	  source ~/.bashrc
  else
	  echo "[ERROR] Unknown command"
  fi
}


alias mars="action_processor"
alias g="git"
