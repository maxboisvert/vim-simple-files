if exists("g:loaded_vim_simple_files")
  finish
endif
let g:loaded_vim_simple_files = 1

func! SimpleFiles()
    call system("git ls-files > .vim-files")
    e .vim-files
    " setl buftype=nofile

    map <buffer> <silent> <CR> :call SimpleFilesHistoryEdit()<CR>
endfunc

func! SimpleFilesHistoryEdit()
    let command = "e " . getline('.')
    exec command
    call histadd("cmd", command)
endfunc
