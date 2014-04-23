" 打开文件类型检测, vundle 要求必须关闭
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Official Mirror of UltiSnips trunk on LaunchPad. 
Bundle 'https://github.com/SirVer/ultisnips.git'
Bundle "honza/vim-snippets"
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" 增加自定义snippets
let g:UltiSnipsSnippetDirectories = ['CustomSnips', 'UltiSnips']

" JS代码格式化插件；
nnoremap <silent> <leader>_jb :call g:_Jsbeautify()<cr>
Bundle '_jsbeautify'

" vim plugins for HTML and CSS hi-speed coding
Bundle 'Emmet.vim'
" lean & mean status/tabline for vim that's light as air
Bundle 'https://github.com/bling/vim-airline.git'

" quoting/parenthesizing made simple
Bundle 'https://github.com/tpope/vim-surround.git'

" Fuzzy file, buffer, mru, tag, etc finder
"Bundle 'https://github.com/kien/ctrlp.vim.git'

" A code-completion engine for Vim
"Bundle 'https://github.com/Valloric/YouCompleteMe.git'

" tern for vim
"Bundle 'https://github.com/marijnh/tern_for_vim.git'

""" Vim plugin that displays tags in a window, ordered by class etc
""Bundle 'https://github.com/majutsushi/tagbar.git'
""nmap <leader>st :TagbarToggle<CR>
""
""" Inserts matching bracket, paren, brace or quote
""""Bundle 'https://github.com/vim-scripts/AutoClose.git'
""" Display function name in the title bar
""Bundle 'ctags.vim'
""
""" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
""" To automatically update the ctags file when a file is written
""" <C-]>, vim will jump to function’s definition
""" press <C-t> to climb back up the tree
"""Bundle 'taglist.vim'
""function! DelTagOfFile(file)
""  let fullpath = a:file
""  let cwd = getcwd()
""  let tagfilename = cwd . "/tags"
""  let f = substitute(fullpath, cwd . "/", "", "")
""  let f = escape(f, './')
""  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
""  let resp = system(cmd)
""endfunction
""function! UpdateTags()
""  let f = expand("%:p")
""  let cwd = getcwd()
""  let tagfilename = cwd . "/tags"
""  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
""  call DelTagOfFile(f)
""  let resp = system(cmd)
""endfunction
"""autocmd BufWritePost *.js call UpdateTags()
""autocmd BufWritePost *.php call UpdateTags()
"""set tags=./tags,tags
""

" 打开插件功能和缩进功能 vundle required
filetype plugin indent on
