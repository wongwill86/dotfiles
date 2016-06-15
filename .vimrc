"" ------------------------------ ENABLE VUNDLE ------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required sort:'a,. sort u
"Plugin 'Shutnik/jshint2.vim'
"Plugin 'skammer/vim-css-coloor'
Plugin 'HerringtonDarkholme/yats.vim' " enable typescript highlighting
Plugin 'JuliaLang/julia-vim' " ew julia
Plugin 'L9'
Plugin 'Lokaltog/vim-easymotion' " quick motion
Plugin 'SirVer/ultisnips' " allow snippets
Plugin 'Valloric/YouCompleteMe' "cd ~/.vim/bundle/YouCompleteMe... then ./install.py --clang-completer
Plugin 'VundleVim/Vundle.vim' "duh plugins
Plugin 'bling/vim-airline' "configures the bottom line
Plugin 'ervandew/supertab' " mainly to make ultisnips and ycm compatible with each other
Plugin 'honza/vim-snippets' " snippets to be used with ultisnips
Plugin 'jmcantrell/vim-virtualenv' "manages python virtual env
Plugin 'kien/ctrlp.vim.git'
Plugin 'mattn/emmet-vim' " super fast html and css blocking
Plugin 'mxw/vim-jsx' " vim highlighting that depends on pangloss js highlighting for react jsx
Plugin 'pangloss/vim-javascript' "javascript indentation fix
Plugin 'rdnetto/YCM-Generator' " autocomplete
Plugin 'scrooloose/nerdcommenter' " quick commenting
Plugin 'scrooloose/nerdtree' " file viewer
Plugin 'scrooloose/syntastic.git' " syntax checker
Plugin 'tpope/vim-fugitive' " git integration
Plugin 'tpope/vim-surround' " fast wrapping surrounding things like quotes and parens

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ---------------------------- VIM CUSTOMIZATION ----------------------------
set t_Co=256
colorscheme slate

syntax on
" turn on line numbering
set number

" set buffers to be hidden or something?
set hidden

" make vim try to detect file types and load plugins for them
filetype plugin on
filetype indent on

set encoding=utf-8
set fileencoding=utf-8

" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos
" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" Map leader to space!
let mapleader="\<Space>"
"
" map shortcuts to previous and next buffer
"noremap <C-i> :bp<CR>
"noremap <C-o> :bn<CR>

" Tab size
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

autocmd BufNewFile,BufRead *.py,*.jl
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
	\ set noexpandtab
autocmd BufNewFile,BufRead *.js,*.html,*.css,*.jsx,*.json,*.cpp,*.c,*.hpp,*.h
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab

" Search settings
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

" More undos
set undolevels=1000

" Use ; instead of : to save keypressing!
nnoremap ; :

" cursor needs visible lines above and below
set scrolloff=5

" Split movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Kill buffer keep split
map <leader>d :b#<bar>bd#<cr>

"set pastemode
set pastetoggle=<f9>

"remember more commands
set history=1000
set undolevels=1000

"highlight whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

" If doing a diff. Upon writing changes to file, automatically update the
" differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" show wdith of 80
set cc=80
"--------------------------- PLUGIN CUSTOMIZATION ---------------------------

" On file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
"   .twig files use html syntax
autocmd BufNewFile,BufRead *.twig setlocal ft=html
"   .less files use less syntax
autocmd BufNewFile,BufRead *.less setlocal ft=less
"   .jade files use jade syntax
autocmd BufNewFile,BufRead *.jade setlocal ft=jade
"   .ts are typescript js files
autocmd BufNewFile,BufRead *.ts setlocal ft=typescript

" NERDTREE!!
map <C-n> :NERDTreeToggle<cr>
"close vim if only nerdtree is open! doesn't seem to work with toggle
"autocmd bufenter * if (winnr("$") && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1

" CtrlP
nmap <leader>p :CtrlP<cr>
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
" nmap <leader>bs :CtrlPMRU<cr>
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['buffertag', 'tag', 'dir']

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<tab>', '<Down>'] "remap ycm for ultisnips
let g:ycm_key_list_previous_completion = ['<S-tab>', '<Up>'] "remap ycm for ultisnips
let g:ycm_seed_identifiers_with_syntax = 1 " autofill syntax
let g:ycm_autoclose_preview_window_after_completion=1 "close the stupid window after suggestions
let g:ycm_autoclose_preview_window_after_insertion=1 "close the stupid window after insert mode
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
noremap <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_server_log_level='debug'

" UltiSnips
let g:UltiSnipsExpandTrigger = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"****** code for ycm + ultisnip integration ******
" Enable tabbing through list of results
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>
"****** END code for ycm + ultisnip integration ******

"let g:SuperTabDefaultCompletionType = '<C-tab>'

" Vim-Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1 "enable tab to show oppen buffers
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '>'

" Syntastic
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_include_dirs = ['/usr/lib/x86_64-linux-gnu']
let g:syntastic_cpp_check_header = 1
let g:syntastic_javascript_checkers = ['eslint']

" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif

" vim-javascript
let g:javascript_enable_domhtmlcss = 1
" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" typescript-tools.vim
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
highlight SyntasticError ctermbg=DarkRed
