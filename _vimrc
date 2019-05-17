" 2018年 10月 13日 星期六 16:33:36 CST
" 重构成两文件, 此文件为基本配置, 插件相关均放在_vimrc_dev中
runtime vimrc_example.vim
noremap Q <Nop>

"------乱码解决方案------
"设成utf-8后，win下处理非utf-8文件时就出现菜单和console乱码
set encoding=utf-8      "encoding: vim内部任何东西均使用此编码

"若写chinese而不写cp936(以gbk为基础),可能会识别成euc-cn(gb2312的表示方法),
"此时, 如果文件内有一些繁体或生僻字依然乱码,
"若无这些字,而增加这些字会保存不了(如 嚭 字)
set fileencodings=utf-8,cp936,latin-1   "fileencodings: 探测文件编码时的顺序

"fileencoding: 设置此缓冲区所在文件的字符编码, 保存时也以此为依据
if has("win32")
    set fileencoding=chinese            "help chinese
    source $VIMRUNTIME/delmenu.vim      "处理菜单及右键菜单乱码, only win, 因为encoding
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8       "处理vim的consle输出乱码, only win
else
    set fileencoding=utf-8
endif

"termencoding是针对vim的, 管不到gvim
"用于键盘产生和终端显示的编码，在显示时，Vim 会把内部编码转换为屏幕编码
let &termencoding=&fileencoding
"------乱码解决方案------

function! Add_space()
    set switchbuf=usetab,newtab
    let fts_tmp = ['python', 'sh', 'java', 'htmldjango', 'javascript', 'cpp', 'c']
    "如果文件类型不在fts_tmp之中, 就要inoremap .
    if index(fts_tmp, &ft) < 0
        if &ft == 'css'
            return
        endif
        "一定要加<buffer>表示当前缓冲区
        inoremap <buffer> . .<Space>
    else
        if index(['htmldjango', 'sh'], &ft) < 0
            inoremap <buffer> - <Space>-<Space>
            inoremap <buffer> <Bar> <Space><Bar><Space>
            inoremap <buffer> = <Space>=<Space>
            inoremap <buffer> % <Space>%<Space>
            if &ft != 'python'
                inoremap <buffer> <CR> ;<CR>
            endif
        endif
        inoremap <buffer> + <Space>+<Space>
        inoremap <buffer> * <Space>*<Space>
    endif
endfunction

function! Template_py()
    let b:line = ['#!/usr/bin/env python3', '#', strftime("# %Y年 %m月 %d日 %A %H:%M:%S CST"), '', '']
    call append(0, b:line)
    let b:line = ["", "def main():", "  pass", "", "", "if __name__ == '__main__':", "  main()"]
    call append(line("$"), b:line)
    call cursor(5, 0)
endfunction

function! Template_sh()
    let b:line = ['#!/bin/bash -', '#', strftime("# %Y年 %m月 %d日 %A %H:%M:%S CST"), '', '']
    call append(0, b:line)
    call cursor(5, 0)
endfunction

function! Template_html()
    let b:line = ['bootstrap_basic', strftime("<!-- # %Y年 %m月 %d日 %A %H:%M:%S CST -->")]
    call append(0, b:line)
    normal dd
    call cursor(1, 15)
endfunction

set autoread        "默认关闭
set cedit=<C-g>     "ex模式打开命令行窗口的键
set cursorline      "高亮光标所在行, 默认关闭
set expandtab       "默认关闭
set history=1000    ":h 'history', 默认20
"set hlsearch        "默认关闭(在vimrc_example.vim设了), incsearch在defaults.vim设了
set ignorecase      ":h 'ignorecase', 默认关闭
set keywordprg=     "禁用man,使用内置help, 默认man
set laststatus=2    "让单窗口时也会出现lightline, 默认1
set noshowmode      "默认为showmode
set nobackup        "默认为nobackup
set noswapfile      "默认为swapfile
set noundofile      "默认为noundofile
set number          ":h 'number', 默认关闭
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize,slash,unix,resize
set smartcase       "默认关闭
set scrolloff=4     "光标上下两侧最少保留的屏幕行数, 默认为0
set shiftwidth=4    ":h 'shiftwidth', 自动缩进的空格数, 默认为8
set smarttab        "<BS>/<C-h>删除行首空格时一次将删shiftwidth多个, 默认关闭
"放这好像被莫名覆盖了~
"set switchbuf=usetab,newtab
set tabstop=4       "<tab>占的空格数, 默认为8
set wildignore=*.o,*.obj,*~,*.pyc,*.pyo,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store   "文件补全时忽略下列文件
set wildmode=list:longest,full      "默认为full

"setlocal autochdir "与fugitive有冲突

let g:netrw_browsex_viewer = "firefox"

noremap      <C-e>  2<C-e>
noremap      <C-y>  2<C-y>
noremap          -  _
noremap          ;  :
noremap          :  ;
noremap          '  `
noremap          `  ~
noremap          ~  '
"使特殊字符不用转义就默认变成正则含义(:h magic)
"noremap          /  /\v
noremap <silent> *  *zz
noremap <silent> #  #zz
"高亮光标下的单词, 且光标坐标不变, 下行偶尔还是会跳屏
"noremap          &  mcHmt`c*`tzt`c
noremap <silent> &  :let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'<Bar>set hls<CR>
noremap    <Space>  :nohl<CR><C-l>
"去行尾空格, tab, \r
noremap   ,<Space>  mcHmt:%s/\s*[ \t\r]$//e<CR>`tzt`c
"行跳转时用的, 忽略 跳文末的不便
noremap <silent> G  Gzz
noremap <silent> g* g*zz
"noremap          g\ ms:up<CR>
"for hhkb
noremap          g3 mco<C-r>=strftime("#%Y年 %m月 %d日 %A %H:%M:%S CST")<CR><Esc>`c2j
noremap <silent> gm :call cursor(line("."), (col(".")+col("$"))/2)<CR>
noremap <silent> gM :call cursor(line("."), col(".")/2)<CR>
"for hhkb
noremap          gs ms:up<CR>
noremap <silent> n  nzz
noremap <silent> N  Nzz
noremap          P  "+gp

noremap          <F1> <Esc>
noremap          <F3> mco<C-r>=strftime("# %Y年 %m月 %d日 %A %H:%M:%S CST")<CR><Esc>`c2j
"如果语法颜色错乱, 按此键刷新
noremap         <F12> :syntax sync fromstart<CR>

nnoremap           j        gj
nnoremap           k        gk
nnoremap           t        "+y
nnoremap           T        "+yy
nnoremap           Y        y$
nnoremap          cd        :lcd %:p:h<CR>
nnoremap          co        2o<Esc>k
nnoremap          cO        O<Esc>j
nnoremap          <C-g>     1<C-g>
"g-与正常模式的u重复了,     还易按错
nnoremap          g-        <nop>
nnoremap          gf        <C-w>gf
nnoremap <silent> gX        :call system('firefox'.shellescape(expand('%')))<CR>
nnoremap          gz        :tabnew<Space>
nnoremap <silent>  _        :tabm-1<CR>
nnoremap <silent>  +        :tabm+1<CR>
nnoremap <silent> gr        gT
nnoremap <silent> <C-h>     gT
nnoremap <silent> <C-l>     gt
nnoremap <silent> g[        :tabfirst<CR>
nnoremap <silent> g]        :tablast<CR>
nnoremap <silent> gh        <C-w><C-h>
nnoremap <silent> gj        <C-w><C-j>
nnoremap <silent> gk        <C-w><C-k>
nnoremap <silent> gl        <C-w><C-l>
nnoremap <silent> <C-j>     <C-w><C-j>
nnoremap <silent> <C-k>     <C-w><C-k>
nnoremap <silent> <C-Left>  :wincmd h<CR>
nnoremap <silent> <C-Down>  :wincmd j<CR>
nnoremap <silent> <C-Up>    :wincmd k<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>
nnoremap          gb        :tab sbp<CR>
nnoremap          gy        :tab sbn<CR>
nnoremap          <Left>    :tab sbp<CR>
nnoremap          <right>   :tab sbn<CR>
"autocmd BufEnter * echomsg expand('%:p') | let &titlestring = expand("%:p:h")
"see :h paste
inoremap <silent>   vv  <C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>
"fcitx和ale不支持ctrl-c
"另外, YouCompleteMe手册也说不要用<C-c>: vim手册说会中断一些自动命令
inoremap <silent> <C-c> <Esc>
inoremap <C-o>  <C-\><C-o>
inoremap <C-b>  <Left>
inoremap <C-f>  <Right>
inoremap <C-l>  <Del>
inoremap <C-s>  <C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>
"inoremap <C-g>\ <Esc>ms:up<CR>a
"inoremap <C-g>v <Esc>"+gpa
"<C-/> doesn't work on gvim...
"inoremap <C-/> <C-o>:cnext<CR>
"inoremap <C-/> <C-o>:cprevious<CR>
inoremap <F1>  <Esc>
inoremap <F3>  <Esc>mco<C-r>=strftime("# %Y年 %m月 %d日 %A %H:%M:%S CST")<CR><Esc>`c2ja
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"中文句号好像不会触发
inoremap ,  ,<Space>
inoremap ， ,<Space>
inoremap :  :<Space>
inoremap ： :<Space>
inoremap 。 .<Space>
inoremap ； ;<Space>
inoremap “  "<Space>
inoremap ”  "<Space>
"用iabbrev需要空格或回车触发
"所以某些输入或有补全菜单时iab不会触发
autocmd FileType python iabbrev none None
                     \| iabbrev true True
                     \| iabbrev false False
                     \| iabbrev r return

"vmap应用于可视+选择模式, xmap只用于可视模式
xnoremap     t mc"+y`c
vnoremap    gj <C-w><C-j>
vnoremap    gk <C-w><C-k>
"ultisnips的片段使用了选择模式
xnoremap <C-j> :m'>+<CR>`<my`>mzgv`yo`z
xnoremap <C-k> :m'<-2<CR>`>my`<mzgv`yo`z
"选择模式好像没法映射~
"snoremap t <C-o>mc"+y`c

cabbrev   e1   e!
cabbrev   q1   q!
cabbrev  qa1   qa!
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-l> <Del>
"上下键有补全效果, 类似bash的ctrl-r
cnoremap <c-n> <down>
cnoremap <c-p> <up>
command! W :execute 'silent w !sudo tee % > /dev/null' | :e!

"for gvim
if has("gui_running")
    behave mswin

    set guioptions-=T       "gvim去掉工具栏
    "禁用响铃和闪烁
    set vb t_vb=
    "GUI启动时会将t_vb重置, 要在gvimrc里再设一次, 除非如下:
    au GuiEnter * set t_vb=
    set columns=90

    if has("win32")
        " win自带的consolas专门用来适配编程的
        " 在高分屏下要是字显小, 就调大些
        set guifont=Consolas:h12
        "win下中文(即双宽字体)需要gfw选项, ubuntu下中文应该是沿用guifont吧
        set guifontwide=Microsoft\ YaHei\ Mono:h12:cGB2312
    else
        "Ubuntu下, Ubuntu Mono比Bitstream显示效果要好
        set guifont=Ubuntu\ Mono\ 14
    endif
endif

"插件及开发相关配置
if filereadable(expand("~/_vimrc_dev"))
    source ~/_vimrc_dev
endif

"------ 一些特殊非通用的东西, 如只针对某种语言/特定项目的配置 ------

"autocmd FileType python,sh inoremap <buffer> <F4> <C-o>:up<Bar>echo system(expand('%:p'))<CR>
"autocmd FileType python,sh nnoremap <buffer> <F4> :up<Bar>echo system(expand('%:p'))<CR>
"这样映射yapf不好, 不管有无修改vim都视为已修改
"autocmd FileType python nnoremap <F2> :%!yapf --style='{indent_width:2}'<CR><C-o>
autocmd FileType python,sh setlocal colorcolumn=101  "第101列, 高亮
autocmd FileType python,sh inoremap # #<Space>
"如果想用jinja2模板, 就改为如下:
"autocmd FileType html set filetype=htmljinja
autocmd FileType html   setlocal filetype=htmldjango

"写成多行时, 中间有行注释, 语句都算没连上!!
"必须放在setlocal filetype=htmldjango的后面
"autocmd FileType css,htmldjango,javascript setlocal tabstop=2 | setlocal shiftwidth=2
autocmd FileType css,htmldjango,javascript,python,sh setlocal tabstop=2
            \| setlocal shiftwidth=2

"for browserlink
" /*/*.html 的形式不生效
"autocmd BufWritePost */templates/*/*.html   BLReloadPage
"autocmd BufWritePost */templates_bs3/*.html BLReloadPage
"autocmd BufWritePost */templates/*.html     BLReloadPage
autocmd BufWritePost *.html                 BLReloadPage

autocmd BufNewFile,BufRead * call Add_space()
autocmd BufNewFile *.py   call Template_py()
autocmd BufNewFile *.sh   call Template_sh()
autocmd BufNewFile *.html call Template_html()
"直接进入插入模式, 但会感觉启动减慢1秒
"autocmd BufNewFile *.py,*.sh startinsert

"for django note
"from django.shortcuts import render_to_response
"from django.http import Http404 , HttpResponse , HttpResponseRedirect
"from django.template import RequestContext
"from django.conf.urls import patterns, include, url
"from django.contrib import admin

"from django.template.loader import get_template
"from django.template import Context
"from django.core.urlresolvers import reverse

"测试哪个python可用(:h has-python)
"if has('python')
  "echo '有 Python 2.x'
"elseif has('python3')
  "echo '有 Python 3.x'
"endif
