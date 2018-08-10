# Vim Simple Files

This is a simple file chooser.

## Usage

```
nnoremap <silent> <Leader>f :call SimpleFiles()<CR>
```

Use `:call SimpleFiles()` to lists available files.

Press enter to go to the file.

The edited file is added to the history command, you can press `:e<Up>` to use this as a MRU.

## License

Copyright (c) 2016 Maxime Boisvert
