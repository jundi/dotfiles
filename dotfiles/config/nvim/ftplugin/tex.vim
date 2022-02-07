" LaTeX
set grepprg=grep\ -nH\ $*	" find bibtex entries
let g:tex_flavor = "latex"
let g:Tex_AutoFolding = 0
let g:Tex_GotoError = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -interaction=nonstopmode $*'
