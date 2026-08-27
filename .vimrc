vim9script

# Essential
set nocompatible
filetype off
filetype plugin indent on
syntax on

&encoding = 'utf-8'
g:mapleader = ' '

# Common
set nobackup
set noswapfile
set number
set relativenumber
set splitbelow
set splitright
set termguicolors
set hidden
set ttyfast
set lazyredraw

# Statusline
set laststatus=2
set statusline=%t\ %m%r\ %=%y\ %l,%c\ %P

# Indentation
set expandtab
set smartindent
set shiftwidth=4
set tabstop=4
set list
set listchars=lead:·,tab:··,trail:·

# Search
set ignorecase
set smartcase
set hlsearch
set incsearch

set wildignore=**/build/**,**/node_modules/**,*.class,**/target/**,*.o
set path=.,**

# Keymaps
nnoremap <leader>o :update<CR>:source<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>x :bd!<CR>
nnoremap <leader>h :noh<CR>
nnoremap <C-n> :Exp<CR>

# Commands
def Indent(width: number, expand: bool): void
    &l:expandtab = expand
    &l:shiftwidth = width
    &l:softtabstop = width
enddef

command! -nargs=1 Tabs call Indent(str2nr(<q-args>), false)
command! -nargs=1 Spaces call Indent(str2nr(<q-args>), true)

# Theme
highlight SpecialKey ctermfg=238 guifg=#bababa
