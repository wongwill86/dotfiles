"" ------------------------------ ENABLE VUNDLE ------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" set runtime to include fzf
set rtp+=~/.fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required sort:'a,. sort u
"Plugin 'Shutnik/jshint2.vim'
"Plugin 'skammer/vim-css-coloor'
Plugin 'HerringtonDarkholme/yats.vim' " enable typescript highlighting
Plugin 'JuliaLang/julia-vim' " ew julia
Plugin 'Konfekt/FastFold' " faster folding!
Plugin 'L9'
Plugin 'Lokaltog/vim-easymotion' " quick motion
Plugin 'Quramy/tsuquyomi' " typescript errors and stuff
Plugin 'Shougo/vimproc.vim.git' "  INSTALL: interactive command exection (for tsuquyomi ts highlighting ( must cd & make )
Plugin 'SirVer/ultisnips' " allow snippets
Plugin 'Valloric/YouCompleteMe' " INSTALL: cd ~/.vim/bundle/YouCompleteMe... then ./install.py --clang-completer --js-completer
Plugin 'VundleVim/Vundle.vim' " duh plugins
Plugin 'beyondmarc/glsl.vim' " glsl shading
Plugin 'bling/vim-airline' " INSTALL: configures the bottom line install fonts! https://github.com/powerline/fonts#quick-installation
Plugin 'editorconfig/editorconfig-vim' " xplatform style config
Plugin 'ervandew/supertab' " mainly to make ultisnips and ycm compatible with each other
Plugin 'fatih/vim-go' " golang duh
Plugin 'honza/vim-snippets' " snippets to be used with ultisnips
Plugin 'junegunn/fzf'  "  INSTALL: need to go to cd ~/.vim/bundle/fzf ... then ./install --all
Plugin 'junegunn/fzf.vim'
Plugin 'kien/ctrlp.vim.git'
Plugin 'majutsushi/tagbar' " tags in airline bar?
Plugin 'mattn/emmet-vim' " super fast html and css blocking
Plugin 'mileszs/ack.vim' " search
Plugin 'mxw/vim-jsx' " vim highlighting that depends on pangloss js highlighting for react jsx
Plugin 'pangloss/vim-javascript' "javascript indentation fix
Plugin 'python-mode/python-mode' " python mode
Plugin 'rdnetto/YCM-Generator' " autocomplete
Plugin 'scrooloose/nerdcommenter' " quick commenting
Plugin 'scrooloose/nerdtree' " file viewer
Plugin 'scrooloose/syntastic.git' " INSTALL: syntax checker. pip install pylama
Plugin 'thinca/vim-localrc' " local project rc
Plugin 'tmhedberg/SimpylFold' " use this instead of pymode folding
Plugin 'tpope/vim-fugitive' " git integration
Plugin 'tpope/vim-surround' " fast wrapping surrounding things like quotes and parens
Plugin 'universal-ctags/ctags' "  INSTALL: cd into directory ./autogen.sh; ./configure; make; make install
Plugin 'wesQ3/vim-windowswap.git' " <leader>ww to yank and swap splits!

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
set textwidth=120

autocmd BufNewFile,BufRead *.py,*.jl
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix
autocmd BufNewFile,BufRead *.ts,*.js,*.html,*.css,*.tsx,*.jsx,*.json,*.cpp,*.c,*.hpp,*.h
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab

autocmd BufNewFile,BufRead *.py
	\ nnoremap <buffer> <F8> :exec '!python' shellescape(@%, 1)<cr>

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
set listchars=tab:>.,trail:.,extends:#,nbsp:.,space:.
hi NonText ctermfg=8
hi SpecialKey ctermfg=8

"search highlight to be a bit more subtle
hi IncSearch ctermbg=8
hi Search ctermbg=8

" fix syntax syncing
autocmd BufEnter * :syntax sync fromstart

" If doing a diff. Upon writing changes to file, automatically update the
" differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" show width of 120. FOR PYTHON make sure pylama is set
autocmd FileType * set colorcolumn=120

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
" don't show swp files in nerdtree
let NERDTreeIgnore = ['\.swp$', '\.swo$', '\.pyc$']

" Including this code i can put in .local.vimrc to ignore patterns in folders
" let's ignore all the generated js files!
"let g:SrcJSRegex = '\(src\/.*\.js\)$'
"function! SrcJSFilter(params)
"	return substitute(a:params['path'].str(), 
"				\ a:params['nerdtree'].root.path.str(), '', 'g') =~ g:SrcJSRegex
"endfunction
"call NERDTreeAddPathFilter('SrcJSFilter')

" fzf
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'},'right:50%:hidden', '?'),
  \   <bang>0)
" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \   <bang>0 ? fzf#vim#with_preview('right:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" --files: List files that would be searched but do not search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
nmap <leader>t :Files!<cr>
nmap <leader>s :Rg!<cr>


" CtrlP
nmap <leader>p :CtrlPCurWD<cr>
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
" nmap <leader>bs :CtrlPMRU<cr>
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['buffertag', 'tag', 'dir']
let g:ctrlp_follow_symlinks=1
" ignore node_modules and jspm in ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|jspm_packages)|(\.(git|hg|svn|tox|ropeproject))$',
  \ 'file': '\v\.(exe|so|dll|swp|swo|pyc)$',
  \ }

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<tab>', '<Down>'] "remap ycm for ultisnips
let g:ycm_key_list_previous_completion = ['<S-tab>', '<Up>'] "remap ycm for ultisnips
let g:ycm_seed_identifiers_with_syntax = 1 " autofill syntax
let g:ycm_autoclose_preview_window_after_completion=1 "close the stupid window after suggestions
let g:ycm_autoclose_preview_window_after_insertion=1 "close the stupid window after insert mode
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
noremap <F2> :YcmCompleter GetDoc<CR>
noremap <F3> :YcmCompleter GoToDefinition<CR>
noremap <F4> :YcmCompleter GoToReferences<CR>
noremap <F5> :YcmCompleter GetType<CR>
let g:ycm_server_log_level='warn'
let g:ycm_server_python_interpreter = '/usr/bin/python' " specifying python version so it doesn't crash

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
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_powerline_fonts = 1

" Tagbar
nnoremap <silent> <F10> :TagbarToggle<CR>

" Syntastic
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_include_dirs = ['/usr/lib/x86_64-linux-gnu']
let g:syntastic_cpp_check_header = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_python_checkers = ['pylama']
" Navigate syntastic errors
map <leader>e :Errors<CR>
map <leader>q :lclose<CR>
map <leader>k :lprevious<CR>
map <leader>j :lnext<CR>

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

" ack-grep!
map <leader>a :Ack<Space>

" tsuquyomi
let g:tsuquyomi_disable_quickfix = 1

" python mode
"" Disable rope since YouCompleteMe has Jedi already
let g:pymode_rope_completion = 0 
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_lookup_project= 0
let g:pymode_rope_complete_on_dot = 0
" syntastic has python setup already
let g:pymode_lint = 0 
let g:pymode_lint_on_write = 0
let g:pymode_folding = 0 " disable pymode folding because it is too slow

" Fast folding 
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
