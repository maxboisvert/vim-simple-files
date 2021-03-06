# Vim Simple Files

This is a simple file navigator and mru. Less than 100 lines of code.

## Installation

With `vim-plug`:
```
Plug 'maxboisvert/vim-simple-files'
```

Or use your prefered way.

## Usage

Use `:call SimpleFiles()` to lists available files.

Use `:call SimpleMru()` to lists recent files.

Add mapping for faster operations. Examples:
```
nnoremap <silent> <Leader>f :call SimpleFiles()<CR>
nnoremap <silent> <Leader>j :call SimpleMru()<CR>
```

Once the line is selected, press enter to go to the file.

# Config

The default command to list files uses git. You can change this command:

```vimf
" default is `"git ls-files --others --exclude-standard --cached"`
let g:vsf_command = 'ag -g ""'
```

## License

Copyright (c) 2016 Maxime Boisvert
