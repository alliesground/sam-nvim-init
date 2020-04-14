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

" This unsets the 'last search pattern' register by hitting return"
nnoremap <CR> :noh<CR><CR>

" keymap for escaping NVIM Terminal mode to Normal mode
tnoremap <Esc> <C-\><C-n>

" Switching between split windows
tnoremap <c-w>h <c-\><c-n><c-w>h
tnoremap <c-w>j <c-\><c-n><c-w>j
tnoremap <c-w>k <c-\><c-n><c-w>k
tnoremap <c-w>l <c-\><c-n><c-w>l 

" highlight color
hi Search cterm=NONE ctermfg=black ctermbg=yellow

" Split into a new terminal instance (from terminal mode)
tnoremap <C-w>s <C-\><C-n><C-w><C-s> :terminal <CR>
tnoremap <C-w>v <C-\><C-n><C-w><C-v> :terminal <CR>

" Split into a new terminal instance (from nvim normal mode)
nnoremap <C-w>s <C-w>s :terminal <CR>
nnoremap <C-w>v <C-w>v :terminal <CR>

" Split new terminal instance at bottom (from nvim normal mode)
nnoremap <C-w>S <C-w>v <C-w>J :terminal <CR>

" Mapping for Nerdtreefocus cmd
nnoremap <leader>p :NERDTreeFocus <CR>

set splitbelow
set splitright

