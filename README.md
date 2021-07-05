# Mars
This is a bash written tool for too simple deployment your rails application.

![logo](https://github.com/seedx-inc/mars/blob/master/mars_logo.png?raw=true)

 Don't setup this via root User.
 
## Installing

> **Requirenents**
> 1. git
> 2. vim
> 3. curl
> 4. rvm

```bash
$ git clone https://github.com/enotikalt/mars.git
$ mv mars ~/.mars
$ touch ~/marsvars && cd .mars && ./mars.bash
```
> `.mars` folder needs to be in your ubuntu home folder.

Reload your `.bash_profile` or `.profile` or `.bashrc` file to start using it
```bash
$ source ~/.bashrc
```
Test by command
```bash
$ mars r #reload
```
If success - it will not show an error lol:p

## Deploy rails application

1. Go to your app folder location:
```bash
$ cd /home/deploy_user/myapp
```

2. Choose your RVM gemset:
```bash
$ rvm gemset use my_gemset_name
```
3. Setup deploy process

```bash
$ mars s #start
```
> List of jobs which mars will make:
> 1. Bundle install
> 2. Migrate database
> 3. Precompile assets
> 4. Restart passenger
> 5. Restart Redis 
> 6. Restart sidekiq (with daemon-reloading of systemctl)

```bash
# Manually you can restart NGINX by command:
$ mars restart-nginx #OPTIONALLY!!! 
```

_These are ADDITIANALS commands for simplify deploy RAILS BASED APP process_
```bash
$ mars precompile
#This is alias for `assets:precompile` with production environment 
#WARNING: You need to know that assets:precompile also makes `webpacker:compile` even if you don't using sprockets gem!
```

```bash
$ mars migrate
#This is alias for `db:migrate` with production environment
```

```bash
$ cd myapp_location
$ mars restart-passenger
#Alias passenger-config restart-app /home/deployuser/your_app_location
```

```bash
$ mars restart-nginx
#Here you doing restarting Systemd service, so, you may
#shoult enter sudo password
```

```bash
$ mars restart-redis
#Here you doing restarting Systemd service, so, you may
#shoult enter sudo password
```

```bash
#-> Be sure you have `/lib/systemd/system/sidekiq.service` file
#IF NOT - JUST enter this before:
$ mars conf sidekiq
#THEN Setting it UP! Just change your app name and Ruby version with RVM gemset inside `sidekiq.service` file.
#
#
#Yay! Let's restart this now
# 
$ sudo mars restart-sidekiq
#Here you doing restarting Systemd service, so, you may
#shoult enter sudo password
```

----------------------------------------------------------

**Editing**
Here are a few commands which allows you to edit some configurations.

```bash
$ mars edit vim
#editing file .mars/lib/_vimrc
```

```bash
$ mars edit git
#editing file .mars/lib/_gitconf
```

```bash
$ mars edit core
#editing mars code of core
```

```bash
$ mars edit hello
#editing mars PS1 variable
```

**Configurating**

Commands which allows configuration

```bash
$ mars conf vim
#installing vim plug
#installing jellybeans colorscheme
#rewriting your ~/.vimrc for connect mars vimrc file with custom configuration
```

```bash
$ mars conf hello
#connecting Mars PS1 (prompt hello message) configuration to your .bashrc 
$ mars s
#reloading shell (.bashrc)
```

```bash
$ mars conf git name email username
#rewriting ~/.gitconfig and connecting gitconfig of mars
```


## Additional info

This is how should setup the ubuntu sourcing configuration files.
So you know about:p


> `~/.bash_profile` source from `~/.profile` source from `~/.bashrc` source from `~/.mars/aliases.bash`

