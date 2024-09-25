set nocompatible              " be iMproved, required
filetype off                  " required
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags   
let mapleader = " "
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'preservim/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
colorscheme atom
syntax on
set t_Co=256

set foldmethod=indent
set foldlevel=99

"mine personlige remaps
"til folding:
nnoremap <leader>pv :NERDTreeFind<CR>
"til autocomplete
inoremap ½ <c-n>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>fs :Lines<CR>
nnoremap <leader>ps :Rg<CR>
nnoremap <leader>b :Buffer<CR>
nnoremap ½ $
nnoremap <leader>w :w<CR>


"js eslint commands
nmap <silent> <leader>gd :YcmCompleter GoTo<CR>
nmap <leader>gi :YcmCompleter GoToImplementation<CR>
nmap <leader>fr :YcmCompleter GoToReferences<CR>
nmap <leader>r :YcmCompleter RefactorRename 

au BufNewFile, BufRead *.py
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=160
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

let g:ale_disable_lsp = 1
let g:ale_fixers = {
    \   'javascript': ['eslint'],
    \}
let g:ale_linters = {
    \   'javascript': ['eslint', 'tsserver'],
    \   'python': ['flake8'],
    \}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ale_python_pylint_options='--disable=C0103'
let g:ale_python_pylint_options='--disable=C0301'

let g:NERDTreeWinPos = "right"
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'S',
                \ 'Untracked' :'untracked',
                \ 'Renamed'   :'renamed',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'D',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

set number relativenumber
set clipboard=unnamed
