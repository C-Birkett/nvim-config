" auto-install plugins upon starting
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'

"language server
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'onsails/lspkind-nvim' 
"Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"finders
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-project.nvim'
"Plug 'nvim-telescope/telescope-media-files.nvim'

"graphical
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-startify'
Plug 'camspiers/animate.vim'
"Plug 'camspiers/lens.vim'
"Plug 'wfxr/minimap.vim'
"Plug 'folke/lsp-colors.nvim'

"Plug 'aurieh/discord.nvim'
Plug 'andweeb/presence.nvim'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/lightline.vim
"source $HOME/.config/nvim/plug-config/ctrlp.vim
"source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/lsp_config.vim
source $HOME/.config/nvim/plug-config/nvim-cmp.vim
"source $HOME/.config/nvim/plug-config/cmp-tabnine.vim
source $HOME/.config/nvim/plug-config/lens.vim
source $HOME/.config/nvim/plug-config/minimap.vim
"source $HOME/.config/nvim/plug-config/nvim-treesitter.vim


source $HOME/.config/nvim/plug-config/macros.vim

