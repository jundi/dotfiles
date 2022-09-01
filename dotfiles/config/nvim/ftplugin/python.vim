" Python intendation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=79
set fo-=t


map Ö v: BlackMacchiato<cr>

" enable pydocstyle linter, which is disabled by default
let b:ale_linters = ['pylint', 'flake8', 'pydocstyle']
