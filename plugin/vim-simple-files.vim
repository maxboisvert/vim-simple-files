if exists("g:loaded_vim_simple_files")
  finish
endif
let g:loaded_vim_simple_files = 1

let g:vsf_file = get(g:, 'vsf_file', '.vim-vsf')
let g:vsf_command = get(g:, 'vsf_command', "git ls-files --others --exclude-standard --cached")

augroup vsf
    autocmd!

    autocmd BufReadPost * silent! normal! g`"
    exec "autocmd BufRead " . g:vsf_file . " :call BufferSettings()"

    if !len(argv())
        set viminfo+=n.vim-viminfo-local
        autocmd VimEnter * nested silent! e #<1
    endif
augroup END

func! SimpleFiles()
    exec "edit! " . g:vsf_file
    call system("git ls-files --others --exclude-standard --cached > .vim-vsf &")
endfunc

func! BufferSettings()
    setl buftype=nofile nobuflisted bufhidden=hide
    map <buffer> <silent> <CR> gf
endfunc

fun! SimpleMru()
    wviminfo | rviminfo!
    enew
    0put =v:oldfiles
    silent exec '%s?' . getcwd() . '/??e'
    silent exec '%g/^[./]/d'
    call s:BufferSettings()
    setl bufhidden=delete
    0
endfunc
