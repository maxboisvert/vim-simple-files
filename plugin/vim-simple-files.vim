if exists("g:loaded_vim_simple_files")
  finish
endif
let g:loaded_vim_simple_files = 1

let g:vsf_file = get(g:, 'vsf_file', ".vim-files")
let g:vsf_command = get(g:, 'vsf_command', "git ls-files --others --exclude-standard --cached")

augroup vsf
    autocmd!
    autocmd BufReadPost * silent! normal! g`"
    if !len(argv())
        set viminfo+=n.vim-viminfo-local
        autocmd VimEnter * nested silent! e #<1
    endif
augroup END

func! SimpleFiles()
    call system(g:vsf_command . " > " . g:vsf_file)
    e .vim-files

    setl buftype=nowrite nobuflisted bufhidden=hide noswapfile
    map <buffer> <silent> <CR> gf
endfunc

fun! SimpleMru()
    enew

    setl buftype=nowrite bufhidden=delete noswapfile
    map <buffer> <silent> <CR> gf

    wviminfo
    rviminfo!

    let files = []

    for oldfile in v:oldfiles
        let rel_file = fnamemodify(oldfile, ":.")

        if rel_file[0] == "/"
            continue
        endif

        call add(files, rel_file)
    endfor

    let output = join(files, "\n")
    put! = output

    :1
endfunc
