if exists("g:loaded_vim_simple_files")
  finish
endif
let g:loaded_vim_simple_files = 1

augroup vim_simple_files
    autocmd!
    autocmd BufRead .vim-files :call SimpleFilesBuffer()
    autocmd BufReadPost * silent! normal! g`"
    if !len(argv())
        set viminfo+=n.vim-viminfo-local
        autocmd vimrc VimEnter * nested silent! e #<1
    endif
augroup END

func! SimpleFilesBuffer()
    map <buffer> <silent> <CR> :call SimpleFilesHistoryEdit()<CR>
    setl buftype=nofile
endfunc

func! SimpleFiles()
    call system("git ls-files > .vim-files")
    e .vim-files
endfunc

func! SimpleFilesHistoryEdit()
    let command = "e " . getline('.')
    exec command
    call histadd("cmd", command)
endfunc
