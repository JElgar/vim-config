
"  __      _______ __  __ _____   _____   "  
"  \ \    / /_   _|  \/  |  __ \ / ____|  "
"   \ \  / /  | | | \  / | |__) | |       "
"    \ \/ /   | | | |\/| |  _  /| |       "
"     \  /   _| |_| |  | | | \ \| |____   "
"      \/   |_____|_|  |_|_|  \_\\_____|  "
"                                         "
"
                                      
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-jedi', {'do': 'yarn install'}
Plug 'ElmCast/elm-vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Colour Scheme
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'

" Vim Wiki
Plug 'vimwiki/vimwiki'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'

"CoVIM
Plug 'makerforceio/CoVim'
"" Python
Plugin 'plytophogy/vim-virtualenv'
Plugin 'PieterjanMontens/vim-pipenv'

"Latex
Plug 'lervag/vimtex'

" Status line
Plug 'itchyny/lightline.vim'

" Flutter
Plug 'dart-lang/dart-vim-plugin'

" Lorem Ipsum
Plug 'vim-scripts/loremipsum'

" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Markdown
Plug 'JamshedVesuna/vim-markdown-preview'

" Git
Plug 'tpope/vim-fugitive'

" Vim Zoom
Plug 'dhruvasagar/vim-zoom'

"Vim surround - vim commentry 

call plug#end()

" Map leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" fzf mapping
nmap <leader><leader> fzf#vim#complete#path('fd')
nmap <leader><s> fzf#vim#complete#path('fd')


" Use Control A as Escape
imap <C-A> <Esc>
vmap <C-A> <Esc>
nmap <C-A> <Esc>
imap jk <Esc>

syntax on
set background=dark
colorscheme gruvbox
set number
set relativenumber
set tabstop=4
set softtabstop=2 shiftwidth=2 expandtab
set mouse=a

" Status bar colourscheme
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"" Auto compile with F5
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>sudo<space>R<space>--vanilla<enter>

"Map Ctrl + E and Ctrl + E then e to save and quit
"map <C-E> :w<CR> 
"map <C-E>e :wq<CR>
nnoremap <C-e> <C-w>
nmap <C-e>m <Plug>(zoom-toggle)
" Splits
set splitbelow
set splitrig

" Control P Setup
let g:ctrlp_map = '<c-p>'

" Vim Wiki Setup.
let g:vimwiki_folding='custom'
let g:vimwiki_list = [{'path': '~/Documents/uni/Notes/', 'syntax': 'markdown', 'ext': '.Rmd'}, {'path': '~/Documents/IB/', 'syntax': 'markdown', 'ext': '.Rmd'}]
" Folding
set foldmethod=expr
function! RmdFold()
		let line = getline(v:lnum)
		if match(line, '^\\begin') > -1
				return ">1"
		elseif match(line, '^\\end') > -1
				return "<1"
		else
				return "="
		endif
endfunction

autocmd Filetype vimwiki setlocal foldmethod=expr foldexpr=RmdFold()

"NERD Tree
nnoremap <silent> <leader>d :NERDTreeToggle<Enter>
"nnoremap <silent> <Leader>e :CocCommand explorer<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Source other configs
source $HOME/.config/nvim/configs/fzf.vim
source $HOME/.config/nvim/configs/coc.vim
