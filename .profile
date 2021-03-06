# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export LANGUAGE="zh_CN:zh"
export LC_MESSAGES="zh_CN.UTF-8"
export LC_CTYPE="zh_CN.UTF-8"
export LC_COLLATE="zh_CN.UTF-8"

#登陆自动禁用触摸板
#synclient touchpadoff=1 2>/dev/null
#进入X时清除主目录下的goutputstream-*文件(无用)
#/home/needle/bin/cleanXoutput.py

#py解释器运行时, 不生成py[co]文件
export PYTHONDONTWRITEBYTECODE='yes'

