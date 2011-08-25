

nnoremap @ :Cmd<space>
vnoremap @ :Cmd<space>

" calls ~/bin/cmd.py
func! CmdWithMeta(arg)
    " do meaningless edit and erase it so if cmd is undone, the cursor pos
    " will not be lost
    let r = line('.') - 1
    let c = col('.')
    " let vs = [a:firstline, a:lastline]
    norm ix
    norm x
    " save cursor and window pos
    norm mkHml
    silent! exec '%!~/bin/cmd.py "' . join([a:arg . '"', r, c], ' ')
    " restore cursor and window pos
    norm `lzt`k
    " TODO: cant change the cursor position using external script
    " Possible solution: have return val from script include new cursor 
    " pos. Extract it and then set it here.
endfunc
command! -nargs=1 Cmd call CmdWithMeta(<q-args>)


