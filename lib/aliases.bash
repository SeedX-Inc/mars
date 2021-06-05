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
source "$HOME/.mars/perks/var_loader.bash"

function m_deploy_assets_precompile(){
  bundle exec rails assets:precompile RAILS_ENV=production
}

function m_deploy_dbmigrate(){
  bundle exec rails db:migrate RAILS_ENV=production
}

function m_restart_passenger(){
  passenger-config restart-app $(pwd)
}

function m_restart_nginx(){
  service nginx restart
}

function restart_redis(){
  systemctl restart redis-server
}

function restart_redis_failed(){
  systemctl restart redis-serverrrrrr
}

function m_restart_sidekiq(){
  systemctl restart sidekiq
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
  elif [[ "$1" == "restart-nginx" ]]; then
    m_restart_nginx
  elif [[ "$1" == "s" ]]; then
	  source ~/.bashrc
  else
	  echo "[ERROR] Unknown command"
  fi
}


alias mars="action_processor"
alias g="git"
