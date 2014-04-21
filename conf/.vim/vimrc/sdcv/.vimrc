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


