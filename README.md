# mars
Ubuntu server tool

`.mars` folder need to be in your ubuntu home folder. Don't setup this via root User.

**Installing**
```bash
$ git clone https://github.com/enotikalt/mars.git
$ mv mars ~/.mars
$ cd .mars && ./mars.bash
#connecting mars to your .bashrc if not connected yet
$ source ~/.bashrc
```

**Documentation**
```bash
$ mars s
#Reload your shell via source ~/.bashrc
```

_Editing:_
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

**Configuration commands**
```bash
# Please, install vim via 'sudo apt install vim' before
$ mars conf vim
#installing vim plug
#installing jellybeans colorscheme
#rewriting your ~/.vimrc for connect mars vimrc file with custom configuration
```
```bash
$ mars conf hello
#connecting Mars PS1 (prompt hello message) configuration to your .bashrc 
$ mars s
#reloading shell
```

```bash
$ mars conf git name email username
#rewriting ~/.gitconfig and connecting gitconfig of mars
```
