execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme dracula
set ts=4
set shiftwidth=4
set number relativenumber

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

inoremap qq <Esc>/<++><CR>"_c4l
nnoremap rr :so $MYVIMRC<Enter>

autocmd FileType html inoremap ;i <em></em><Space><++><Esc>Fe<Esc>cit
