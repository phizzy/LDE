" 该文件内所有的自定义快捷键，均已<Space>(空格键)唤醒
" 光标取词
function! Get_cursor_word() 
    let expl=system('sdcv --utf8-output --data-dir=~/stardict/dic -n ' . 
                \  expand("<cword>")) 
    windo if 
                \ expand("%")=="diCt-tmp" | 
                \ q!|endif 
    25vsp diCt-tmp 
    setlocal buftype=nofile bufhidden=hide noswapfile 
    1s/^/\=expl/ 
    1 
endfunction 

let sdcv_readme=expand('~/.stardict/dic/README.md')
if !filereadable(sdcv_readme)
    echo "Downloading SDCV dict..."
    echo ""
    silent !sudo apt-get update
    silent !sudo apt-get install sdcv
    silent !git clone https://github.com/pihizi/sdcv-dict.git ~/.stardict/dic
endif

nmap <Space>fy :call Get_cursor_word()<CR>


