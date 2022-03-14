" basic syntax highlighting
syntax on

" required by some plugins
filetype plugin indent on

" smaller indentation
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

"relative line numbering
set relativenumber

" encoding
set encoding=utf-8

" quit when pressing q on command mode
map q :quit<CR>

" no need to press return to search
set incsearch

" better help menu
set wildmenu

" better bar with file info
set laststatus=2

" title for dwm bar
set title

" better forcing
set confirm

" save with ctrl + s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>

" terminal shortcut
nmap <c-t> :vert term<CR>

" clipboard copy has xclip as dependency
set clipboard=unnamedplus

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'amadeus/vim-css'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvie/vim-flake8'
Plug 'neovimhaskell/haskell-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
"Plug 'm-pilia/vim-ccls'
"Plug 'honza/vim-snippets'
call plug#end()

" coc extensions
let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-html', 'coc-explorer', 'coc-tsserver', 'coc-rust-analyzer', 'coc-json', 'coc-vimtex', 'coc-python', 'coc-go', 'coc-clangd', 'coc-css', 'coc-svelte']

" coc config
source $HOME/.config/nvim/plug-config/coc.vim	

" theme
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark

" explorer
:nmap <space>e <Cmd>CocCommand explorer<CR>

" coc-pairs to comply with closetag
autocmd FileType html let b:coc_pairs_disabled = ['<']

" close tag on go tmpl files
autocmd BufNewFile,BufRead *.tmpl set filetype=html
autocmd BufNewFile,BufRead *.jet set filetype=html

" coc go 
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 OR :silent call CocAction('runCommand', 'editor.action.organizeImport')

" vim tex
let g:vimtex_view_method = 'zathura'

" vim tex dependencies
" biber, texmk (texlive-most)

" rust
let g:rustfmt_autosave = 1

" better closetag behaviour on react
let g:closetag_xhtml_filetypes = 'xhtml,jsx, tsx'

" dependencies
" python3 -m pip install pynvim
" pip install flake8
