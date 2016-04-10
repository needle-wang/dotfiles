runtime vimrc_example.vim

"vundle的配置
filetype off                   " required!

" set the runtime path to include Vundle and initialize
if has("win32")
    set rtp+=$HOME/vimfiles/bundle/Vundle.Vim
    call vundle#begin('$HOME/vimfiles/bundle')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"VIM中文文档(还集成了些常用的插件的中文文档!)
Plugin 'asins/vimcdoc'
"operation+motion:(vim内置)
"ci,di,yi,ca,da,ya接符号及dib,diB,cit为 删除(/复制)符号内的文本
"操作对象增强: ds"为删除", cs"'为由"替换成', ys+{motion}+符号为加符号
"可视模式(选中文本后)按S"为用"surround文本
Plugin 'tpope/vim-surround'
"目录浏览增强, 内置为netrw
Plugin 'scrooloose/nerdtree'
"最小空间占用的缓冲区列表
"Plugin 'fholgado/minibufexpl.vim'
"缓冲区列表增强
"Plugin 'bufexplorer.zip'
"分组式缓冲区列表
"Plugin 'TinyBufferExplorer'
"百分号增强html标签或endif,内置未启用,还是交给vundle管吧~
Plugin 'matchit.zip'
"状态行增强
Plugin 'itchyny/lightline.vim'
"'Lokaltog/powerline', 'bling/vim-airline'
"窗口布局管理器
"自己配映射就用不着了,它自带了file和tag的explorer
"Plugin 'winmanager'
"<c-w>o改成最大化窗或还原布局,太慢了～
"Plugin 'ZoomWin','regedarek/ZoomWin'
"precision color scheme, 'altercation/solarized' is all in one.
Plugin 'altercation/vim-colors-solarized'
"让fcitx响应vim的模式切换
Plugin 'fcitx.vim'
Plugin 'easymotion/vim-easymotion'
"shell模式
"Plugin 'Flolagale/conque'
"shell模式,vimshell依赖vimproc
"Plugin 'Shougo/vimshell.vim'
"Plugin 'Shougo/vimproc.vim'
"集成接口,功能像ctrlp,但可搜索显示任意来源的信息,且可自定义来源
"Plugin 'Shougo/unite.vim'

"括号自动闭合,<s-tab>跳出闭合,i_<c-g>g跳出最外一层,不支持<c-h>挺好
Plugin 'Raimondi/delimitMate'
"Plugin 'jiangmiao/auto-pairs'
"还有kana/vim-smartinput,Townk/vim-autoclose,未试
"设置见 https://github.com/kien/rainbow_parentheses.vim
"Plugin 'kien/rainbow_parentheses.vim'
"c族语言 all in one!杀手级clang语法解析
"2015年 12月 02日 星期三 14:38:58 CST
"win下要用到visual studio(用2013版试后无法编译不再试)
Plugin 'Valloric/YouCompleteMe'
"python all in one!
"详情见: https://github.com/klen/python-mode
"Plugin 'klen/python-mode'
Plugin 'fs111/pydoc.vim'
Plugin 'needle-wang/ViMango'
"Plugin 'othree/html5.vim'
"Plugin 'jaredly/vim-debug'
Plugin 'godlygeek/tabular'
"JDE有单独菜单,上手难～
"Plugin 'Vim-JDE'
"JAVA补全, 如方法等
"Plugin 'javacomplete'
"here is ZenCoding.vim's new name
Plugin 'mattn/emmet-vim'
"Live browser editing(实时更新html浏览)
Plugin 'jaxbot/browserlink.vim'
"taglist增强, NB!
Plugin 'majutsushi/tagbar'
"国人写的snipMate增强,按<c-\>,很好很强大,自定义很难~
"Plugin 'drmingdrmer/xptemplate'
"片段引擎, snipmate增强版(未自带片段)
Plugin 'SirVer/ultisnips'
"snipmate和ultisnips的代码片段集, utlisnips默认都会检索
"Plugin 'honza/vim-snippets'
Plugin 'needle-wang/vim-snippets'
"snipmate与xptemplate快键不冲突,不支持嵌套,直接tab, 二者已停止更新~
"Plugin 'msanders/snipmate.vim'
"Plugin ''scrooloose/snipmate-snippets'
"语法检查器,保存文本时检查(即默认的主动模式)
Plugin 'scrooloose/syntastic'
"注释插件,评分最高
Plugin 'scrooloose/nerdcommenter'
"中文文档(asins/vimcdoc里面有)
"Plugin 'vimcn/NERD_commenter.cnx'
"command-T增强,模糊查找文件
Plugin 'kien/ctrlp.vim'
"The plugin is a front for ag(the_silver_searcher)
Plugin 'rking/ag.vim'
"Ack, 通过配置可以使用ag搜索
"Plugin 'mileszs/ack.vim'
"利用vundle把它下下来而已,非vim插件
"Plugin 'sgerrand/xfce4-terminal-colors-solarized'

"有lispbox就别老想着这东东了,巨麻烦~
"Plugin 'slimv.vim'

"for snipmate, 不过ultisnips默认支持
Plugin 'needle-wang/bootstrap-snippets'
"jinja2语法文件
"Plugin 'Glench/Vim-Jinja2-Syntax'
"垂直缩进线
"Plugin 'Yggdroot/indentLine'
"enable repeating supported plugin maps with "."
Plugin 'tpope/vim-repeat'


" All of your Plugins must be added before the following line
call vundle#end()             " required
filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

function Result_of_run(run_sign)
    "!ls这样运行, 显示的结果会切换到shell界面
    echo system(a:run_sign . shellescape(expand('%')))
endfunction

function Add_space()
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
            if &ft != 'python'
                inoremap <buffer> <CR> ;<CR>
            endif
        endif
        inoremap <buffer> + <space>+<space>
        inoremap <buffer> * <space>*<space>
        inoremap <buffer> % <space>%<space>
    endif
endfunction

function Template_py()
    let b:line = ['#!/usr/bin/env python', '# encoding: utf-8', '#', strftime("#%Y年 %m月 %d日 %A %H:%M:%S CST"), '', '']
    call append(0, b:line)
    let b:line = ["", "def main():", "    pass", "", "if __name__ == '__main__':", "    main()"]
    call append(line("$"), b:line)
    call cursor(6, 0)
endfunction

function Template_sh()
    let b:line = ['#!/bin/bash -', '#', strftime("#%Y年 %m月 %d日 %A %H:%M:%S CST"), '', '']
    call append(0, b:line)
    call cursor(5, 0)
endfunction

function Template_html()
    let b:line = ['html5', strftime("<!-- #%Y年 %m月 %d日 %A %H:%M:%S CST -->")]
    call append(0, b:line)
    normal dd
    call cursor(1, 5)
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
set cedit=<C-G>     "ex模式打开命令行窗口的键
set cursorline      "高亮光标所在行
set expandtab
set history=1000
set ignorecase
set keywordprg=     "禁用man,使用内置help
set laststatus=2    "让单窗口时也会出现lightline
set nobackup
set noswapfile
set number
set sessionoptions=blank,buffers,curdir,folds,options,tabpages,winsize,slash,unix,resize
set smartcase
set scrolloff=4     "光标上下两侧最少保留的屏幕行数
set shiftwidth=4    "自动缩进的空格数
set smarttab        "<BS>/<c-h>删除行首空格时一次将删shiftwidth多个
"放这好像被莫名覆盖了~
"set switchbuf=usetab,newtab
set tabstop=4       "<tab>占的空格数
set wildignore=*.o,*.obj,*~,*.pyc,*.pyo,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store   "文件补全时忽略下列文件
set wildmode=list:longest,full

"setlocal autochdir "与fugitive有冲突

let g:netrw_browsex_viewer = "google-chrome"

autocmd FileType javascript,html,css
            \| setlocal tabstop=2
            \| setlocal shiftwidth=2

autocmd FileType html set filetype=htmldjango

"大写的X键使用频率过小, 应该也可改
noremap          -  _
noremap          ;  :
noremap          :  ;
noremap          '  `
noremap          `  '
noremap <silent> \| :call NERDComment("n", "Comment")<CR>
"使特殊字符不用转义就默认变成正则含义(:h magic)
noremap          /  /\v
noremap <silent> *  *zz
noremap <silent> #  #zz
"高亮光标下的单词, 且光标坐标不变
noremap          &  mcHmt`c*`tzt`c
noremap    <space>  :nohl<CR><c-l>
"去行尾空格, tab, \r
noremap   ,<space>  mcHmt:%s/\s*[ \t\r]$//e<CR>`tzt`c
noremap <silent> j  gj
noremap <silent> k  gk
noremap <silent> n  nzz
noremap <silent> N  Nzz
noremap          P  "+gp
noremap          Q  :Ag!<CR>
noremap <silent> g* g*zz
noremap          g\ ms:up<CR>
"for hhkb
noremap          g3 moo<C-r>=strftime("#%Y年 %m月 %d日 %A %H:%M:%S CST")<CR><Esc>`o2j
noremap <silent> g8 :TagbarToggle<CR>
noremap <silent> gc :call NERDComment("n", "Comment")<CR>ms:up<CR>
noremap <silent> gC :call NERDComment("n", "Uncomment")<CR>ms:up<CR>
noremap <silent> gm :cal cursor(line("."), (col(".")+col("$"))/2)<CR>
noremap <silent> gM :cal cursor(line("."), col(".")/2)<CR>
noremap          gq :Ag!<space>
"for hhkb
noremap          gs ms:up<CR>

noremap          <F1> <Esc>
noremap          <F3> moo<C-r>=strftime("#%Y年 %m月 %d日 %A %H:%M:%S CST")<CR><Esc>`o2j
noremap          <F4> :Errors<CR>
noremap          <F5> :SyntasticCheck<CR>
noremap <silent> <F7> :NERDTreeToggle<CR>
noremap <silent> <F8> :TagbarToggle<CR>
noremap         <F12> :syntax sync fromstart<CR>

nnoremap t     "+y
nnoremap T     "+yy
nnoremap G     Gzz
nnoremap Y     y$
nnoremap cd    :lcd %:p:h<CR>
nnoremap co    2o<Esc>k
nnoremap cO    O<Esc>j
"g-与正常模式的u重复了, 还易按错
nnoremap g-    <nop>
nnoremap gf    <c-w>gf
nnoremap gz    :tabnew<space>
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap <silent> _ :tabm-1<CR>
nnoremap <silent> + :tabm+1<CR>
nnoremap <silent> gr    gT
nnoremap <silent> <c-h> gT
nnoremap <silent> <c-l> gt
nnoremap <silent> g[ :tabfirst<CR>
nnoremap <silent> g] :tablast<CR>
nnoremap <silent> gn :NERDTreeFind<CR>
nnoremap <silent> gN :NERDTree<CR>
nnoremap <silent> gh <c-w><c-h>
nnoremap <silent> gj <c-w><c-j>
nnoremap <silent> gk <c-w><c-k>
nnoremap <silent> gl <c-w><c-l>
nnoremap <silent> <c-j> <c-w><c-j>
nnoremap <silent> <c-k> <c-w><c-k>
nnoremap <silent> <C-Left>  :wincmd h<CR>
nnoremap <silent> <C-Down>  :wincmd j<CR>
nnoremap <silent> <C-Up>    :wincmd k<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>
nnoremap gb :tab sbp<CR>
nnoremap gy :tab sbn<CR>
nnoremap <Left> :tab sbp<CR>
nnoremap <right> :tab sbn<CR>

autocmd BufNewFile,BufRead *.py nnoremap <buffer> <F2> :up<CR>:call Result_of_run("python ")<CR>
autocmd BufNewFile,BufRead *.sh nnoremap <buffer> <F2> :up<CR>:call Result_of_run("bash ")<CR>

inoremap    vv  <Esc>"+gpa
inoremap <c-o>  <c-\><c-o>
inoremap <c-b>  <Left>
inoremap <c-f>  <Right>
inoremap <c-l>  <Del>
inoremap <c-s>  <Esc>ms:up<CR>a
inoremap <c-g>\ <Esc>ms:up<CR>a
"<c-/> doesn't work on gvim...
"inoremap <c-/> <c-o>:cnext<CR>
"inoremap <c-/> <c-o>:cprevious<CR>
autocmd BufNewFile,BufRead *.py inoremap <buffer> <F2> <Esc>:up<CR>:call Result_of_run("python ")<CR>
autocmd BufNewFile,BufRead *.sh inoremap <buffer> <F2> <Esc>:up<CR>:call Result_of_run("bash ")<CR>
inoremap <F1>  <Esc>
inoremap <F3>  <Esc>moo<C-r>=strftime("#%Y年 %m月 %d日 %A %H:%M:%S CST")<CR><Esc>`o2ja
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"有的中文标点不会触发
inoremap ,  ,<space>
inoremap ， ,<space>
inoremap :  :<space>
inoremap ： :<space>
inoremap 。 .<space>
inoremap ； ;<space>
inoremap “  "<space>
inoremap ”  "<space>
"用iabbrev需要空格或回车触发
"所以某些coding情况下iab不会触发
iabbrev none None
iabbrev true True
iabbrev false False

autocmd BufNewFile,BufRead * call Add_space()

"vmap应用于可视+选择模式, xmap只用于可视模式
xnoremap     t mc"+y`c
vnoremap    gj <c-w><c-j>
vnoremap    gk <c-w><c-k>
"ultisnips的片段使用了选择模式
xnoremap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
xnoremap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z
"选择模式没法映射好像~
"snoremap t <c-o>mc"+y`c

cabbrev   e1   e!
cabbrev   q1   q!
cabbrev  qa1   qa!
"cnoremap cwd   lcd %:p:h
"cnoremap cd.   lcd %:p:h
cnoremap <c-a> <Home>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-l> <Del>
command W :execute 'silent w !sudo tee % > /dev/null' | :e!

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
"另外,YouCompleteMe手册也说不要用<c-c>: vim手册说会中断一些自动命令
inoremap <silent> <c-c> <Esc>
"------ for fcitx --------

"------ for surround ------
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

"------ for emmet ------
let g:user_emmet_leader_key = '<F11>'
"emmet不能映射<Bar>, 会导致ultisnips失效
"不能用noremap, leaderkey会失效
map <c-n>  <F11>,
"<c-/>, <c-&>, <c-_>可生成
"还有一些特殊符号可改, 具体忘了
map      <F11>,
imap     <c-o><F11>,
"------ for emmet ------

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

"------ for easymotion ------
let g:EasyMotion_leader_key = ','
"------ for easymotion ------

"------ for YouCompleteMe ------
"vim中, <c-m>等价于Enter(<CR>)
"跳转到定义
"nnoremap <silent> <leader>g :YcmCompleter GoTo<CR>
nnoremap <silent>        go :YcmCompleter GoTo<CR>
let g:ycm_seed_identifiers_with_syntax = 1                       "语法关键字补全
let g:ycm_complete_in_comments         = 1                       "在注释中也启用补全
let g:ycm_goto_buffer_command          = 'new-or-existing-tab'   "设定跳转命令在哪里打开
let g:ycm_key_list_select_completion   = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_add_preview_to_completeopt   = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"上行无效~, 下行有效~, 老出问题
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"YouCompleteMe对不支持语义(semantic)补全的就会使用omnifunc, 如html
"启用范围为 黑名单在白名单中的补集
let g:ycm_filetype_blacklist = {
        \ 'tagbar'   : 1,
        \ 'qf'       : 1,
        \ 'notes'    : 1,
        \ 'unite'    : 1,
        \ 'text'     : 1,
        \ 'vimwiki'  : 1,
        \ 'pandoc'   : 1,
        \ 'infolog'  : 1,
        \ 'mail'     : 1,
        \ 'tar'      : 1,
        \ 'nerdtree' : 1,
        \}
"let g:ycm_filetype_whitelist = {
        "\ 'c'          : 1,
        "\ 'cpp'        : 1,
        "\ 'css'        : 1,
        "\ 'html'       : 1,
        "\ 'htmldjango' : 1,
        "\ 'htmljinja'  : 1,
        "\ 'java'       : 1,
        "\ 'javascript' : 1,
        "\ 'markdown'   : 1,
        "\ 'php'        : 1,
        "\ 'python'     : 1,
        "\ 'sh'         : 1,
        "\ 'snippets'   : 1,
        "\}
"------ for YouCompleteMe ------

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
"有时要加<C-P>上移, 有时又不要, 不清楚~
"autocmd FileType python inoremap <buffer> . .<C-X><C-O><C-P>

"docString的预览窗口会闪屏,所以要取消preview, 设成全局的更好些
set completeopt+=longest

"------ for UltiSnips ------
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
"------ for UltiSnips ------

"------ for xptemplate ------
"let g:xptemplate_nav_prev = '<c-k>'
"------ for xptemplate ------

"------ for bootstrap-snippets ------
"有YouCompleteMe, 不用设置就支持了
"set dictionary+=~/.vim/bundle/bootstrap-snippets/dictionary
"set complete+=k
"------ for bootstrap-snippets ------

"------ for syntastic ------
"手动检查, 主动模式会卡一会(pylint的原因,用pyflakes就好了)
let g:syntastic_mode_map       = { 'mode' : 'passive' }
let g:syntastic_error_symbol   = 'X>'
let g:syntastic_warning_symbol = '⚠'

let g:syntastic_check_on_wq = 0     "退出不检查
"主动模式与python-mode冲突, 导致有两次语法检查, 要么设成被动模式
"let g:pymode_lint_write = 0     "for python-mode
"出现错误自动打开错误位置列表, 没有出现则不打开
"let g:syntastic_auto_loc_list           = 1
let g:syntastic_always_populate_loc_list = 1                          "即时刷新错误位置(:Errors)列表!
let g:syntastic_quiet_messages           = {'level' : 'warnings'}     "去掉警告信息
let g:syntastic_python_checkers          = ['pyflakes']
"syntastic_java_checkers与eclim有冲突
"html检查要联网, 或自己架server~
"let g:syntastic_html_checkers       = ['w3']
"let g:syntastic_javascript_checkers = ['javascript']
"nnoremap gs :SyntasticCheck<CR>

function Syntastic_map(map_cmd1, map_cmd2)
    "下行可以用\<bar> 或 \|
    "nnoremap ]l :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(776\<bar>553\<bar>42\):/<bar>echo v:exception<bar>endtry<cr>
    try
        execute a:map_cmd1
    "下行用\<bar>会无效
    "catch /^Vim\%((\a\+)\)\=:E\%(776\<Bar>553\<Bar>42\):/
    "E776: no location list, E553: no more error item, E42: no error
    catch /^Vim\%((\a\+)\)\=:E\%(776\|553\|42\):/
        try
            up  "SyntasticCheck只能检查保存后的内容
            SyntasticCheck
            execute a:map_cmd2
        catch /.*/
            echo v:exception
        endtry
    catch
        echo v:exception
    endtry
endfunction
nnoremap <silent> [n :call Syntastic_map("lnext", "lfirst")<CR>
nnoremap <silent> [N :call Syntastic_map("lprevious", "llast")<CR>
"------ for syntastic ------

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
noremap      g<Bar>     :Tab /<Bar><CR>
"------ for tabular ------

"------ for tagbar ------
let g:tagbar_width = 37
"每打开相应文件就会弹出来,不好
"autocmd FileType python,java,cpp,c nested :TagbarOpen
"autocmd FileType python,java,javascript,cpp,c nested :TagbarOpen
"autocmd BufReadPost *.c,*.cpp,*.h,*.py,*.java,*.sh call tagbar#autoopen()
"let g:tagbar_autofocus   = 1    "打开tagbar时自动获取焦点
"let g:tagbar_autoshowtag = 0    "自动打开折叠
"let g:tagbar_sort        = 0    "标签按代码中的顺序排序
let g:tagbar_compact     = 1    "去掉含有<F1>的首行
let g:tagbar_indent      = 3    "修改tagbar内的缩进空间
let g:tagbar_singleclick = 1    "单击打开标签
set updatetime=700              "自动高亮当前tag的间隔时间，全局的
"------ for tagbar ------

"------ for eclim ------
"很完美,就是vim版eclipse,想受虐就用.
"保存时语法检查,巨快(syntastic完全比不上~)
"eclim默认会用pyflakes和python编译器验证语法,第一次检测没有pyflakes就不再用pyflakes
"let g:EclimPythonValidate = 0  "禁用保存文件时验证,.py不需要开eclimd
"有YouCompleteMe就不需要这个映射
"autocmd FileType java inoremap <buffer> . .<C-X><C-U>
"autocmd FileType java nnoremap <silent> <buffer> [i :JavaImportOrganize<cr>
"autocmd FileType java nnoremap <silent> <buffer> [d :JavaDocPreview<cr>
"autocmd FileType java nnoremap <silent> <buffer> [f :%JavaFormat<cr>
"autocmd FileType java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
"autocmd FileType java let g:EclimJavaCompleteCaseSensitive = 1
"autocmd FileType java let g:EclimCompletionMethod = 'omnifunc'
"------ for eclim ------

"------ for Vim-JDE" ------
"autocmd FileType java inoremap <buffer> . .<C-X><C-U>
"以这个为主(不支持"someStr".形式,编译后支持本类),javacomplete为辅
"set completefunc=VjdeCompletionFun
"let g:vjde_lib_path = "/opt/MyEclipse_10_0/Common/plugins/com.genuitec.eclipse.j2eedt.core_10.0.0.me201110301321/data/libraryset/EE_5/javaee.jar"
"let g:vjde_javadoc_path = "/opt/jdk1.6.0_38/sourcecode/"
"------ for Vim-JDE" ------

"------ for ctrlp ------
let g:ctrlp_regexp        = 1
let g:ctrlp_by_filename   = 1
let g:ctrlp_custom_ignore = {
    \ 'dir'  :  '\v[\/]\.(git|hg|svn|rvm)$' ,
    \ 'file' :  '\v\.(exe|so|dll|pyc|swp)$' ,
    \ }
"------ for ctrlp ------

"------ for ack.vim ------
"let g:ackprg = 'ag --nogroup --nocolor --column'
"------ for ack.vim ------

"------ for ag.vim ------
let g:ag_prg = 'ag --column --smart-case'
"------ for ag.vim ------

"------ for browserlink ------
"autocmd BufWritePost *.html :BLReloadPage
"1. run: ~/.vim/bundle/browserlink.vim/browserlink/start.sh
"要装nodejs, 并: sudo ln -s /usr/bin/nodejs /usr/bin/node
"2. 在页面中加上<script src='http://127.0.0.1:9001/js/socket.js'></script>
"下行写在browserlink.js里(将在chrome里的改动 动态写回 原文件中):
"window.__BL_OVERRIDE_CACHE = true
"------ for browserlink ------

"------ for vim-fugitive ------
nnoremap \g :Gstatus<CR>
"------ for vim-fugitive ------

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
        "在高分屏下要是字显小就调大些
        set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI,Consolas:h12:cANSI
        "win下中文(即双宽字体)需要gfw, ubuntu下中文应该是沿用guifont吧
        "比Bitstream显示效果要好(Bitstream要下载, win自带consolas)
        set guifontwide=Consolas:h12:cANSI
    else
        "Ubuntu下, Ubuntu Mono 比 Bitstream显示效果要好
        set guifont=Ubuntu\ Mono\ 18,Bitstream\ Vera\ Sans\ Mono\ 16
    endif
endif

