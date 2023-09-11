setlocal tabstop=8
setlocal shiftwidth=4
setlocal softtabstop=4

let b:ale_linters = ['clang-tidy', 'ccls']
let b:ale_fixers = ['clang-format']
