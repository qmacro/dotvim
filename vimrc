execute pathogen#infect()
set nocompatible
syntax on
filetype plugin indent on
colorscheme dracula
set encoding=utf-8
set ts=4
set shiftwidth=4
set number relativenumber
set splitbelow splitright

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
