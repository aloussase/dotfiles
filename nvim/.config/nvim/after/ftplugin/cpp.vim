setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2

let b:ale_linters = ['clang-tidy', 'ccls']
let b:ale_fixers = ['clang-format']
