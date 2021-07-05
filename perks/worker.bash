#This file makes deploy jobs together

function m_deploy_bundle_install(){
  bundle exec bundle install
}


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

function m_restart_redis(){
  systemctl restart redis-server
}

function m_restart_sidekiq(){
  systemctl daemon-reload
  systemctl restart sidekiq
}

function m_worker(){
  echo "[Job] bundle install"
  m_deploy_bundle_install
  echo "[OK] Gems installed via bundle"
  echo "------------------------------------------------"
  echo "[Job] db:migrate"
  m_deploy_dbmigrate
  echo "[OK] Database migrated"
  echo "------------------------------------------------"
  echo "[Job] assets:precompile"
  m_deploy_assets_precompile
  echo "[OK] Assets precompiled"
  echo "------------------------------------------------"
  echo "[Job] passenger:restart"
  m_restart_passenger
  echo "[OK] Passenger restarts"
  echo "------------------------------------------------"
  echo "[Job] redis:restart"
  m_restart_redis
  echo "[OK] Redis restarts"
  echo "------------------------------------------------"
  echo "[Job] sidekiq:restart"
  m_restart_sidekiq
  echo "[OK] Sidekiq restarts"
  echo "------------------------------------------------"
  echo "All jobs finishes"
}
