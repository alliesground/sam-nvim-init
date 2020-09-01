set nocompatible
filetype off
"set runtimepath+=~/.vim,~/.vim/after
"set packpath+=~/.vim
"source ~/.vimrc

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Install Plugins with Vim-plug
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'fishbullet/deoplete-ruby'
Plug 'chun-yang/auto-pairs' 
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'
Plug 'bling/vim-airline'
Plug 'preservim/nerdtree'
Plug 'wadackel/vim-dogrun'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-surround'

call plug#end()

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
syntax on
set t_Co=256
let macvim_skip_colorscheme=2
":colorscheme CandyPaper
":colorscheme solarized
set background=dark
set number
let g:netrw_liststyle=3 
set guicursor+=a:blinkon0
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//
let g:netrw_localrmdir="rm -r" 
set mouse=a


"mapping space+k to open explorer
let mapleader= "\<Space>"
map <leader>k :Explore<cr>

"The Silver Searcher
if executable('ag')
  "Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

"Use space+s to save the file"
nmap <leader>s :w<cr>

"Use space_w to close the file"
nmap <leader>w :q<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "Dispatch rspec {spec}"

" Open NerdTree automatically when Vim starts
autocmd vimenter * NERDTree

" Mappgin Ctrl+n to open NerdTree
map <C-n> :NERDTreeToggle<CR>

" Close Vim if the only window left open is a NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Default Arrow for NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

colorscheme dogrun

"deoplete.nvim config
let g:deoplete#enable_at_startup = 1
set completeopt=menu,noinsert,menuone

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
nnoremap <leader>f :NERDTreeFocus <CR>

set splitbelow
set splitright

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
