execute pathogen#infect()
set nocompatible
syntax on
filetype plugin indent on

" Fix broken colorscheme (see https://github.com/dracula/vim/issues/65)
let g:dracula_italic=0

colorscheme dracula
set encoding=utf-8
set ts=4
set shiftwidth=4
set number relativenumber
set splitbelow splitright
set linebreak

let mapleader = ","

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Prevent any use of the cursor keys by mapping them to 'no operation'
noremap <Up>    <nop>
noremap <Down>  <nop>
noremap <Left>  <nop>
noremap <Right> <nop>

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use of NERDTree (setting the NodeDelimiter fixes a recent issue with ^G displaying ... see
" https://www.reddit.com/r/vim/comments/a4yzyt/g_characters_prefixing_directory_and_file_names/
" for details of problem and fix).
nnoremap <leader>n :NERDTreeToggle<cr>
let g:NERDTreeNodeDelimiter = "\u00a0"

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" Automatically turn on auto-save for markdown files (so I can live preview them)
autocmd FileType markdown let g:auto_save = 0

" Integrate Limelight with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Shortcutting split navigation, saves a keypress
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remap Esc to save wear on left hand!
:inoremap jk <esc>

" When in insert mode, jump to next <++> marker (see helpers later)
inoremap qq <Esc>/<++><CR>"_c4l

" Edit and source .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" Remove all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Check leading whitespace
set listchars=tab:▸·,eol:¬
nnoremap <leader>l :set list!<cr>

" Markdown helpers
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA

" Abbreviations
iabbrev scp SAP Cloud Platform
iabbrev s4h S/4HANA
iabbrev sbs side-by-side
iabbrev s4s S/4HANA Cloud SDK

" To enable project/folder specific vimrc settings
" (see https://andrew.stwrt.ca/posts/project-specific-vimrc/)
set exrc

set runtimepath+=/usr/local/bin
set runtimepath+=~/.vim/bundle/languageclient
set hidden
autocmd BufRead,BufNewFile *.cds setfiletype cds
set signcolumn=yes
let g:LanguageClient_serverCommands = {
	\ 'cds': [expand('~/.vim/bundle/languageclient/startcdslsp')]
	\ }
