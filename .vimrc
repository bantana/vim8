" mkdir -p $VIMCONFIG/pack/minpac/opt
" cd $VIMCONFIG/pack/minpac/opt
" git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
" call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('tpope/vim-unimpaired')
call minpac#add('w0rp/ale')
call minpac#add('junegunn/fzf',{'dir': '~/.fzf', 'do': './install --all'})
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-surround')
" call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-fugitive')
call minpac#add('liuchengxu/eleline.vim')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('mattn/emmet-vim')
call minpac#add('mileszs/ack.vim')
call minpac#add('fatih/vim-go')
call minpac#add('rbgrouleff/bclose.vim')
call minpac#add('posva/vim-vue')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('prettier/vim-prettier')

call minpac#add('terryma/vim-multiple-cursors')
" ColorScheme
call minpac#add('morhetz/gruvbox')

call minpac#add('gagoar/StripWhiteSpaces')
call minpac#add('sedm0784/vim-you-autocorrect')
call minpac#add('thinca/vim-quickrun')

" Command for minpack {{{
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" }}}
" Command for fzf {{{
nnoremap <C-p> :<C-u>FZF<CR>
" }}}
" Command for shortkey {{{
inoremap jj <ESC>
" }}}
" basic {{{
set nocompatible
syntax enable
syn on
filetype plugin indent on
set mouse=a
set showcmd
set showmode
set backspace=indent,eol,start
set hidden
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set number
set relativenumber
set ruler
set incsearch
set hlsearch
set wrap
set scrolloff=3
set title
set visualbell
set shell=bash

set ofu=syntaxcomplete#Complete

set laststatus=2
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
" Map cursor for insert mode
let &t_SI .= "\<Esc>[5 q"
" solid block
let &t_EI .= "\<Esc>[2 q"
" }}}
" Tabs, spaces, wrapping ------------------- {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set textwidth=110 "80-width lines is for 1995"
let &wrapmargin=&textwidth
set formatoptions=qrn1
set nu
set ic
" }}}
" Color Scheme {{{
set t_Co=256
set background=dark
hi Search term=reverse cterm=reverse gui=reverse ctermfg=237
colorscheme gruvbox
" }}}
" mapleader {{{
let mapleader = " "
let maplocalleader = "\\"
" }}}
" shortkey {{{
nnoremap <leader>ev :split ~/.vimrc<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>/ :Ack<Space>
nnoremap <leader>s :ALENextWrap<CR>

" terminail
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap <C-v><ESC> <ESC>
else
  tnoremap <ESC> <C-\><C-n>
endif
" }}}
" ale {{{
let g:ale_sign_column_always=1
let g:ale_fix_on_save = 1
" }}}
" Nerdtree {{{
map <leader>n :NERDTreeToggle<cr>
" }}}
" split naviagation {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" vim-quickrun {{{
let g:quickrun_config = {
\    "_" : {
\        "outputter" : "message",
\    },
\}
" }}}
" ale always {{{
let g:ale_sign_column_always=1
let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_linters = {'javascript': ['']}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_standard_use_global=1

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'false'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'true'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'flow'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
" }}}
