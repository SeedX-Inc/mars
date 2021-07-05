#-> DON'T MODIFY THIS FILE
#-> Just copy variables from here, which you need in to /home/youruser/marsvars.bash file
#-> These are variables which using by your rails application

#-> 'redis' gem searching this variable by default 
#-> `6379` - default redis-server port
#export REDIS_URL=redis://127.0.0.1:6379/0

#export RAILS_ENV=production

#-> rails uses this variable by default NOT OVERTLY
#export DATABASE_URL=postgresql://deploy:qwerty@127.0.0.1/myapp_database_name (often myapp_production)

#-> database.yml searching this var by default
#export MYAPP_DATABASE_PASSWORD=qwerty

#-> UNCOMMENT config.require_master_key inside your application
#-> and paste string from master.key
#export RAILS_MASTER_KEY=1cdb512a2a14e8b0e75c859b6f26cfd3

#-> secret key after `EDITOR=vim rails credentials:edit` command 
#export RAILS_SECRET_KEY_BASE=b7663318ab3e2cf668263a68d6fe713011c91420915e1bde4a746ecbbc380662f1947e99db04e281627f8bb0917218415de9c35ab8e65183b979751879d10dab

#-> sometimes using inside applications with many redis instances 
#export REDIS_SIDEKIQ_DB=0

#-> using for RVM. May exist in .bashrc by shit happend :)
#export PATH="$PATH:$HOME/.rvm/bin"

source "$HOME/marsvars.bash"
