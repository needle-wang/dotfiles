runtime vimrc_example.vim

"vundle的配置
filetype off                   " required!

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
if has("win32")
    call plug#begin('$HOME/vimfiles/bundle')
else
    call plug#begin('~/.vim/bundle')
endif
"Make sure you use single quotes

"######### 1. VIM-相关 #########
"VIM中文文档(还集成了些常用的插件的中文文档!)
Plug 'asins/vimcdoc'
"最小空间占用的缓冲区列表   Plug 'fholgado/minibufexpl.vim'
"缓冲区列表增强             Plug 'bufexplorer.zip'
"分组式缓冲区列表           Plug 'TinyBufferExplorer'
"窗口布局管理器 (自己配映射就用不着了,它自带了file和tag的explorer) "Plug 'winmanager'
"<C-w>o变成最大化窗或还原布局, 太慢了.  Plug 'ZoomWin','regedarek/ZoomWin'
"让html标签或endif支持%, 内置未启用, 交给vim-plug管吧
Plug 'vim-scripts/matchit.zip'
"operation+motion:(vim内置)
"ci,di,yi,ca,da,ya接符号及dib,diB,cit为 删除(/复制)符号内的文本
"操作对象增强: ds"为删除", cs"'为由"替换成', ys+{motion}+符号为加符号
"可视模式(选中文本后)按S"为用"surround文本
Plug 'tpope/vim-surround'
"括号自动闭合 Plug 'kien/rainbow_parentheses.vim' 'jiangmiao/auto-pairs' 'kana/vim-smartinput' 'Townk/vim-autoclose'
"<s-tab>跳出闭合,i_<C-g>g跳出最外一层,不支持<C-h>挺好
Plug 'Raimondi/delimitMate'
"enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
"目录浏览增强, 内置为netrw
Plug 'scrooloose/nerdtree'
"状态行增强                 Plug 'Lokaltog/powerline', 'bling/vim-airline'
Plug 'itchyny/lightline.vim'
"precision color scheme, 'altercation/solarized' is all in one.
Plug 'altercation/vim-colors-solarized'

"让fcitx响应vim的模式切换
Plug 'vim-scripts/fcitx.vim'

"command-T增强,模糊查找文件             Plug 'kien/ctrlp.vim'
"Ack, 通过配置可以使用ag搜索            Plug 'mileszs/ack.vim'
"The plugin is a front for ag(the_silver_searcher)
Plug 'rking/ag.vim'
"vim8, 异步, 文件搜索及显示函数列表, ctrlp增强
Plug 'Yggdroot/LeaderF'
"shell模式                  Plug 'Flolagale/conque'
"   vimshell依赖vimproc     Plug 'Shougo/vimshell.vim' | Plug 'Shougo/vimproc.vim'
"集成接口, 功能像ctrlp, 但可搜索显示任意来源的信息, 且可自定义来源  Plug 'Shougo/unite.vim'
"vim8, 异步, 后台运行 某程序
Plug 'skywind3000/asyncrun.vim'
"######### 1. VIM-相关 END #########

"######### 2. 编程-相关 #########
"文本排版
Plug 'godlygeek/tabular'
"垂直缩进线         Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
" 参数提示
Plug 'Shougo/echodoc.vim'
"majutsushi/tagbar是taglist增强, NB!
Plug 'majutsushi/tagbar'

"python all in one!         Plug 'klen/python-mode'
"杀手级clang语法解析补全插件(all in one!)
"2015年 12月 02日 星期三 14:38:58 CST
"win下要用到visual studio(用2013版试后无法编译不再试)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"语法检查器,保存文本时才检查(即默认的主动模式)  Plug 'scrooloose/syntastic'
"vim8, 异步, 实时代码检查器
Plug 'w0rp/ale'

"vim8, 异步生成ctags, ctags用于函数跳转的~
Plug 'ludovicchabant/vim-gutentags'

"注释插件           Plug 'vimcn/NERD_commenter.cnx'
Plug 'scrooloose/nerdcommenter'

"国人写的snipMate增强,按<C-\>,很好很强大,自定义很难~ Plug 'drmingdrmer/xptemplate'
"片段引擎, snipmate增强版(未自带片段)
Plug 'SirVer/ultisnips'
    "snipmate和ultisnips引擎的代码片段集, utlisnips默认都会检索 Plug 'honza/vim-snippets'
    Plug 'needle-wang/vim-snippets'

"snipmate与xptemplate快键不冲突, 不支持嵌套, 直接tab, 二者已停止更新~
"Plug 'msanders/snipmate.vim' | Plug ''scrooloose/snipmate-snippets'

"Plug 'jaredly/vim-debug'
"######### 2. 编程-相关 END #########

"######### 3. PYTHON-相关 #########
"没必要用for, 有文件类型判断
Plug 'fs111/pydoc.vim', { 'for': 'python' }
"解决py方法定义的括号的缩进问题     Plug 'hynek/vim-python-pep8-indent'

"Plug 'needle-wang/ViMango'
Plug 'needle-wang/vim-jumptoview', { 'for': 'python' }

"for snipmate, 不过ultisnips默认支持
Plug 'needle-wang/bootstrap-snippets', { 'for': ['html', 'htmldjango'] }
"jinja2语法文件
"Plug 'Glench/Vim-Jinja2-Syntax'
"######### 3. PYTHON-相关 END #########

"######### 4. front-end-相关 #########
"Plug 'othree/html5.vim'
"here is ZenCoding.vim's new name
Plug 'mattn/emmet-vim', { 'for': ['html', 'htmldjango'] }
"Live browser editing(实时更新html浏览)
"Plug 'jaxbot/browserlink.vim', { 'for': ['html', 'htmldjango'] }

"######### 4. front-end-相关 END #########

"######### 5. JAVA-相关 #########
"JDE有单独菜单,上手难~
"Plug 'Vim-JDE'
"JAVA补全, 如方法等
"Plug 'javacomplete'
"######### 5. JAVA-相关 END #########

"######### 6. 其他-相关 #########
Plug 'tpope/vim-fugitive'
"vim-instant-markdown自己有文件类型判断
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
"shfmt命令不知道怎么安装...
"Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
"利用vundle把它下下来而已,非vim插件     Plug 'sgerrand/xfce4-terminal-colors-solarized'
"有lispbox就别老想着这东东了,巨麻烦~    Plug 'slimv.vim'
"######### 6. 其他-相关 END #########

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
" Initialize plugin system
call plug#end()

filetype plugin indent on     " required

function! Result_of_run(run_sign)
    "!ls这样运行, 显示的结果会切换到shell界面
    echo system(a:run_sign . shellescape(expand('%')))
endfunction

function! Add_space()
    set switchbuf=usetab,newtab
    let fts_tmp = ['python', 'sh', 'java', 'htmldjango', 'javascript', 'cpp', 'c']
    "如果文件类型不在fts_tmp之中, 就要inoremap .
    if index(fts_tmp, &ft) < 0
        if &ft == 'css'
            return
        endif
        "一定要加<buffer>表示当前缓冲区
        inoremap <buffer> . .<space>
    else
        if index(['htmldjango', 'sh'], &ft) < 0
            inoremap <buffer> - <space>-<space>
            inoremap <buffer> = <space>=<space>
            inoremap <buffer> % <space>%<space>
            if &ft != 'python'
                inoremap <buffer> <CR> ;<CR>
            endif
        endif
        inoremap <buffer> + <space>+<space>
        inoremap <buffer> * <space>*<space>
    endif
endfunction

function! Template_py()
    let b:line = ['#!/usr/bin/env python', '# encoding: utf-8', '#', strftime("# %Y年 %m月 %d日 %A %H:%M:%S CST"), '', '']
    call append(0, b:line)
    let b:line = ["", "def main():", "  pass", "", "", "if __name__ == '__main__':", "  main()"]
    call append(line("$"), b:line)
    call cursor(6, 0)
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

set autoread
set cedit=<C-g>     "ex模式打开命令行窗口的键
set cursorline      "高亮光标所在行
set expandtab
set history=1000
set ignorecase
set keywordprg=     "禁用man,使用内置help
set laststatus=2    "让单窗口时也会出现lightline
set nobackup
set noshowmode
set noswapfile
set noundofile
set number
set sessionoptions=blank,buffers,curdir,folds,options,tabpages,winsize,slash,unix,resize
set smartcase
set scrolloff=4     "光标上下两侧最少保留的屏幕行数
set shiftwidth=4    "自动缩进的空格数
set smarttab        "<BS>/<C-h>删除行首空格时一次将删shiftwidth多个
"放这好像被莫名覆盖了~
"set switchbuf=usetab,newtab
set tabstop=4       "<tab>占的空格数
set wildignore=*.o,*.obj,*~,*.pyc,*.pyo,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store   "文件补全时忽略下列文件
set wildmode=list:longest,full

"setlocal autochdir "与fugitive有冲突

let g:netrw_browsex_viewer = "google-chrome"

noremap      <C-e>  2<C-e>
noremap      <C-y>  2<C-y>
noremap          -  _
noremap          ;  :
noremap          :  ;
noremap          '  `
noremap          `  '
"noremap <silent> \| :call NERDComment("n", "Comment")<CR>
"使特殊字符不用转义就默认变成正则含义(:h magic)
noremap          /  /\v
noremap <silent> *  *zz
noremap <silent> #  #zz
"高亮光标下的单词, 且光标坐标不变
noremap          &  mcHmt`c*`tzt`c
noremap    <space>  :nohl<CR><C-l>
"去行尾空格, tab, \r
noremap   ,<space>  mcHmt:%s/\s*[ \t\r]$//e<CR>`tzt`c
noremap <silent> n  nzz
noremap <silent> N  Nzz
noremap          P  "+gp
"noremap          Q  :Ag!<CR>
noremap <silent> g* g*zz
noremap          g\ ms:up<CR>
"for hhkb
noremap          g3 mco<C-r>=strftime("#%Y年 %m月 %d日 %A %H:%M:%S CST")<CR><Esc>`c2j
noremap <silent> g8 :TagbarToggle<CR>
noremap <silent> gc :call NERDComment("n", "Comment")<CR>ms:up<CR>
noremap <silent> gC :call NERDComment("n", "Uncomment")<CR>ms:up<CR>
noremap <silent> gm :cal cursor(line("."), (col(".")+col("$"))/2)<CR>
noremap <silent> gM :cal cursor(line("."), col(".")/2)<CR>
noremap          gq :Ag!<space>
"for hhkb
noremap          gs ms:up<CR>

noremap          <F1> <Esc>
noremap          <F3> mco<C-r>=strftime("# %Y年 %m月 %d日 %A %H:%M:%S CST")<CR><Esc>`c2j
noremap <silent> <F7> :NERDTreeToggle<CR>
noremap <silent> <F8> :TagbarToggle<CR>
"如果语法颜色错乱, 按此键刷新
noremap         <F12> :syntax sync fromstart<CR>

nnoremap           j        gj
nnoremap           k        gk
nnoremap           t        "+y
nnoremap           T        "+yy
nnoremap           G        Gzz
nnoremap           Y        y$
nnoremap          cd        :lcd %:p:h<CR>
nnoremap          co        2o<Esc>k
nnoremap          cO        O<Esc>j
"g-与正常模式的u重复了,     还易按错
nnoremap          g-        <nop>
nnoremap          gf        <C-w>gf
nnoremap <silent> gX        :call system('google-chrome '.shellescape(expand('%')))<CR>
nnoremap          gz        :tabnew<space>
nnoremap <silent>  _        :tabm-1<CR>
nnoremap <silent>  +        :tabm+1<CR>
nnoremap <silent> gr        gT
nnoremap <silent> <C-h>     gT
nnoremap <silent> <C-l>     gt
nnoremap <silent> g[        :tabfirst<CR>
nnoremap <silent> g]        :tablast<CR>
nnoremap <silent> gn        :NERDTreeFind<CR>
nnoremap <silent> gN        :NERDTree<CR>
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

autocmd BufNewFile,BufRead *.py nnoremap <buffer> <F2> :up<CR>:call Result_of_run("python ")<CR>
autocmd BufNewFile,BufRead *.sh nnoremap <buffer> <F2> :up<CR>:call Result_of_run("bash ")<CR>
"这样映射yapf不好, 不管有无修改vim都视为已修改
"autocmd FileType python nnoremap <F4> :0,$!yapf --style='{indent_width:2}'<CR><C-o>
nnoremap <F4> :ALEFix<CR>
nnoremap <F5> :AsyncRun -cwd=<root> -raw python %<CR> 
nnoremap <F6> :call asyncrun#quickfix_toggle(6)<CR>

autocmd FileType python inoremap # #<space>
"see :h paste
inoremap <silent>   vv  <C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>
inoremap <C-o>  <C-\><C-o>
inoremap <C-b>  <Left>
inoremap <C-f>  <Right>
inoremap <C-l>  <Del>
inoremap <C-s>  <Esc>ms:up<CR>a
inoremap <C-g>\ <Esc>ms:up<CR>a
inoremap <C-g>v <Esc>"+gpa
"<C-/> doesn't work on gvim...
"inoremap <C-/> <C-o>:cnext<CR>
"inoremap <C-/> <C-o>:cprevious<CR>
inoremap <F1>  <Esc>
autocmd BufNewFile,BufRead *.py inoremap <buffer> <F2> <Esc>:up<CR>:call Result_of_run("python ")<CR>
autocmd BufNewFile,BufRead *.sh inoremap <buffer> <F2> <Esc>:up<CR>:call Result_of_run("bash ")<CR>
inoremap <F3>  <Esc>mco<C-r>=strftime("#%Y年 %m月 %d日 %A %H:%M:%S CST")<CR><Esc>`c2ja
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"中文句号好像不会触发
inoremap ,  ,<space>
inoremap ， ,<space>
inoremap :  :<space>
inoremap ： :<space>
inoremap 。 .<space>
inoremap ； ;<space>
inoremap “  "<space>
inoremap ”  "<space>
"用iabbrev需要空格或回车触发
"所以某些输入或有补全菜单时iab不会触发
autocmd FileType python iabbrev none None
                     \| iabbrev true True
                     \| iabbrev false False
                     \| iabbrev re return

autocmd BufNewFile,BufRead * call Add_space()

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
"cnoremap cwd   lcd %:p:h
"cnoremap cd.   lcd %:p:h
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-l> <Del>
command! W :execute 'silent w !sudo tee % > /dev/null' | :e!


"   ######### VIM-相关-插件配置 #########

"------ for surround ------
nmap q<space> ysiw<space><space>f<space>
"为光标下的字串加双引号
nmap q; ysiW"f"
"为光标下的单词加双引号
nmap q' ysiw"f"
nmap q( ysiw(%
nmap q) ysiw)%
vmap q; S"f"
vmap q' q;
vmap q( S(%
vmap q) S)%
"------ for surround ------

"------ for delimitMate ------
"pep8-indent一定要
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
"------ for delimitMate ------

"------ for easymotion ------
let g:EasyMotion_leader_key = ','
"------ for easymotion ------

"------ for nerdtree ------
"let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI  = 1
let NERDTreeMouseMode  = 2
let NERDTreeIgnore     = ['\.vim$', '\~$', '\.pyc$', '\.ttf$']
"最后一个窗口是nerdtree时, 关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"自动打开nerdtree
"autocmd VimEnter * NERDTree | wincmd l
"------ for nerdtree ------

"------ for lightline ------
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }
"让lightline嵌入tagbar中(默认支持nerdtree和ctrlp)
let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction
"------ for lightline ------

"------ for solarized ------
let g:solarized_termcolors = 256
let g:solarized_contrast   = "high"    "default value is normal
syntax enable
set background=dark
colorscheme solarized
"colorscheme desert     "也不错
"set fillchars=vert:│   "设置窗口分隔符, 必须要有值, 且必须是单宽字符
"禁掉主题提供的窗口分隔线背景
highlight VertSplit ctermbg=NONE guibg=NONE
"------ for solarized ------

"------ for fcitx --------
set ttimeoutlen=200
"fcitx不支持ctrl-c,它不支持ex模式
"另外,YouCompleteMe手册也说不要用<C-c>: vim手册说会中断一些自动命令
inoremap <silent> <C-c> <Esc>
"------ for fcitx --------

""------ for ctrlp ------
"let g:ctrlp_regexp        = 1
"let g:ctrlp_by_filename   = 1
"let g:ctrlp_custom_ignore = {
    "\ 'dir'  :  '\v[\/]\.(git|hg|svn|rvm)$' ,
    "\ 'file' :  '\v\.(exe|so|dll|pyc|swp)$' ,
    "\ }
""------ for ctrlp ------

"------ for ack.vim ------
"let g:ackprg = 'ag --nogroup --nocolor --column'
"------ for ack.vim ------

"------ for ag.vim ------
let g:ag_prg = 'ag --column --smart-case'
"------ for ag.vim ------

"------ for LeaderF ------
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<CR>
noremap <m-p> :LeaderfFunction!<CR>
noremap <m-n> :LeaderfBuffer<CR>
noremap <m-m> :LeaderfTag<CR>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
"------ for LeaderF ------

"------ for asyncrun ------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 8
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" asyncrun根据特殊文件名 来识别 project 的根目录
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', 'build.xml']
" "<root>" 或者 "$(VIM_ROOT)" 来表示项目所在路径
"nnoremap <silent> <F5> :AsyncRun -cwd=<root> make <CR> 
" 设置 打开/关闭 Quickfix 窗口
"nnoremap <F6> :call asyncrun#quickfix_toggle(6)<CR>
let $PYTHONUNBUFFERED=1
"------ for asyncrun ------

"   ######### VIM-相关-插件配置 END -#########

"   ######### 编程-相关-插件配置 #########

"------ for tabular ------
"g;和g,很有用
noremap      g/         :Tab /
noremap      g=         :Tab /=<CR>
noremap      g1         :Tab /!=<CR>
noremap      g2         :Tab /==<CR>
noremap      g.         :Tab /,<CR>
noremap      g"         :Tab /"<CR>
noremap      g'         :Tab /'<CR>
noremap      g:         :Tab /:<CR>
noremap      g<space>   :Tab / <CR>
"noremap      g<Bar>     :Tab /<Bar><CR>
"------ for tabular ------

"------ for indentLine ------
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239       " vim
" none X terminal
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1
let g:indentLine_enabled = 0
let g:indentLine_fileType = ['python']
let g:indentLine_indentLevel = 3
nnoremap g<Bar> :IndentLinesToggle<CR>
"------ for indentLine ------

"------ for tagbar ------
let g:tagbar_width = 37
"let g:tagbar_autofocus   = 1    "打开tagbar时自动获取焦点
"let g:tagbar_autoshowtag = 0    "自动打开折叠
"let g:tagbar_sort        = 0    "标签按代码中的顺序排序
let g:tagbar_compact     = 1    "去掉含有<F1>的首行
let g:tagbar_indent      = 3    "修改tagbar内的缩进空间
let g:tagbar_singleclick = 1    "单击打开标签
set updatetime=700              "自动高亮当前tag的间隔时间，全局的
"------ for tagbar ------

"------ for YouCompleteMe ------
"vim中, <C-m>等价于Enter(<CR>)
"跳转到定义
"nnoremap <silent> <leader>g :YcmCompleter GoTo<CR>
nnoremap <silent>        go :YcmCompleter GoTo<CR>
let g:ycm_seed_identifiers_with_syntax = 1                       "语法关键字补全
let g:ycm_complete_in_comments         = 1                       "在注释中也启用补全
let g:ycm_goto_buffer_command          = 'new-or-existing-tab'   "设定跳转命令在哪里打开
let g:ycm_key_list_select_completion   = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_add_preview_to_completeopt   = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"上行无效~, 下行有效~, 老出问题
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"YouCompleteMe对不支持语义(semantic)补全的就会使用omnifunc, 如html
"启用范围为 黑名单在白名单中的补集
let g:ycm_filetype_blacklist = {
        \ 'c'        : 1,
        \ 'cpp'      : 1,
        \ 'infolog'  : 1,
        \ 'json'     : 1,
        \ 'mail'     : 1,
        \ 'nerdtree' : 1,
        \ 'notes'    : 1,
        \ 'pandoc'   : 1,
        \ 'qf'       : 1,
        \ 'tar'      : 1,
        \ 'tagbar'   : 1,
        \ 'text'     : 1,
        \ 'unite'    : 1,
        \ 'vimwiki'  : 1,
        \}
"let g:ycm_filetype_whitelist = {
        "\ 'css'        : 1,
        "\ 'html'       : 1,
        "\ 'htmldjango' : 1,
        "\ 'java'       : 1,
        "\ 'javascript' : 1,
        "\ 'python'     : 1,
        "\}
"------ for YouCompleteMe ------

""------ for syntastic ------
""手动检查, 主动模式会卡一会(pylint的原因,用pyflakes就好了)
"let g:syntastic_mode_map       = { 'mode' : 'passive' }
"let g:syntastic_error_symbol   = 'X>'
"let g:syntastic_warning_symbol = '⚠'

"let g:syntastic_check_on_wq = 0     "退出不检查
""主动模式与python-mode冲突, 导致有两次语法检查, 要么设成被动模式
""let g:pymode_lint_write = 0     "for python-mode
""出现错误自动打开错误位置列表, 没有出现则不打开
""let g:syntastic_auto_loc_list           = 1
"let g:syntastic_always_populate_loc_list = 1                          "即时刷新错误位置(:Errors)列表!
"let g:syntastic_quiet_messages           = {'level' : 'warnings'}     "去掉警告信息
"let g:syntastic_python_checkers          = ['pyflakes']
""syntastic_java_checkers与eclim有冲突
""html检查要联网, 或自己架server~
""let g:syntastic_html_checkers       = ['w3']
""let g:syntastic_javascript_checkers = ['javascript']
""nnoremap gs :SyntasticCheck<CR>

"function Syntastic_map(map_cmd1, map_cmd2)
    ""下行可以用\<bar> 或 \|
    ""nnoremap ]l :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(776\<bar>553\<bar>42\):/<bar>echo v:exception<bar>endtry<CR>
    "try
        "execute a:map_cmd1
    ""下行用\<bar>会无效
    ""catch /^Vim\%((\a\+)\)\=:E\%(776\<Bar>553\<Bar>42\):/
    ""E776: no location list, E553: no more error item, E42: no error
    "catch /^Vim\%((\a\+)\)\=:E\%(776\|553\|42\):/
        "try
            "up  "SyntasticCheck只能检查保存后的内容
            "SyntasticCheck
            "execute a:map_cmd2
        "catch /.*/
            "echo v:exception
        "endtry
    "catch
        "echo v:exception
    "endtry
"endfunction
"nnoremap <silent> [n :call Syntastic_map("lnext", "lfirst")<CR>
"nnoremap <silent> [N :call Syntastic_map("lprevious", "llast")<CR>
""------ for syntastic ------

"------ for ale ------
nnoremap <silent> [n :ALENextWrap<CR>
nnoremap <silent> [N :ALEPreviousWrap<CR>
"let g:ale_sign_column_always = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
"let g:ale_fix_on_save = 1

"语法修复器: ALEFix
"pip install yapf isort
"'sh': ['shfmt'], 但是shfmt不会装...
let g:ale_fixers = {
\   'python' : ['yapf', 'isort'],
\}

let g:ale_lint_delay = 500
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linters_explicit = 1

"语法检查器(自动检查)
"pip install flake8
"apt-get install shellcheck
let g:ale_linters = {
\   'python' : ['flake8'],
\   'sh'     : ['shellcheck'],
\   'vim'    : ['vint'],
\}

let g:ale_python_flake8_options = '--ignore=E111,E114,E121,E203,E251,E266,E501,F841,W391'
"没有这个yapf选项, 在项目的任意父目录加个.style.yapf
"let g:ale_python_yapf_options = '--style={indent_width:2}'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
"------ for ale ------

"------ for vim-gutentags ------
set tags=./.tags;,.tags "这句加跟不加没啥区别呀~
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"------ for vim-gutentags ------

"------ for xptemplate ------
"let g:xptemplate_nav_prev = '<C-k>'
"------ for xptemplate ------

"------ for UltiSnips ------
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
"------ for UltiSnips ------

"   ######### 编程-相关-插件配置 END #########

"   ######### PYTHON-相关-插件配置 #########

"------ for bootstrap-snippets ------
"有YouCompleteMe, 不用设置就支持了
"set dictionary+=~/.vim/bundle/bootstrap-snippets/dictionary
"set complete+=k
"------ for bootstrap-snippets ------

"   ######### PYTHON-相关-插件配置 END #########

"   ######### front-end-相关-插件配置 #########

"------ for emmet ------
let g:user_emmet_leader_key = 'Q'
let g:user_emmet_mode = 'nv'
"emmet不能映射<Bar>, 会导致ultisnips失效
"不能用noremap, leaderkey会失效
map <C-n>  <Plug>(emmet-expand-abbr)
"<C-/>, <C-&>, <C-_>可生成
"还有一些特殊符号可改, 具体忘了
map      <Plug>(emmet-expand-abbr)
imap     <C-o><Plug>(emmet-expand-abbr)
"------ for emmet ------

"------ for browserlink ------
"autocmd BufWritePost *.html :BLReloadPage
"1. run: ~/.vim/bundle/browserlink.vim/browserlink/start.sh
"要装nodejs, 并: sudo ln -s /usr/bin/nodejs /usr/bin/node
"2. 在页面中加上<script src='http://127.0.0.1:9001/js/socket.js'></script>
"下行写在browserlink.js里(将在chrome里的改动 动态写回 原文件中):
"window.__BL_OVERRIDE_CACHE = true
"------ for browserlink ------

"   ######### front-end-相关-插件配置 END #########

"   ######### JAVA-相关-插件配置 #########

"------ for Vim-JDE" ------
"autocmd FileType java inoremap <buffer> . .<C-x><C-u>
"以这个为主(不支持"someStr".形式,编译后支持本类),javacomplete为辅
"set completefunc=VjdeCompletionFun
"let g:vjde_lib_path = "/opt/MyEclipse_10_0/Common/plugins/com.genuitec.eclipse.j2eedt.core_10.0.0.me201110301321/data/libraryset/EE_5/javaee.jar"
"let g:vjde_javadoc_path = "/opt/jdk1.6.0_38/sourcecode/"
"------ for Vim-JDE" ------

"for java, ctags就是一砣, 太差了,一点都跳不准~
"sudo ctags -R --fields=+iaS --extra=+q
"autocmd FileType java set tags=/opt/jdk1.6.0_38/sourcecode/tags
"for javacomplete
"接口变量只能补全接口的方法,无Object的
"完整包路径的对象变量的点补全
"final类的对象变量的点补全,"someStr".也支持
"不支持自定义的类～
"已经相当不错了~
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"文档说是显示参数信息,不知道怎么用~,用vjde的
"setlocal completefunc=javacomplete#CompleteParamsInfo
"for pythoncomplete
"vim自带pythoncomplete.vim, 智能启用, 但是找不到哪autocmd的~
"YouCompleteMe自带了python补全~,且与下面的点映射冲突
"有时要加<C-p>上移, 有时又不要, 不清楚~
"autocmd FileType python inoremap <buffer> . .<C-x><C-o><C-p>

"docString的预览窗口会闪屏,所以要取消preview, 设成全局的更好些
set completeopt=longest,menu

"------ for eclim ------
"很完美,就是vim版eclipse,想受虐就用.
"保存时语法检查,巨快(syntastic完全比不上~)
"eclim默认会用pyflakes和python编译器验证语法,第一次检测没有pyflakes就不再用pyflakes
"let g:EclimPythonValidate = 0  "禁用保存文件时验证,.py不需要开eclimd
"有YouCompleteMe就不需要这个映射
"autocmd FileType java inoremap <buffer> . .<C-x><C-u>
"autocmd FileType java nnoremap <silent> <buffer> [i :JavaImportOrganize<CR>
"autocmd FileType java nnoremap <silent> <buffer> [d :JavaDocPreview<CR>
"autocmd FileType java nnoremap <silent> <buffer> [f :%JavaFormat<CR>
"autocmd FileType java nnoremap <silent> <buffer> <CR> :JavaSearchContext<CR>
"autocmd FileType java let g:EclimJavaCompleteCaseSensitive = 1
"autocmd FileType java let g:EclimCompletionMethod = 'omnifunc'
"------ for eclim ------

"   ######### JAVA-相关-插件配置 END #########

"   ######### 其他-相关-插件配置 #########

"------ for vim-fugitive ------
nnoremap \g :Gstatus<CR>
"------ for vim-fugitive ------

"------ for vim-instant-markdown ------
let g:instant_markdown_autostart = 0
"只能第一次, 再次开启无效, 原因未知
nnoremap X :InstantMarkdownPreview<CR>
"------ for vim-instant-markdown ------

"   ######### 其他-相关-插件配置 END #########


"为一些特殊非通用的东西, 如只针对某些项目的配置
if filereadable(expand("~/.lvimrc"))
    source ~/.lvimrc
endif

if has("gui_running")
    behave mswin

    set guioptions-=T       "gvim去掉工具栏
    "set novisualbell
    "set vb t_vb=            "去掉出错鸣叫
    set columns=90

    if has("win32")
        " win自带的consolas专门用来适配编程的
        " 在高分屏下要是字显小就调大些
        set guifont=Consolas:h12
        "win下中文(即双宽字体)需要gfw, ubuntu下中文应该是沿用guifont吧
        set guifontwide=Microsoft\ YaHei\ Mono:h12:cGB2312
    else
        "Ubuntu下, Ubuntu Mono比Bitstream显示效果要好
        set guifont=Ubuntu\ Mono\ 19
    endif
endif

