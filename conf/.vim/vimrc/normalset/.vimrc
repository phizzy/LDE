" .vimrc中有很多<>括起来的符号，比如<C-S-A>等，如果不懂，:help keycodes
" :hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=cyan guibg=darkred guifg=white " 显示鼠标行
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" set statusline=%F%*\ %y[%{&fenc}]\ %2*%r%m%*\ %l,%c\ %=%l/%L\ (%p%%)%*\%{strftime('%Y-%m-%d-%H:%M')}
" set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\    " 设置在状态行显示的信息

colorscheme pablo                " 设定配色方案 /usr/share/vim/vim73/colors/

set t_Co=256
set autochdir               " 自动切换当前目录为当前文件所在的目录
set autoindent                           " 设置自动缩进功能
set autoread                      " 设置自动读取配置文件
set background=dark " 设置背景颜色
set backspace=indent,eol,start  " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set backupcopy=yes          " 设置备份时的行为为覆盖
set cmdheight=1             " 设定命令行的行数为 1
set complete-=k complete +=k
set cursorcolumn            " 突出显示当前列
set cursorline              " 突出显示当前行

set encoding=utf-8
" set fileencodings=utf-8,gb2312,gbk
set fileformats=mac,unix,dos
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

" 当vimrc文件被修改时，立即生效
autocmd! bufwritepost .vimrc source ~/.vimrc

