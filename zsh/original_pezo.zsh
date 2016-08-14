# !/usr/bin/env python

# manage compressed, etc. files
extract.here () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }


# bash core
alias ls.dots="ls -A | egrep '^\.'"

## SNIPPETS BEGIN
## ==============

# MySQL
# -----

# Check stuff

# Schema
# SELECT default_character_set_name FROM information_schema.SCHEMATA WHERE schema_name = "schemaname";
#
# Tables
# SELECT CCSA.character_set_name FROM information_schema.`TABLES` T,
#        information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA
# WHERE CCSA.collation_name = T.table_collation
#   AND T.table_schema = "schemaname"
#   AND T.table_name = "tablename";

# Columns
# SELECT character_set_name FROM information_schema.`COLUMNS`
# WHERE table_schema = "schemaname"
#   AND table_name = "tablename"
#   AND column_name = "columnname";


# Modify stuff
#ALTER DATABASE <database_name> CHARACTER SET utf8 COLLATE utf8_unicode_ci;
#ALTER TABLE <table_name> CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
#ALTER TABLE <table_name> MODIFY <column_name> VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci;

## SNIPPETS END


# powerline font
#source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim # TODO: its broken now
set laststatus=2

function title {
    echo -ne "\033]0;"$*"\007"
}

# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}
name.both  () { setTerminalText 0 $@; }
name.tab   () { setTerminalText 1 $@; }
name.title () { setTerminalText 2 $@; }



alias make.dot='makefile2dot <Makefile >Makefile.dot'
alias make.png='makefile2dot <Makefile |dot -Tpng > Makefile.png'
alias makefile2dot='python makefile2dot.py ' # todo: link it
alias pm!='python manage.py makemigrations;';
alias cd_T='Tpath';
alias wp='which python;';
alias bss='bash setup.sh;';
alias pfr='pip freeze > requirements.txt;';
alias pf='pip freeze ';
alias pir='pip install requirements.txt;';
alias pms='python manage.py shell;';
alias wpy='which python;';
alias pmr='python manage.py runserver ';
alias pm='python manage.py ';
alias pmm='python manage.py migrate;';
alias pmmm='python manage.py makemigrations;';
alias pipfr='pip freeze ';
alias sv='source ./venv/bin/activate || source ./virtualenv/bin/activate || source ./env/bin/activate;';

alias first_line="echo $1 | cat - $2 > tempxyzlolwat && mv tempxyzlolwat $2"

# Chrome scripteles
alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"

# SSH copy
alias copyssh='cat ~/.ssh/id_rsa.pub | pbcopy'

# Email-kuldes: MAC-rol
# echo 'igen, ez az aminek latszik' > email_attachment
# forras: http://krypted.com/mac-security/mail-attachments-from-the-command-line/
# uuencode ~/Desktop/orgchart.doc orgchart.doc | mail -s “orgchart” contact@org.com -c contact2@org.com,krypted@mac.com -b secret@org.com
# uuencode email_attachment name_in_email.csv | mail -s 'A vegtelen fekete Urbol szarmazik ala Terminal aka parancssor aka KDL' reho.balazs@gmail.com

# Email kuldes Linuxrol
# http://tecadmin.net/ways-to-send-email-from-linux-command-line/#
# email kuldes google-lel
# a tobbi szar
# http://www.linuxandlife.com/2013/01/send-email-from-linux-terminal.html
# innen a link: http://askubuntu.com/questions/5431/how-can-i-email-an-attachment-from-the-command-line

alias git_log_simple-decoration='git log --graph --simplify-by-decoration  --full-history --all --color         --pretty=format:"%x1b[31m%x09%x1b[32m%d%x1b[0m%x20"'

set_SCREENSHOT_PATH(){
   defaults write com.apple.screencapture location $1;
   killall SystemUIServer;
}

set_SCREENSHOT_PATH_GoogleDrive(){
   defaults write com.apple.screencapture location ~/GoogleDrive/Screenshots;
   killall SystemUIServer;
}

# aasd
#alias set_SCREENSHOT_PATH='defaults write com.apple.screencapture location ; killall SystemUIServer;'

# Ez az ami a Z -t (brew install z) elerhetove teszi valahogy, a leirasaban ez nemszerepelt
. `brew --prefix`/etc/profile.d/z.sh

# Email


alias files.move.up.dir='mv * .[^.]* ..;'
alias vvim='vim ~/.vimrc;'
alias vzsh='vim ~/.zshrc;'

# Alias
alias scp.key='scp -i keyfile ' # scp -i key_file.pem your_username@remotehost.edu:/remote/dir/foobar.txt /local/dir
                                # source: http://stackoverflow.com/questions/9427553/how-to-download-a-file-from-server-using-ssh
alias va='vim ~/.zshrc; source ~/.zshrc;'
alias sz='source ~/.zshrc'
alias c='clear;'
alias CELLAR='/usr/local/Cellar/'

# pubmed sshhoz key kell
alias pycharm='/Applications/PyCharm.app/Contents/MacOS/pycharm'
alias cpwd="pwd | tr -d '\n' | pbcopy"

# =============================================
# ====== Linux Shell Scripting Cookbook =======
alias ppath='print $PATH | tr ":" "\n"'

easy_prepend() { [ -d "$2" ] && eval $1=\"$2':'\$$1\" && export $1; }
prepend() { [ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1 ;} # ha nincs benne alapbol elem, akkor nem tesz :-ot a vegere
# This can be used in the following way:
# prepend PATH /opt/myapp/bin
# prepend LD_LIBRARY_PATH /opt/myapp/lib
# [ -d "$2" ] - does the argument directory really exist? If Yes, go with eval...

addpath() { [ -d "$1" ]      && eval $PATH=\"$1':'\$$PATH\" && export $PATH ;}

# ====== Linux Shell Scripting Cookbook  =======
# ==============================================

alias postgres.server="sudo -u postgres pg_ctl -D /Library/PostgreSQL/9.4/data/bin"

alias scrapy_env='source ~/env2.7scrapy/bin/activate'


# ==============================================
# json2csv
alias _json2csv.py='/Scriptek/python/json2csv/json2csv.py' #todo: linkelni
alias _gen_outline.py='Scriptek/python/json2csv/gen_outline.py' #todo: linkelni
# 1) nodes legyen a top-level az atalakitando jsonben
# 2) python2.7 _gen_outline.py --collection nodes /path/to/the.json
# 3) python2.7 _json2csv.py /path/to/json_file.json /path/to/outline_file.json -o /some/other/file.csv
# ==============================================

# [filenev] elejere append
# echo 'elso sorba kerul' | cat - filenev > temp && mv temp filenev

alias abs=' greadlink -f '



# Envs
scrapy_env='source ~/env2.7scrapy/bin/activate'

# Utils
alias in='jupyter notebook'
alias jn='jupyter notebook'

alias clipboard='pbcopy'
alias pc='pbcopy'
alias whereiam='pwd'
alias subl="open /Applications/Sublime\ Text.app"
alias copypath='whereiam | clipboard'
alias tree='find . -type d | ls -lARG'

export HISTTIMEFORMAT="%d/%m/%y %T "
export LC_ALL=en_US.utf-8 # IPython Notebook problems
export LANG=en_US.utf-8   # IPython Notebook problems
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#export JAVA_HOME=$(/usr/libexec/java_home)

# MySQL
alias mysql.start="sudo /usr/local/mysql/support-files/mysql.server start"
alias mysql.stop="sudo /usr/local/mysql/support-files/mysql.server stop"
alias mysql.restart="sudo /usr/local/mysql/support-files/mysql.server restart"
alias mysql.status="sudo /usr/local/mysql/support-files/mysql.server status"

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.


ZSH_THEME="Honukai"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE='awesome-fontconfig'
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew zsh-syntax-highlighting)

# User configuration

# export PATH="/Users/pezo/anaconda/bin:/Users/pezo/anaconda/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/include"
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/include:/Users/pezo/anaconda/bin'
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
