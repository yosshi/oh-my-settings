export LANG=ja_JP.UTF-8
export SHELL=/bin/zsh
export DISPLAY="localhost:0.0"
export EDITOR=vim
path=(/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home/bin /opt/local/bin /usr/local/bin /bin /sbin /usr/bin /usr/sbin /usr/local/mysql/bin /opt/local/bin /usr/libexec /usr/local/php5/bin /Developer/SDKs/flex/bin /usr/local/sbin ~/bin/backup ~/bin)
#/opt/local/bin /usr/X11R6/bin

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# goenv
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# .zshrc.local
[ -f ~/.local.zshrc ] && source ~/.local.zshrc

#JAVA_HOME
export JAVA_HOME=/Library/Java/Home

export LSCOLORS=gxfxcxdxbxegedabagacad


# setopt
setopt autocd
setopt automenu
setopt autolist
setopt correct
setopt rm_star_silent
setopt auto_param_keys
setopt print_eight_bit
setopt print_eightbit
setopt share_history
setopt prompt_subst
setopt magic_equal_subst
setopt hist_ignore_dups
setopt hist_ignore_space
setopt HIST_NO_STORE
setopt LOCAL_OPTIONS
setopt extended_glob
setopt extended_history
setopt list_types


# source
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PROMPT=$'%2F%n@%m%f[%t]\n%3F%~%f %6F%1v\n%f%# '



# history
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# emacs like keybind
bindkey -e

autoload -U colors; colors
autoload -U compinit
compinit -u
#autoload predict-on
#predict-on





bindkey '^P' history-beginning-search-backward # 先頭マッチのヒストリサーチ
bindkey '^N' history-beginning-search-forward # 先頭マッチのヒストリサーチ

#aliases
alias ll="ls -l"
alias la="ls -la"
alias rm="rm -i"
alias catn="cat -n"
alias apllet="appletviewer"
alias L="clear"
alias gimp="gimp &"
alias xdvi="xdvi \!* &"
alias cdf="cd ../"
alias member="less ~/member"
alias less="less -R"
alias chasen="chasen -i w "
alias how="du -c -h -d 1"
alias flashlog="tail -f ~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt"
alias h="open ."
alias firefox="open -a Firefox"
alias webkit="open -a Webkit"
alias diff="colordiff"



alias hosts="less /private/etc/hosts"

alias ls="gls -FGh --color=auto"
zstyle ':completion:*:default' list-colors $LSCOLORS

### cd した後に ls を実行
function cd() { builtin cd $@ && ls; }

# ps aux | grep hogehoge
function psg() {
    ps | head -n 1
    ps | grep $* | grep -v "ps auxww" | grep -v grep
}


# 時間がかかったら通知センターで終了通知
local COMMAND=""
local COMMAND_TIME=""
precmd() {
    if [ "$COMMAND_TIME" -ne "0" ] ; then
        local d=`date +%s`
        d=`expr $d - $COMMAND_TIME`
        if [ "$d" -ge "30" ] ; then
             COMMAND="$COMMAND "
             echo -ne "\a"
             terminal-notifier -title "${${(s: :)COMMAND}[1]}" -message "$COMMAND"
        fi
    fi
    COMMAND="0"
    COMMAND_TIME="0"
}
preexec () {
    COMMAND="${1}"
    COMMAND_TIME=`date +%s`
}


# display all history
function history-all { history -E 1 }

# display history-ranking
function history-ranking  { history-all |awk '{print $4}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -r }

# peco history search
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# Small to Big
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# kill command color
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

# hokan color
#zstyle ':completion:*' list-colors di=34 fi=0
zstyle ':completion:*' list-colors $LSCOLORS
# hokan selected
zstyle ':completion:*:default' menu select=1

# zsh start message
echo Now zsh version $ZSH_VERSION start!
date # display date

