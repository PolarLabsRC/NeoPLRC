"        _____  _  
"       |  __ \| |     
"       | |__) | |     
"       |  ___/| |     
"       | |    | |____ 
"       |_|___ |______|
"       |  __ \ / ____|
"       | |__) | |     
"       |  _  /| |     
"       | | \ \| |____ 
"       |_|  \_\\_____|
"   Polar Labs Research Center™
"
" Config uses vim-plug https://github.com/junegunn/vim-plug
" On first launch run :PlugInstall
"
"
" Plugins
call plug#begin()  
Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'f-person/git-blame.nvim'
call plug#end()

" Appearance
set termguicolors
colorscheme nord
syntax on
set number
set cursorline
set cc=80 
au UIEnter * Neotree
set statusline=\ %{GetGitBranch()}\ \|\ %F\ \|\ %Y\ \|\ %m%=\|\ %{&fileencoding?&fileencoding:&encoding}\ \|\ ascii:\ %b\ \|\ hex:\ 0x%B\ \|\ %l:%c\ \|\ percent:\ %p%%\ 
set laststatus=3
function! GetGitBranch()
  let git_branch = substitute(system('git rev-parse --abbrev-ref HEAD 2>/dev/null'), '\n', '', '')
  return strlen(git_branch) > 0 ? git_branch : '---'
endfunction
au BufEnter * setlocal statusline=\ %{GetGitBranch()}\ \|\ %F\ \|\ %Y\ \|\ %m%=\|\ %{&fileencoding?&fileencoding:&encoding}\ \|\ ascii:\ %b\ \|\ hex:\ 0x%B\ \|\ %l:%c\ \|\ percent:\ %p%%\ 
set showtabline=2
au UIEnter * botright split | terminal
" Search
set showmatch
set hlsearch
set incsearch
set smartcase

" Text formating
set tabstop=4
set softtabstop=4 
set expandtab
set shiftwidth=4
set autoindent
set nowrap
filetype plugin on
filetype plugin indent on
set foldmethod=syntax
" set spell

" Editor's behavior
set nocompatible
set wildmode=longest,list
set mouse=a
set clipboard=unnamedplus
set backspace=2
set ttyfast
set noswapfile
set backupdir=~/.cache/vim
set history=1000

" Bindings for plugins
nnoremap tf :Telescope find_files<cr>
nnoremap tg :Telescope live_grep<cr>
nnoremap tb :Telescope buffers<cr>
nnoremap th :Telescope help_tags<cr>
nnoremap tr :Neotree<cr>
nnoremap 54 <C-w>l
nnoremap <C-`> :tabnew<cr>:terminal $SHELL -c "cd $PWD && $SHELL"<cr>
nnoremap ` :terminal $SHELL -c "cd $PWD && $SHELL"<cr>
