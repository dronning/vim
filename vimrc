" vimrc by D. Ronning

" General Settings " {{{
set nocompatible		" be iMproved
set history=256	
set autowrite			" writes on make/shell commands
set autoread

" Backup
set nowritebackup
set nobackup

" Formatting
set nowrap
set textwidth=0
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

syntax on			" enable syntax highlighting
filetype plugin indent on 	" automatically detect file types

" " }}}

" Visual Settings " {{{
set nonumber
set showmatch
set matchtime=5
set laststatus=2
set ruler

set foldenable
set foldmethod=marker
set foldlevel=100
set foldopen=block,hor,mark,percent,quickfix,tag

set splitbelow
set splitright

set background=dark
colorscheme solarized

" " }}}

" Command and Auto commands " {{{
" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!

"Auto commands
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown} set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG} set ft=gitcommit

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file

" " }}}

" Plugins " {{{
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Generl
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Syntastic'

" Git
Bundle 'tpope/vim-fugitive.git'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

" C
" " }}}
