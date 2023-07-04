let g:ale_fix_on_save      = 1
let g:ale_linters_explicit = 1

let g:ale_sign_error         = '>>'
let g:ale_sign_warning       = '--'
let g:ale_sign_column_always = 1

let g:ale_set_quickfix          = 1
let g:ale_open_list             = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size      = 5

" Completion
let g:ale_completion_enabled    = 1
let g:ale_completion_autoimport = 1
set omnifunc=ale#completion#OmniFunc
