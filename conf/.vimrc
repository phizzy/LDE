" .vimrc中有很多<>括起来的符号，比如<C-S-A>等，如果不懂，:help keycodes
" :hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=cyan guibg=darkred guifg=white " 显示鼠标行
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" set statusline=%F%*\ %y[%{&fenc}]\ %2*%r%m%*\ %l,%c\ %=%l/%L\ (%p%%)%*\%{strftime('%Y-%m-%d-%H:%M')}
" set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\    " 设置在状态行显示的信息

colorscheme pablo                " 设定配色方案 /usr/share/vim/vim73/colors/
" set color
set t_Co=256
set autochdir               " 自动切换当前目录为当前文件所在的目录
set autoindent                           " 设置自动缩进功能
set autoread                      " 设置自动读取配置文件
set background=dark " 设置背景颜色
set backspace=indent,eol,start  " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set backupcopy=yes          " 设置备份时的行为为覆盖
set cmdheight=1             " 设定命令行的行数为 1
set complete-=k complete +=k
set cursorcolumn
set cursorline              " 突出显示当前行

" set backupdir=/tmp " save .swp files
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
    :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
    :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
" :help undo-persistence
" This is only present in 7.3+
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo//
    set undodir+=~/.vim/undo//
    set undofile
endif

" set encoding=utf-8
" set fileencodings=utf-8,gb2312,gbk
set fileformats=unix,dos,mac
set foldclose=all           " 设置为自动关闭折叠                           
set foldcolumn=0            " 设置折叠区域的宽度
" set foldenable              " 开始折叠
" set foldmethod=syntax       " 设置语法折叠
" set foldmethod=indent     " 缩进折叠
set gfn=Monospace\ 10       " 设置默认字体
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set history=1000            " 设置保留的历史行
set hlsearch                " 搜索时高亮显示被找到的文本
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch               " 输入搜索内容时就显示搜索结果
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set magic                   " 设置魔术
set matchtime=2             " 短暂跳转到匹配括号的时间
set mouse=a                 " 鼠标支持
set nobackup                " 覆盖文件时不备份
set nocompatible            " 关闭 vi 兼容模式
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set nowb
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set number                  " 显示行号
set pastetoggle=<F4>        " 在粘贴前, 需要先按一下F4键, 这时左下角会出现INSERT (paste)的提示, 然后再粘贴文本, 就不会因为自动缩进导致格式混乱了
set ruler                   " 打开状态栏标尺
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
" set spell                 " 拼写检查
" set smartindent             " 开启新行时使用智能自动缩进
set smarttab
set expandtab
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set t_vb=                   " 置空错误铃声的终端代码
set termencoding=utf-8
set viminfo='10,\"100,:20,%,n~/.viminfo
set wildmenu
set nowrap                               "Wrap lines
setlocal foldlevel=1        " 设置折叠层数为
syntax on                   " 自动语法高亮

" Shift-Tab insert real tabs
inoremap <S-Tab> <C-V><Tab>


"-----------------------------------------------------------------
" return OS type, eg: windows, or linux, mac, et.st..
"-----------------------------------------------------------------
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction
" 用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif

" 当vimrc文件被修改时，立即生效
autocmd! bufwritepost .vimrc source ~/.vimrc

" 连续撤销设置
try
       set undodir=~/.vim/undodir
       set undofile
catch
endtry

"修改leader键为逗号"
let mapleader=",,"

"文件类型切换
nmap <leader>fj :set ft=javascript<CR>
nmap <leader>fc :set ft=css<CR>
nmap <leader>fh :set ft=html<CR>
nmap <leader>fm :set ft=mako<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" 光标取词
function! Get_cursor_word() 
    let expl=system('sdcv -n ' . 
                \  expand("<cword>")) 
    windo if 
                \ expand("%")=="diCt-tmp" | 
                \ q!|endif 
    25vsp diCt-tmp 
    setlocal buftype=nofile bufhidden=hide noswapfile 
    1s/^/\=expl/ 
    1 
endfunction 
nmap F :call Get_cursor_word()<CR>

" To automatically update the ctags file when a file is written
" <C-]>, vim will jump to function’s definition
" press <C-t> to climb back up the tree
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction
function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.js call UpdateTags()

" 打开文件类型检测, vundle 要求必须关闭
filetype off
" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" JS代码格式化插件；
" nnoremap <silent> <leader>_ff :call g:_Jsbeautify()<cr>
Bundle '_jsbeautify'
" vim plugins for HTML and CSS hi-speed coding
" Bundle 'Emmet.vim'
" lean & mean status/tabline for vim that's light as air
Bundle 'https://github.com/bling/vim-airline.git'
" Fuzzy file, buffer, mru, tag, etc finder
"Bundle 'https://github.com/kien/ctrlp.vim.git'
" A code-completion engine for Vim
Bundle 'https://github.com/Valloric/YouCompleteMe.git'
" tern for vim
Bundle 'https://github.com/marijnh/tern_for_vim.git'
" Official Mirror of UltiSnips trunk on LaunchPad. 
Bundle 'https://github.com/SirVer/ultisnips.git'
" YCM和ultisnips快捷键冲突
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" 增加自定义snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "CustomSnips"]
" Vim plugin that displays tags in a window, ordered by class etc
Bundle 'https://github.com/majutsushi/tagbar.git'
nmap <leader>st :TagbarToggle<CR>
" quoting/parenthesizing made simple
Bundle 'https://github.com/tpope/vim-surround.git'
" Inserts matching bracket, paren, brace or quote
""Bundle 'https://github.com/vim-scripts/AutoClose.git'

" 打开插件功能和缩进功能 vundle required
filetype plugin indent on
