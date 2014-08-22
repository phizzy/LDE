" 该文件内所有的自定义快捷键，均以<Space>(空格键)唤醒
" 打开文件类型检测, vundle 要求必须关闭
filetype off

let iCanHanzVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHanzVundle=0
endif

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
nnoremap <silent> <Space>js :call g:_Jsbeautify()<cr>
Bundle '_jsbeautify'

" jshint
" 执行JSHint之后，如果vim没有强制刷新，control-L可强制刷新
if !executable('jshint')
    echo "Installing jshint..."
    echo ""
    silent !sudo npm install -g jshint
endif
Bundle 'jshint.vim'

" vim plugins for HTML and CSS hi-speed coding
Bundle 'Emmet.vim'
" lean & mean status/tabline for vim that's light as air
Bundle 'https://github.com/bling/vim-airline.git'

" quoting/parenthesizing made simple
Bundle 'https://github.com/tpope/vim-surround.git'

" Doxygen
Bundle 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'
let g:DoxygenToolkit_authorName="Hongjie Zhu"

" Markdown syntax
Bundle 'Markdown'

" Fuzzy file, buffer, mru, tag, etc finder
"Bundle 'https://github.com/kien/ctrlp.vim.git'

" A code-completion engine for Vim
"Bundle 'https://github.com/Valloric/YouCompleteMe.git'

" tern for vim
"Bundle 'https://github.com/marijnh/tern_for_vim.git'

" Inserts matching bracket, paren, brace or quote
""Bundle 'https://github.com/vim-scripts/AutoClose.git'


if !executable('ctags')
    echo "Installing ctags..."
    echo ""
    silent !sudo apt-get install ctags
endif
Bundle 'ctags.vim'
" To automatically update the ctags file when a file is written
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction
function! UpdateParentTags()
  let cwd = getcwd()
  let tname = "/tags"
  let parentPath = fnamemodify(cwd, ':h')
  let f = expand("%:p")
  while 1
      if parentPath=='/'
          break
      endif
      if filereadable(parentPath . tname)
          let cmd = 'ctags -a -f ' . parentPath . tname . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
          call DelTagOfFile(parentPath . tname)
          let resp = system(cmd)
      endif
      let parentPath = fnamemodify(parentPath, ':h')
  endwhile
endfunction
function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
"autocmd BufWritePost *.js call UpdateTags()
autocmd BufWritePost *.php call UpdateTags()
" 层级查找tags文件
set tags=./tags,tags


" <C-]>, vim will jump to function’s definition
" press <C-t> to climb back up the tree
Bundle 'taglist.vim'
let Tlist_Exit_OnlyWindow = 1 
let Tlist_Use_Right_Window = 1
"nmap <leader>st :TlistToggle<CR>
nnoremap <Space>stl :TlistToggle<CR>

if iCanHanzVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" 打开插件功能和缩进功能 vundle required
filetype plugin indent on

