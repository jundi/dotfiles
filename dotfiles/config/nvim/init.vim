"vim: set ft=vimrc:

" Plugins
source ~/.config/nvim/plugins.vim

" General settings
filetype plugin indent on
set smarttab
set mouse=a
set backspace=2
set backupdir=~/.vimbackup
set wildmode=longest:list
set nowildmenu
set nomore
set modeline
set modelines=5
set hlsearch
set colorcolumn=+1
set list
set nojoinspaces
set formatoptions=tcqjro
set ignorecase
set smartcase
set splitbelow
set splitright

" Appearance
syntax on
let g:onedark_color_overrides = {
\ "background": {"gui": "none", "cterm": "none"}
\}
colorscheme onedark
set nu
set ls=2
set showcmd
set cursorline
set lazyredraw

" Key mapping
let mapleader=","
map ö gcc
map Ö v: StripWhitespace<cr>
map ä "+
map Ä "0
map C :w<cr>,ll
cmap <S-Tab> <C-N>
cmap <Esc><S-Tab> <C-P>
map <C-l> :tabnext<cr>
map <C-h> :tabprevious<cr>
map <C-q> :quit!<cr>
map <m-h> <C-W>h
map <m-l> <C-W>l
map <m-j> <C-W>j
map <m-k> <C-W>k
nnoremap x :Lnext<cr>
nnoremap X :Lprevious<cr>
map - <Plug>(expand_region_shrink)
let g:SuperTabMappingTabLiteral = "<m-tab>"

" custom commands
command XmlFormat :%! xmllint --format -
command JsonFormat :%! jq .
function SwitchPylint()
    if (g:ale_python_pylint_executable=="pylint")
        let g:ale_python_pylint_executable="pylint-3"
    else
        let g:ale_python_pylint_executable="pylint"
    endif
endfunction
command SwitchPylint :call SwitchPylint()

" Fuzzy search ignored files
set wildignore+=*.pyc,*/build/lib/*,**/tmp/*,*.so,*.swp,*.zip,**/bower_components/*,**/node_modules/*

" vim-indent-guides: Enable indent quide on startup
let g:indent_guides_enable_on_vim_startup = 1

" https://github.com/neovim/neovim/pull/7985
autocmd VimResized * redraw!

" completion
let g:SuperTabDefaultCompletionType = "context"
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
" smarter filename completion
inoremap <c-x><c-f><cmd>set isf-==<cr><c-x><c-f><cmd>set isf+==<cr>

" neovim in virtualenv
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Ternjs
let g:deoplete#sources#ternjs#tern_bin = 'ternjs'
let g:deoplete#sources#ternjs#filetypes = ['vue']
" fix 'Request from non-main thread.' error
call deoplete#custom#option('num_processes', 4)

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" Riv
let g:riv_fold_auto_update = 0

" Pylint
let g:ale_python_pylint_options = '--rcfile ~/.config/pylintrc'
" flake8
let g:ale_python_flake8_options = '--config ~/.config/flake8'
