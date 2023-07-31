let g:fern#renderer = "nerdfont"

nno <leader>fe <Cmd>Fern -drawer -toggle -width=25 -right .<CR>

augroup fern
    autocmd!
    autocmd FileType fern setlocal nonumber | setlocal signcolumn=no
augroup END
