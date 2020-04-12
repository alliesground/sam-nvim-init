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

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" keymap for escaping NVIM Terminal mode to Normal mode
tnoremap <Esc> <C-\><C-n>

" Switching between split windows
tnoremap <c-w>h <c-\><c-n><c-w>h
tnoremap <c-w>j <c-\><c-n><c-w>j
tnoremap <c-w>k <c-\><c-n><c-w>k
tnoremap <c-w>l <c-\><c-n><c-w>l
