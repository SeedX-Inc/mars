# mars
Ubuntu server tool

`.mars` folder need to be in your ubuntu home folder. Don't setup this via root User.

**Additional info**

This is how ubuntu sourcing configuration files.
Just to know about:p

```
`~/.bash_profile` source from `~/.profile` source from `~/.bashrc` source from `~/.mars/aliases.bash`
```

**Requirenents**
1. git
2. vim
3. curl


**Installing**

```bash
$ git clone https://github.com/enotikalt/mars.git
$ mv mars ~/.mars
$ cd .mars && ./mars.bash
#connecting mars to your .bashrc if not connected yet
$ source ~/.bashrc
```

**Deploy documentation**



_This is ADDITIANALS commands for simplify deploy RAILS BASED APP process_
```bash
$ mars precompile
#This is alias for `assets:precompile` with production environment 
#WARNING: You need to know that assets:precompile also makes `webpacker:compile` even if you don't using sprockets gem!
```

```bash
$ mars migrate
#This is alias for `db:migrate` with production environment
```

Use this commad with `sudo` preffix if you got some permission error.

```bash
$ cd myapp_location
$ mars restart-passenger
#Alias passenger-config restart-app /home/deployuser/your_app_location
```

```bash
$ sudo mars restart-nginx
#Here you doing restarting Systemd service, so, we recomended using this with sudo preffix
```

```bash
$ sudo mars restart-redis
#Here you doing restarting Systemd service, so, we recomended using this with sudo preffix
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
#Here you doing restarting Systemd service, so, we recomended using this with sudo preffix
```

----------------------------------------------------------

```bash
$ mars s
#Reload your shell via source ~/.bashrc
```

**Editing**
This few commands allows to you editing some configurations.

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

Commands which allows to configure something.

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
