#This func needs to be first
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

source "$HOME/.mars/lib/mod_conf.bash"
source "$HOME/.mars/lib/mod_edit.bash"
source "$HOME/.mars/perks/marsenv.bash"
source "$HOME/.mars/perks/worker.bash"

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
      "sidekiq" )
        configure_sidekiq
        ;;
    esac
  elif [[ "$1" == "edit" ]]; then
    what_edit $2
  elif [[  "$1" == "precompile" ]]; then
    m_deploy_assets_precompile
  elif [[  "$1" == "migrate" ]]; then
    m_deploy_dbmigrate
  elif [[ "$1" == "restart-passenger" ]]; then
    m_restart_passenger
  elif [[ "$1" == "restart-sidekiq" ]]; then
    m_restart_sidekiq
  elif [[ "$1" == "restart-redis" ]]; then
    m_restart_redis
  elif [[ "$1" == "restart-nginx" ]]; then
    m_restart_nginx
  elif [[ "$1" == "r" ]]; then
	  source ~/.bash_profile
	  source ~/.profile
	  source ~/.bashrc
  elif [[ "$1" == "s" ]]; then
	  m_worker
  else
	  echo "[ERROR] Unknown command"
  fi
}


alias mars="action_processor"
alias g="git"
alias ..="cd .."
