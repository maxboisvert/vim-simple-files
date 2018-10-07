if exists("g:loaded_vim_simple_files")
  finish
endif
let g:loaded_vim_simple_files = 1

let g:vsf_file = get(g:, 'vsf_file', ".vim-files")
let g:vsf_command = get(g:, 'vsf_command', "git ls-files --others --exclude-standard --cached")

augroup vsf
    autocmd!
    exec "autocmd BufRead " g:vsf_file . " :call s:SimpleFilesBuffer()"
    autocmd BufReadPost * silent! normal! g`"
    if !len(argv())
        set viminfo+=n.vim-viminfo-local
        autocmd VimEnter * nested silent! e #<1
    endif
augroup END

func! s:SimpleFilesBuffer()
    map <buffer> <silent> <CR> :call <SID>SimpleFilesEdit()<CR>
    setl buftype=nofile
    setl nobuflisted
endfunc

func! SimpleFiles()
    call system(g:vsf_command . " > " . g:vsf_file)
    e .vim-files
endfunc

func! s:SimpleFilesEdit()
    let command = "e " . getline('.')
    exec command
    call histadd("cmd", command)
endfunc
