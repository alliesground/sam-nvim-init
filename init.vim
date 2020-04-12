set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Install Plugins with Vim-plug
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'fishbullet/deoplete-ruby'
Plug 'chun-yang/auto-pairs' 

call plug#end()

let g:deoplete#enable_at_startup = 1

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
