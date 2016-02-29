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

to_alias(){
#below, must do: ln -s /usr/bin/ack-grep /bin/agrep
alias a='agrep'
alias b='bc'
alias C='column -t'
alias d='date'
alias e='emacs'
alias f='file'
alias F='find . -iname'
alias g='grep -i'
alias h='history'
alias i='ipconfig.sh'
alias k='gitk --all'
alias l='ll -rt'
alias L='less -i'
alias m='man -L en'
alias n='nautilus'
alias p='ipython'
alias P='python'
alias q='quote'
alias s='sort'
alias t='type -a'
alias T='tree -F'
alias W='which'
alias x='bri.sh'
alias z='touchpad.sh'
#以下, 还未用，不一定都要用，避免失误
#bash: type: j: 未找到
#bash: type: o: 未找到
#bash: type: r: 未找到
#bash: type: u: 未找到
#bash: type: y: 未找到

alias ag='ag --column --smart-case'
alias bc='bc -q'
alias cp='cp -vi'
alias df='df -h | column -t'
alias gi='git'
alias lg='l | g'
alias ll='ls -AlFh'
alias lo='locate'
alias mv='mv -vi'
alias rm='rm -vi'
alias sl='ls'
#alias ss='sudo ss -ntp'
#must do: sudo chmod 4755 /bin/ss
alias ss='ss -ntp'

alias desk='cd ~/桌面'
alias down='cd ~/下载'
alias dwon='down'
alias dj='cd /usr/local/lib/python2.7/dist-packages/django'
alias backup='cd /media/BACKUP'
alias kali='cd /media/KALI'
alias kaui='kuai'
alias kuai='cd /media/BACKUP/1LANDJ/快盘'
alias kun='cd /media/BACKUP/1LANDJ/kun'
alias lj='cd /media/BACKUP/1LANDJ'
alias some='cd /media/SOME'
alias win='cd /media/WIN'
alias za='cd /media/SOME/2ZA'

alias dust='ls -A | xargs -I{} du -sh {} | s -h | tail; du -sh'
#编译安装后解决,而且是因下行导致关闭报错的
#alias gvim='UBUNTU_MENUPROXY=0 gvim -f'
alias locate='locate -bi'
alias namp='nmap'

if [ $(whoami) != 'root' ]; then
    alias apt-get='sudo apt-get'
    #alias aptitude='sudo aptitude'
    alias atop='sudo atop'
    alias fdisk='sudo fdisk'
    #这样更好一些: sudo chmod 4755 /usr/sbin/iftop
    #alias iftop='sudo iftop'
    alias iotop='sudo iotop'
    alias nmap='sudo nmap'
    alias netstat='sudo netstat -ntp'
    alias pip='sudo pip'
    alias reboot='sudo sync;sudo reboot'
    alias service='sudo service'
    alias shutdown='sudo shutdown'
    alias updatedb='sudo updatedb'
    #原始PS1
    #export PS1=\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$
    #给命令符加颜色
    export PS1='\[\e[33m\]\u\[\e[0m\]@\h:\[\e[33m\]\w\[\e[33m\]\$\[\e[0m\] '
else
    alias netstat='netstat -ntp'
    export PS1='\[\e[35m\]\u\[\e[0m\]@\h:\[\e[33m\]\w\[\e[33m\]\$\[\e[0m\] '
fi

#使tty1, 3, 5可显示中文
#must do: sudo chmod 4755 $(W zhcon)
if tty | grep -q '^/dev/tty[135]$'; then
    zhcon --utf8 --drv=fb
fi

#使用byobu,且不让它接管文本界面.
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
	test -d "$HOME/test" && cd "$HOME/test"
fi

if [ -e "$HOME/.dmrc" ]; then
    if cat "$HOME/.dmrc" | grep -q 'Session=ubuntu'; then
        xmodmap "$HOME/.Xmodmap" 2>/dev/null
    fi
fi

#在此处, 此行运行竟然报错!(t：未找到命令)
#t l
}

to_alias

c(){
    #don't run clear
    #test -d && echo ok
    #竟然输出ok
    #test -d "" 为失败
    #cd "" 为当前目录
    if [ -z "$1" ] || [ "$1" == "$HOME" ]; then
        cd && ls
    elif [ -d "$1" ] || [ "$1" == "-" ]; then
        cd "$1" && l
    else
        cat "$@"    #要加双引号
    fi
}

v(){
if [ "$2" ]; then
    vimdiff "$1" "$2"
else
    [ "$1" ] && vi "$1" || vi
fi
}

psg(){
    proname=$(echo "$1" | sed 's;\(.\)$;[\1];')
    ps -f  | head -n 1
    ps -ef | g $proname
}

unset to_alias
l

