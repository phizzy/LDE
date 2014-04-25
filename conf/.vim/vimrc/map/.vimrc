"修改leader键为逗号"
let mapleader=",,"

"文件类型切换
nmap <leader>fj :set ft=javascript<CR>
nmap <leader>fc :set ft=css<CR>
nmap <leader>fh :set ft=html<CR>
nmap <leader>fm :set ft=mako<CR>

" 分屏尺寸切换
function! WindowAutoResize() 
    if &winwidth==20 || &winheight==1 || &winwidth==90 || &winheight==27 
        set nowinfixwidth nowinfixheight 
        set noequalalways eadirection=both 
        set winminheight=1 winminwidth=1 
        set winwidth=9999 winheight=999 
        set helpheight=999 cmdwinheight=999 previewheight=999
    else
        set nowinfixwidth nowinfixheight  " Defaults
        set equalalways eadirection=both  " Defaults
        set winminheight=0 winminwidth=1
        set winwidth=90 winheight=27
        set helpheight=20 cmdwinheight=7
    endif
endfunction

nnoremap <silent> <leader>gg :exec WindowAutoResize()<CR>

" Shift-Tab insert real tabs
inoremap <S-Tab> <C-V><Tab>

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" ctrl + space 映射到 ctrl+x ctrl+o 进行autocomplete
"imap <C-Space> <C-x><C-o>

