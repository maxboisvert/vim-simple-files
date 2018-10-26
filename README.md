# Vim Simple Files

This is a simple file chooser and mru.

## Usage

Use `:call SimpleFiles()` to lists available files.

Add mapping for faster ops:
```
nnoremap <silent> <Leader>f :call SimpleFiles()<CR>
nnoremap <silent> <Leader>j :call SimpleMru()<CR>
```

Once the line is selected, press enter to go to the file.

## License

Copyright (c) 2016 Maxime Boisvert
