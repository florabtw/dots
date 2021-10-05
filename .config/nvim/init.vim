set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

setl omnifunc=v:lua.vim.lsp.omnifunc

inoremap <Tab> <c-x><c-o>

lua require('config')
