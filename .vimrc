" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'Chiel92/vim-autoformat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-sleuth'
Plugin 'prettier/vim-prettier'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on
" End Vundle

" Remap movement for Colemak
noremap n j
noremap e k
noremap i l
noremap k n
noremap s i
noremap j e

" Remap splits for Colemak / Ease of Use
noremap <C-H> <C-W><C-H>
noremap <C-N> <C-W><C-J>
noremap <C-E> <C-W><C-K>
noremap <C-I> <C-W><C-L>

" Remap l as end of 'line' key
nnoremap l $
nnoremap <C-l> J

" Destroy arrow keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Make arrow keys useful
noremap <Up> ddkP
noremap <Down> ddp
noremap <Left> <<
noremap <Right> >>
vmap <Left> <gv
vmap <Right> >gv

" Brace completion
inoremap {<CR> {<CR>}<Esc>ko

" Paren + Brace completion
inoremap ({<CR> ({<CR>});<Esc>ko

" Make backspace work
set backspace=2

" Indent if already indented
set autoindent

" auto indent on these words
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Wrapping and tabs.
set tw=160 ts=4 sw=4 sta et sts=4 ai

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=240 guibg=red
match WhitespaceEOL /\s\+$/

" Line numbers
set number

" PLEASE STOP BEEPING OMG
set visualbell
set t_vb=

" Keep 5 line padding on cursor
set scrolloff=5

" keyword highlighting
syntax on

" Color column at 81
set colorcolumn=81

" set color scheme to solarized
syntax on
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

" to keep whitespace highlighting on recognized file types
au FileType * highlight WhitespaceEOL ctermbg=240 guibg=red

" md means markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" JSX highlighting
let g:jsx_ext_required=0

" Panes should split to the right, or to the bottom
set splitbelow
set splitright

" NERDTree Remaps
let NERDTreeMapOpenExpl='\t'
