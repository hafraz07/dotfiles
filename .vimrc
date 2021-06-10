" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'itchyny/lightline.vim'
Plug 'sickill/vim-pasta'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-syntastic/syntastic'
Plug 'jesseleite/vim-noh'
Plug 'vim-scripts/AutoComplPop'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vimwiki/vimwiki'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
call plug#end()

set nocompatible
set termguicolors
syntax on
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set bg=dark
set number
set relativenumber                                 " Show relative line numbers for ease of composing commands
set clipboard=unnamed                              " Share clipboard with OS
set mouse=a                                        " Automatically enable mouse usage
set mousehide                                      " Hide the mouse cursor while typing
set autoindent
set history=200                                    " Increase cmdline stored history limit
set showcmd
set hls is                                         " Highlight all pattern matches WHILE typing the pattern
set splitright                                     " Puts new vsplit windows to the right of the current
set splitbelow                                     " Puts new split windows to the bottom of the current
set nowrap                                         " Do not wrap long lines
set foldenable                                     " Auto fold code
set path+=**                                       " Recursive search on subdirectories using find, tabfind etc
set vb t_vb=                                       " Disable screen flashing on error.
set scrolloff=8                                    " Scroll down if cursor is < 8 lines from the bottom of the screen
set hidden

set ignorecase
set smartcase                                      " Show both case letters when searching with lowercase but only uppercase if searching with uppercase
set laststatus=2                                   " Enable status bar
set noshowmode                                     " No need for it once you have status bar
set wildmenu                                       " Show list instead of just completing
set wildmode=list:longest,full                     " Command <Tab> completion, list matches, then longest common part, then all.
set omnifunc=syntaxcomplete#Complete               " Language aware syntax completion <C-x><C-O>
set completeopt=menu,longest

set softtabstop=4                                  " Show existing tab with 4 spaces width
set shiftwidth=4                                   " When indenting with '>', use 4 spaces width
set expandtab                                      " On pressing tab, insert 4 spaces
set colorcolumn=80                                 " Make it obvious where 80 characters is
filetype plugin indent on

let g:syntastic_python_checkers = ['pylint', 'pycodestyle', 'pydocstyle']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = {
    \ "mode": "passive",}
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" let g:instant_markdown_autostart = 1

let mapleader = " "
nnoremap <leader>p :find<Space>
" Map <C-P> to find
nnoremap <C-P> :b<Space>
" Switch to alternate buffer
nnoremap <leader>b :b#<CR>
" Vimgrep keymap
nnoremap <C-g> :vimgrep<Space>
" Y consistent with D and C
nnoremap Y y$
" NERDTree Mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" Linting
nnoremap <leader>sc :SyntasticCheck<CR>
autocmd BufWritePre * :%s/\s\+$//e                 " Delete trailing whitespaces on save

" Shortcuts for frequently accessed files.
command! Vimrc e ~/.vim/vimrc

" * and # work on visual selections.
" Practical Vim Tip #87
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
