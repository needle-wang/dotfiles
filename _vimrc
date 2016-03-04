" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif



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
Plugin 'drmingdrmer/xptemplate'
"片段引擎, snipmate增强(未自带片段)
Plugin 'SirVer/ultisnips'
"snipmate和ultisnips的代码片段集
"Plugin 'honza/vim-snippets'
Plugin 'needle-wang/vim-snippets'
"snipmate与xptemplate快键不冲突,不支持嵌套,直接tab
"二者已停止更新~
"Plugin 'msanders/snipmate.vim'
"Plugin ''scrooloose/snipmate-snippets'
"语法检查器,保存文本时检查(即默认的主动模式)
"我可能并不需要syntastic
"Plugin 'scrooloose/syntastic'
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

"如字面意思, 但不知道怎么用~
"Plugin 'chrisgillis/vim-bootstrap3-snippets'
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


set nobackup
set noswapfile
set autoread
set number
"高亮光标所在行
set cursorline
set ignorecase
set smartcase
"光标上下两侧最少保留的屏幕行数
set scrolloff=4
"<tab>占的空格数
set tabstop=4
"自动缩进的空格数
set shiftwidth=4
"将tab扩展成空格,删除不好控制,还是不要~
set expandtab
"<BS>/<c-h>删除行首空格时一次将删shiftwidth多个
set smarttab
"禁用man,使用内置help
set keywordprg=
"补全时忽略下列文件
set wildignore=*.o,*.obj,*~,*.pyc,*.pyo,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
"让单窗口时也会出现lightline
set laststatus=2
"放这好像被莫名覆盖了~
"set switchbuf=usetab,newtab
"gvim去掉菜单
"set guioptions-=m
"gvim去掉工具栏
set guioptions-=T
let g:netrw_browsex_viewer= "google-chrome"

autocmd FileType javascript,html,css
            \| setlocal tabstop=2
            \| setlocal shiftwidth=2
autocmd FileType html set filetype=htmldjango

behave mswin

"还有一些特殊符号可改
"for emmet
let g:user_emmet_leader_key = 'gy'
map <c-n> gy,
"<c-/>, <c-&>, <c-_>可生成
map  gy,

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
noremap j gj
noremap k gk
noremap t "+y
noremap T "+yy
noremap P "+gp
noremap - _
noremap ; :
noremap : ;
noremap Q :Ag!<CR>
noremap gq :Ag!<space>
noremap <space> :nohl<CR><c-l>
"去行尾空格, tab, \r
noremap ,<space> mmHmt:%s/\s*[\t\r ]$//<CR>`tzt`m
"noremap <Bar> ms:up<CR>
noremap g\    ms:up<CR>
noremap <silent> gm :cal cursor(line("."), (col(".")+col("$"))/2)<CR>
noremap <silent> gM :cal cursor(line("."), col(".")/2)<CR>
"高亮光标下的单词, 且光标坐标不变
noremap & mmHmt`m*`tzt`m
noremap ' `
noremap ` '
noremap <silent> * *zz
noremap <silent> # #zz
noremap <silent> n nzz
noremap <silent> N Nzz
noremap <silent> g* g*zz

noremap <F1> <nop>
noremap <F3> o<C-r>=strftime("#%Y年 %m月 %d日 %A %H:%M:%S CST")<CR><C-[>j
noremap <F4> :Errors<CR>
"noremap <F5> :SyntasticCheck<CR>
noremap <silent> <F7> :NERDTreeToggle<CR>
noremap <silent> <F8> :TagbarToggle<CR>
noremap <F12> :syntax sync fromstart<CR>

nnoremap co 2o<c-[>k
nnoremap cO O<c-[>j
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap gz :tabnew<space>
nnoremap <silent> gr    gT
nnoremap <silent> <c-h> gT
nnoremap <silent> <c-l> gt
nnoremap <silent> g[ :tabfirst<CR>
nnoremap <silent> g] :tablast<CR>
nnoremap <silent> _ :tabm-1<CR>
nnoremap <silent> + :tabm+1<CR>
nnoremap <silent> gn :NERDTreeFind<CR>
nnoremap <silent> gN :NERDTree<CR>
nnoremap <silent> gc <c-w><c-c>
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
nnoremap <Left> :tab sbp<CR>
nnoremap <right> :tab sbn<CR>

function! Result_of_run(run_sign)
    "!ls这样运行会显示的是shell界面下的结果
    echo system(a:run_sign . shellescape(expand('%')))
endfunction
autocmd BufNewFile,BufRead *.py nnoremap <buffer> <F2> :up<CR>:call Result_of_run("python ")<CR>
autocmd BufNewFile,BufRead *.sh nnoremap <buffer> <F2> :up<CR>:call Result_of_run("bash ")<CR>

imap vv <c-[>Pa
imap  <c-o>gy,
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-l> <Del>
inoremap <c-s> <Esc>ms:up<CR>a
inoremap <c-g>\ <Esc>ms:up<CR>a
"<c-/> doesn't work on gvim...
"inoremap <c-/> <c-o>:cnext<CR>
"inoremap <c-/> <c-o>:cprevious<CR>
autocmd BufNewFile,BufRead *.py inoremap <buffer> <F2> <Esc>:up<CR>:call Result_of_run("python ")<CR>
autocmd BufNewFile,BufRead *.sh inoremap <buffer> <F2> <Esc>:up<CR>:call Result_of_run("bash ")<CR>
inoremap <F3> <C-r>=strftime("#%Y年 %m月 %d日 %A %H:%M:%S CST")<CR><C-[>j
"inoremap <F5> <c-o>:SyntasticCheck<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

inoremap ,  ,<space>
inoremap :  :<space>
inoremap ， ,<space>
inoremap 。 .<space>
inoremap ； ;<space>
inoremap ： :<space>
inoremap “  "<space>
inoremap ”  "<space>
"for debug
"exe '!echo -' &ft '->pool'
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
            if &ft != 'python'
                inoremap <buffer> <CR> ;<CR>
            endif
        endif
        inoremap <buffer> + <space>+<space>
        inoremap <buffer> * <space>*<space>
        inoremap <buffer> % <space>%<space>
    endif
endfunction

autocmd BufNewFile,BufRead * :call Add_space()

cnoremap <c-a> <Home>
cnoremap <c-f> <Right>
cnoremap <c-g> <c-f>
cnoremap <c-b> <Left>
cnoremap <c-l> <Del>

"for nerdtree
let NERDTreeMinimalUI  = 1
let NERDTreeMouseMode  = 2
"let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore     = ['\.vim$', '\~$', '\.pyc$', '\.ttf$']
"最后一个窗口是nerdtree时, 关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"自动打开nerdtree
"autocmd VimEnter * NERDTree | wincmd l

"for lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }
"让lightline嵌入tagbar中(默认支持nerdtree和ctrlp)
let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

"for solarized
let g:solarized_termcolors=256
let g:solarized_contrast="high"    "default value is normal
syntax enable
set background=dark
colorscheme solarized
"colorscheme desert 	"也不错
"set fillchars=vert:│   "必须要有,且必须是单宽字符
"禁掉主题提供的窗口分隔线背景
highlight VertSplit ctermbg=NONE guibg=NONE


"------乱码解决方案------
"设成utf-8后，win下处理非utf-8文件时就出现菜单和console乱码
"encoding: vim内部任何东西均使用此编码
set encoding=utf-8

"fileencodings: 探测文件编码时的顺序
"若写chinese而不写cp936(以gbk为基础),可能会识别成euc-cn(gb2312的表示方法),
"此时, 如果文件内有一些繁体或生僻字依然乱码,
"若无这些字,而增加这些字会保存不了(如 嚭 字)
set fileencodings=utf-8,cp936,latin-1
"fileencoding: 设置此缓冲区所在文件的字符编码, 保存时也以此为依据
if has("win32")
    set fileencoding=chinese   "要了解chinese, 可help一下
    "处理菜单及右键菜单乱码, only win, 因为encoding
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "处理vim的consle输出乱码, only win
    language messages zh_CN.utf-8
else
    set fileencoding=utf-8
endif

"termencoding是针对vim的, 管不到gvim
"用于键盘产生和终端显示的编码，在显示时，Vim 会把内部编码转换为屏幕编码
let &termencoding=&fileencoding
"------乱码解决方案------

"for fcitx
set ttimeoutlen=200
"fcitx不支持ctrl-c,它不支持ex模式
"另外,YouCompleteMe手册也说不要用<c-c>: vim手册说会中断一些自动命令
inoremap <silent> <c-c> <c-[>

"for easymotion
let g:EasyMotion_leader_key = ','
"for YouCompleteMe
"vim中, <c-m>等价于Enter(<CR>)
"inoremap <c-b> <c-x><c-o>
"设定跳转命令在哪里打开
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
"跳转到定义
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <silent> go :YcmCompleter GoTo<CR>
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"上行无效~, 下行有效~, 老出问题
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
"使用YouCompleteMe的白名单
let g:ycm_filetype_whitelist = {
        \ 'python'     : 1,
        \ 'java'       : 1,
        \ 'javascript' : 1,
        \ 'cpp'        : 1,
        \ 'c'          : 1,
		\}
"for vimango
"nnoremap gO :python main()<CR>jzz

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
set completeopt=longest,menu
"for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"for xptemplate
let g:xptemplate_nav_prev = '<c-k>'
""for syntastic
""手动检查, 主动模式会卡一会(pylint的原因,用pyflakes就好了)
"let g:syntastic_mode_map = { 'mode' : 'passive' }
"let g:syntastic_error_symbol = 'X>'
"let g:syntastic_warning_symbol = '⚠'
""退出不检查
"let g:syntastic_check_on_wq = 0
""主动模式与python-mode冲突,导致有两次语法检查, 要么设成被动模式
"let g:pymode_lint_write = 0
""出现错误自动打开错误位置列表,没有出现则不打开
""let g:syntastic_auto_loc_list = 1
""即时刷新错误位置(:Errors)列表!
"let g:syntastic_always_populate_loc_list=1
""去掉警告信息
"let g:syntastic_quiet_messages = {'level' : 'warnings'}
"let g:syntastic_python_checkers=['pyflakes']
""syntastic_java_checkers与eclim有冲突
""html检查要联网,或自己架server~
""let g:syntastic_html_checkers=['w3']
""let g:syntastic_javascript_checkers=['javascript']
"noremap gs :SyntasticCheck<CR>
noremap [n :lnext<CR>
noremap [N :lprevious<CR>
"for tabular
noremap      g/         :Tab /
noremap      g=         :Tab /=<CR>
noremap      g1         :Tab /!=<CR>
noremap      g2         :Tab /==<CR>
noremap      g,         :Tab /,<CR>
noremap      g"         :Tab /"<CR>
noremap      g'         :Tab /'<CR>
noremap      g:         :Tab /:<CR>
noremap      g<space>   :Tab / <CR>
noremap      g<Bar>     :Tab /<Bar><CR>

"for tagbar
let g:tagbar_width = 37
"每打开相应文件就会弹出来,不好
"autocmd FileType python,java,cpp,c nested :TagbarOpen
"autocmd FileType python,java,javascript,cpp,c nested :TagbarOpen
"autocmd BufReadPost *.c,*.cpp,*.h,*.py,*.java,*.sh call tagbar#autoopen()
"去掉含有<F1>的首行
let g:tagbar_compact = 1
"修改tagbar内的缩进空间
let g:tagbar_indent = 3
"标签按代码中的顺序排序
let g:tagbar_sort = 0
"打开tagbar时自动获取焦点
"let g:tagbar_autofocus = 1
"单击打开标签
let g:tagbar_singleclick = 1
"自动打开折叠
let g:tagbar_autoshowtag = 1
"自动高亮当前tag的间隔时间，全局的
set updatetime=700
"for eclim,很完美,就是vim版eclipse,想受虐就用.
"保存时语法检查,巨快(syntastic完全比不上~)
"eclim默认会用pyflakes和python编译器验证语法,第一次检测没有pyflakes就不再用pyflakes
"let g:EclimPythonValidate = 0	"禁用保存文件时验证,.py不需要开eclimd
"有YouCompleteMe就不需要这个映射
"autocmd FileType java inoremap <buffer> . .<C-X><C-U>
"autocmd FileType java nnoremap <silent> <buffer> [i :JavaImportOrganize<cr>
"autocmd FileType java nnoremap <silent> <buffer> [d :JavaDocPreview<cr>
"autocmd FileType java nnoremap <silent> <buffer> [f :%JavaFormat<cr>
"autocmd FileType java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
"autocmd FileType java let g:EclimJavaCompleteCaseSensitive = 1
"autocmd FileType java let g:EclimCompletionMethod = 'omnifunc'

"for Vim-JDE"
"autocmd FileType java inoremap <buffer> . .<C-X><C-U>
"以这个为主(不支持"someStr".形式,编译后支持本类),javacomplete为辅
"set completefunc=VjdeCompletionFun
"let g:vjde_lib_path = "/opt/MyEclipse_10_0/Common/plugins/com.genuitec.eclipse.j2eedt.core_10.0.0.me201110301321/data/libraryset/EE_5/javaee.jar"
"let g:vjde_javadoc_path = "/opt/jdk1.6.0_38/sourcecode/"
"for ctrlp
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
    \ 'dir'  :  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file' : '\v\.(exe|so|dll|pyc|swp)$',
    \ }
"for ack.vim
"let g:ackprg = 'ag --nogroup --nocolor --column'
"for ag.vim
let g:ag_prg = 'ag --column --smart-case'

"for browserlink
"autocmd BufWritePost *.html :BLReloadPage
"1. run: ~/.vim/bundle/browserlink.vim/browserlink/start.sh
"要装nodejs, 并: sudo ln -s /usr/bin/nodejs /usr/bin/node
"2. 在页面中加上<script src='http://127.0.0.1:9001/js/socket.js'></script>
"下午写在browserlink.js里(将在chrome里的改动 动态写回 原文件中):
"window.__BL_OVERRIDE_CACHE = true

"为一些特殊非通用的东西, 如只针对某些项目的配置
if filereadable(expand("~/.lvimrc"))
    source ~/.lvimrc
endif

