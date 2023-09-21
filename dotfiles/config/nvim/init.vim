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
set nowrapscan
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
set termguicolors
let g:onedark_color_overrides = {
\ "background": {"gui": "none", "cterm": "none"}
\}
colorscheme onedark
let g:lightline = {'colorscheme': 'one'}
set nu
set ls=2
set showcmd
set cursorline
set lazyredraw

" Key mapping
let mapleader=","
map <leader>i : ALEFix isort<cr>
map ö gcc
map Ö v: StripWhitespace<cr>
map ä "+
map Ä "0
map C :w<cr>,ll
cmap <S-Tab> <C-N>
cmap <Esc><S-Tab> <C-P>
map <C-l> gt
map <m-Tab> gt
map <C-h> gT
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
command Reload :source $MYVIMRC

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - https://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap <C-r> <Esc>:%s/<c-r>=GetVisual()<cr>/

" Fuzzy search ignored files
set wildignore+=*.pyc,*/build/lib/*,**/tmp/*,*.so,*.swp,*.zip,**/bower_components/*,**/node_modules/*

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=none ctermbg=none
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey15 ctermbg=none

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

" Python syntax f-string support
let g:python_highlight_all = 1

" Ale
let g:ale_virtualtext_cursor = 2
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
