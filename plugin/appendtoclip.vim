function! <sid>ExecuteAppendToDefaultAndClipboard(delete) range
    let l:temp_z_reg=@z
    let @z=@"
    execute "silent " . a:firstline . "," . a:lastline . "y Z"
    if a:delete
        execute "silent " . a:firstline . "," . a:lastline . "d _"
    endif
    let @"=@z
    if index(split(&clipboard, ','), 'unnamed') != -1
        let @*=@z
    endif
    if index(split(&clipboard, ','), 'unnamedplus') != -1
        let @+=@z
    endif
    let @z=l:temp_z_reg
    try
        if a:delete
            call repeat#set("\<Plug>AppendToDefaultAndClipboardDelete", v:count)
        else
            call repeat#set("\<Plug>AppendToDefaultAndClipboardYank", v:count)
        endif
    catch
    endtry
endfunction

if !exists("g:appendtoclip_leader")
    let g:appendtoclip_leader='<Space>'
endif

nnoremap <silent> <Plug>AppendToDefaultAndClipboardYank 
            \:call <sid>ExecuteAppendToDefaultAndClipboard(0)<CR>
xnoremap <silent> <Plug>AppendToDefaultAndClipboardYank 
            \:call <sid>ExecuteAppendToDefaultAndClipboard(0)<CR>
nnoremap <silent> <Plug>AppendToDefaultAndClipboardDelete 
            \:call <sid>ExecuteAppendToDefaultAndClipboard(1)<CR>
xnoremap <silent> <Plug>AppendToDefaultAndClipboardDelete 
            \:call <sid>ExecuteAppendToDefaultAndClipboard(1)<CR>
execute 'nmap ' . g:appendtoclip_leader . 'yy <Plug>AppendToDefaultAndClipboardYank'
execute 'xmap ' . g:appendtoclip_leader . 'yy <Plug>AppendToDefaultAndClipboardYank'
execute 'nmap ' . g:appendtoclip_leader . 'dd <Plug>AppendToDefaultAndClipboardDelete'
execute 'xmap ' . g:appendtoclip_leader . 'dd <Plug>AppendToDefaultAndClipboardDelete'

