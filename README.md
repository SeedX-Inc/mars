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

```bash
$ mars edit vim
#editing file .mars/lib/_vimrc
```
```bash
$ mars edit core
#editing mars code
```

**Configurating**

Install vim before this.
```bash
$ mars configure vim
#installing vim plug
#installing jellybeans colorscheme
#rewriting your ~/.vimrc for connect mars vimrc file with custom configuration
```
