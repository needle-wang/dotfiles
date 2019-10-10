#!/bin/bash -
# ~/.bash_aliases: executed by bash(1) for non-login shells.
# executed by .bashrc
#登陆xfce桌面只会加载.profile, 不会加载.bashrc(第一行就return了)
#以下内容之前一直放在.bashrc中, 现在将这些抽出来放到ubuntu(.bashrc)内设的自定义文件中
#2015年 10月 28日 星期三 23:32:13 CST
#关于别名:
#alias locate='locate -bi'
#不会造成解析死循环, 使用正常
#应该是因为一个别名只解析一次吧
#所以下面的先后顺序不重要, 只要全部设置完再用就没问题


# pip bash completion start
_pip_completion()
{
  COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                 COMP_CWORD=$COMP_CWORD \
                 PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

test -s /usr/share/autojump/autojump.sh && \
. /usr/share/autojump/autojump.sh

to_alias(){
# grep还是要的, ag会默认忽略点文件
alias a='grep -i'
alias b='v ~/.bash_aliases'
alias B='v ~/.bashrc'
alias C='column -t'
alias d='date'
alias e='v ~/_vimrc'
alias E='v ~/_vimrc_dev'
alias f='file'
#alias g='grep -i'
alias g='ag'
alias h='history'
alias i='ipconfig.sh'
alias k='gitk --all'
alias l='\ls --color=auto -AlFhrt'
# 如果行太长了, bat会展现得不好
alias L='less -ci'
alias m='man -L en'
alias n='Thunar'
alias p='ipython'
alias P='python3 -B'
alias q='quote'
alias s='sort'
alias t='type -a'
alias T='tree -F'
alias W='which'
alias x='bri.sh'
alias z='touchpad_toggle.sh'
#以下, 还未用，不一定都要用，避免失误
#bash: type: o: 未找到
#bash: type: u: 未找到
#bash: type: y: 未找到

alias ap='aptitude'
alias bc='bc -q'
alias c-='c -'
alias c.='c ..'
alias c..='c ../..'
alias cp='cp -vi'
alias df='df.sh | column -t'
alias gi='git'
alias lg='l | g'
alias ll='ls -AlFh'
alias ls='\ls --color=auto -v'
alias lt='l | awk "{if(index(\$8, \":\")){print}}" | g "$(date "+%-m月 *%-d")"'
alias lt2='l | awk -f $HOME/bin/today_filter.awk'
alias mv='mv -vi'
alias rm='rm -vi'
alias sl='ls'
#sudo visudo: %needle ALL=(ALL:ALL) NOPASSWD:ALL
alias ss='sudo ss -ntp'
#tailf有bug, 已过时, 连包都没有了~
alias tf='multitail'
alias vm='mv'

alias dj='c /usr/local/lib/python2.7/dist-packages/django'
alias lj='c /media/BACKUP/1LANDJ'
alias bu='c /media/BACKUP/2BACKUP'
alias some='c /media/SOME'
alias desk='cd "$HOME/桌面"'
alias down='c "$HOME/下载"'
alias win='cd /media/WIN'
alias kali='cd /media/KALI'
alias dwon='down'

alias dust='ls -A | xargs -I{} du -sh {} | s -h | tail; du -sh'
alias free='free -m -l -t'
alias flake8='flake8 --ignore=E111,E114,E121,E203,E251,E266,E501,F841,W391'
#dmesg只显示此次开机的kernel的日志, 其他deamon的输出不管
#journalctl -b显示从此次开机到运行此命令间的所有日志
alias journalctl='SYSTEMD_LESS=FRSXMKi journalctl --no-hostname'
alias logfromboot='journalctl -b'
alias mout='mount'
alias namp='nmap'
alias netstat='netstat -ntp'
alias sctl='systemctl'
alias sqlmap='sqlmap --random-agent'
# The first word of each simple command, if unquoted,
# is checked to see if it has an alias.
# Bash does not try to recursively expand the replacement text.
# If the last character of the alias value is a space or tab character,
# then the next command word following the alias is also checked for alias expansion. 
alias sudo='sudo '
alias tailf='tail -f'


#如果不是root用户
if [ "$(id -u)" != "0" ]; then
    alias aptitude='sudo aptitude'
    alias apt-get='sudo apt-get'
    #alias aptitude='sudo aptitude'
    alias atop='sudo atop'
    alias blkid='sudo blkid'
    alias chown='sudo chown'
    alias chmod='sudo chmod'
    alias dpkg='sudo dpkg'
    alias fdisk='sudo fdisk'
    alias iftop='sudo iftop -c ~/.iftoprc'
    alias iotop='sudo iotop'
    alias mount='sudo mount'
    alias nmap='sudo nmap'
    alias pip='sudo -H pip'
    alias pip3='sudo -H pip3'
    alias powertop='sudo powertop'
    alias reboot='sudo sync;sudo reboot'
    alias service='sudo service'
    alias sqlmap='sudo sqlmap'
    alias shutdown='sudo shutdown'
    alias systemctl='sudo systemctl'
    alias updatedb='sudo updatedb'
    alias update-grub='sudo update-grub'
    #原始PS1
    #export PS1=\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$
    #给命令符加颜色
    export PS1='\[\e[33m\]\u\[\e[0m\]@\h:\[\e[33m\]\w\[\e[33m\]\$\[\e[0m\] '
else
    alias netstat='netstat -ntp'
    export PS1='\[\e[35m\]\u\[\e[0m\]@\h:\[\e[33m\]\w\[\e[33m\]\$\[\e[0m\] '
fi

#使tty1, 3, 5可显示中文
#must do: sudo chmod 4755 $(W zhcon), 2018-09-11: 好像不需要加S位了
if tty | grep -q '^/dev/tty[135]$'; then
    zhcon --utf8 --drv=fb
fi
#使用byobu,且不让它接管tty.
#if pstree -sp $$ | grep -q 'gnome-terminal'; then
#	byobu
#fi

export EDITOR=vi
#for vim's solarized
export TERM=xterm-256color

#指定MP3标签编码
#export GST_ID3_TAG_ENCODING=GBK:UTF-8:GB18030
#export GST_ID3V2_TAG_ENCODING=GBK:UTF-8:GB18030

if [ "$(pwd)" == "$HOME" ]; then
	[ -d "$HOME/test" ] && cd "$HOME/test"
fi

if [ "$DISPLAY" ]; then
  xmodmap "$HOME/.Xmodmap" 2>/dev/null
fi

#在此处, 此行运行竟然报错!(t：未找到命令)
#t l
}

to_alias
#to_alias执行后, 下面的立即受影响(很正常嘛)

c(){
  # https://stackoverflow.com/questions/19408649/pipe-input-into-a-script
  # Check to see if a pipe exists on stdin.
  if [ -p /dev/stdin ]; then
    if type bat &>/dev/null; then
      bat --pager "less -Rci" "$@"    #要加双引号
    else
      less -ci
    fi
    return 0
  fi
  #don't run clear
  #test -d && echo ok #竟然输出ok
  #test -d "" #为失败
  #cd "" 为当前目录
  if [ -z "$1" ] || [ "$1" == "$HOME" ]; then
    cd && ls
  elif [ -d "$1" ] || [ "$1" == "-" ]; then
    cd "$1" && l
  else
    if [[ "$1" != -* ]] && [[ ! -f "$1" ]]; then
      j "$1"
    else
      if type bat &>/dev/null; then
        bat "$@"    #要加双引号
      else
        cat "$@"    #要加双引号
      fi
    fi
  fi
}

F(){
  find . -iname "*$1*"
}

v(){
  if [ "$#" -eq 2 ]; then
    vimdiff "$1" "$2"
  else
    vi "$@"
  fi
}

mkbak() {
  [ "$1" ] && cp "$1"{,.bak}
}

lo(){
  [ "$1" ] && locate -bei "$1" | g "$1"
}

lo.(){
  #当前目录下 通过正则 搜索文件名包含${1}的文件
  [ "$1" ] && locate -eir "$(pwd)/.*${1}" | g -v "${1}.*/" | g "${1}"
}

lo.BACKUP(){
  echo "  updatedb -l 0 -U '/media/BACKUP' -o '/media/BACKUP/mlocate.db'"
  [ "$1" ] && locate -d '/media/BACKUP/mlocate.db' -eir "$(pwd)/.*${1}" | g -v "${1}.*/" | g "${1}"
}

man() {
  #包装man, 使其支持man bash内置命令
  case "$(type -t "$1" 2>/dev/null):$1" in
    builtin:*) help "$1" | "${PAGER:-less}" -ci;;     # built-in
    *[[?*]*) help "$1" | "${PAGER:-less}" -ci;;       # pattern
    *) command -p man "$@";;  # something else, presumed to be an external command
                              # or options for the man command or a section number
  esac
}

mcd(){
  #新建目录, 并cd进去
  [ "$1" ] && mkdir -p "$1" && cd "$1"
}

psg(){
  [ "$1" ] || return 1
  ps -f  | head -n 1
  ps -ef | g "$(echo "$1" | sed 's;\(.\)$;[\1];')"
}

whif(){
  #使用通配符的which
  [ "$1" ] || return 1
  find $(echo "$PATH" | sed 's;:; ;g') -maxdepth 1 -type f -executable -iname "*$1*"
}

addpypath(){
  #若该path下有跟PATH中模块同名会出错~, 如abc.py:
  #command-not-found是py文件, path里有abc.py会抛:
  #"已放弃"
  local path_to_add=$(pwd)
  if [[ "$1" ]]; then
      path_to_add=$(cd $1 && pwd)
  fi
  if [[ "${path_to_add}" ]]; then
      PYTHONPATH="${path_to_add}:${PYTHONPATH}"
      echo "export PYTHONPATH=${PYTHONPATH}"
      export PYTHONPATH
  fi
}


if [[ -s "$HOME/.bash_tmp" ]]; then
  source $HOME/.bash_tmp
fi

unset to_alias
l

