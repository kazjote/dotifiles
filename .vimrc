set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'benmills/vimux'
Bundle 'svenfuchs/vim-deliminator'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/Align'
Bundle 'tpope/vim-markdown'
Bundle 'majutsushi/tagbar'
Bundle 'h1mesuke/unite-outline'
Bundle 'Shougo/unite.vim'

Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-foreplay'

Bundle 'tpope/vim-markdown'

Bundle 'mileszs/ack.vim'
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_extensions   = ['tag']

Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
runtime macros/matchit.vim

if has("autocmd")
  filetype indent plugin on
endif

" vim-snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle "corntrace/bufexplorer"


" vim-scripts repos
Bundle 'L9'
Bundle 'dbext.vim'
Bundle 'foldsearch'

Bundle 'pangloss/vim-javascript'

syntax on
filetype plugin indent on

set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

set nu
set showmatch
set list
set nocp incsearch

set lcs=tab:\ \ ,trail:~,extends:>,precedes:<

let mapleader = ","

nmap cn :cn<CR>
nmap cp :cp<CR>
nmap tt :NERDTreeToggle<CR>
nmap <leader>t :!tmux send-keys -t .1 M-p C-m<CR>

nmap tn :tabnext<CR>
nmap tp :tabprevious<CR>
nmap tc :tabnew<CR>

vmap gy "+y
nmap gy "+y
nmap gp "+p

nmap <leader>r :VimuxRunLastCommand<CR>

set background=dark
" normal  high or low
let g:solarized_contrast="high"
let g:solarized_termtrans=1
" 0  1
let g:solarized_termcolors=16
colorscheme solarized

autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala

" gundo
nnoremap <F5> :GundoToggle<CR>

let g:slime_target = "tmux"

set nobackup
set noswapfile

set wildmode=list:longest "make cmdline tab completion similar to bash
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
let g:ctrlp_custom_ignore = '\v[\/]\.deploy$'

" status line
set statusline=%{exists('g:loaded_fugitive')?fugitive#statusline():''} " git branch from fugitive.vim

" Current buffer:
set statusline+=\ [%F] " Full path filename
set statusline+=%y " Extension downcase
set statusline+=%m " Modified flag
set statusline+=%r " Readlonly flag

set statusline+=%{&spell?'[spell]':''} " Add '[spell]' if spell option is on

set statusline+=%= " All that follow is right aligned

set statusline+=\ [%l] " Cursor line number
set statusline+=\ [%c] " Cursor column number
set statusline+=\ [%p%%] " Percentage through file in lines
set statusline+=\ [%L] " Number of lines of the current buffer
set statusline+=\ [%{&ff}] " File Format of the current buffer

" Show the last partial command
set showcmd

" Convert Ruby 1.8 hash syntax to Ruby 1.9 syntax
" based on https://github.com/henrik/dotfiles/blob/master/vim/config/commands.vim#L20
command! -bar -range=% NotRocket execute '<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')

" Tags
autocmd BufWritePost *
      \ if exists('b:git_dir') && executable(b:git_dir.'/hooks/ctags') |
      \ call system('"'.b:git_dir.'/hooks/ctags" &') |
      \ endif

set colorcolumn=120
