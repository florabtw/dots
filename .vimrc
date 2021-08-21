" Vim Plug

" Auto install if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'godlygeek/tabular'
Plug 'hail2u/vim-css3-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug'
Plug 'leafgarland/typescript-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'scrooloose/nerdtree'
Plug 'styled-components/vim-styled-components'
Plug 'townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
call plug#end()

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

" Remap splits for ease of use
noremap <C-H> <C-W><C-H>
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>

" Leader key is SPACE
let mapleader = " "

" Make backspace work
set backspace=2

" Indent if already indented
set autoindent

" auto indent on these words
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Wrapping and tabs.
set tw=80 ts=2 sw=2 sta et sts=2 ai fo+=t

" Line numbers
set number

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" PLEASE STOP BEEPING OMG
set visualbell
set t_vb=

" Keep 5 line padding on cursor
set scrolloff=5

" keyword highlighting
syntax on

" Color column at 81
set colorcolumn=81
au BufNewFile,BufRead *.scala set colorcolumn=130

" set color scheme to solarized
syntax on
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

" to keep whitespace highlighting on recognized file types
au FileType * highlight WhitespaceEOL ctermbg=240 guibg=red

" md means markdown
au BufNewFile,BufReadPost *.md set filetype=markdown

" Sudo Write
command! -nargs=0 Sw w !sudo tee % > /dev/null

" Panes should split to the right, or to the bottom
set splitbelow
set splitright

" NERDTree Remaps
map <C-n> :NERDTreeFind<CR>
map <C-m> :NERDTreeToggle<CR>

" FZF Remaps
nnoremap <silent> <c-p> :GFiles<CR>

" JS Import
let g:js_file_import_use_fzf = 1

" Gutentags
let g:gutentags_cache_dir="~/.tags"

" Prettier autoformat
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0

" CoC Configuration
set encoding=utf-8
set updatetime=300
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-styled-components' ]

nmap <leader>ca  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CoC Autocomplete
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
