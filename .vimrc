" function {{{
function! EnsureDirExits (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir, 'p')
      echo "Created directory: " . a:dir
    else
      echo "please create directory: " . a:dir
    endif
  endif
endfunction
" }}}
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
call minpac#add('Valloric/YouCompleteMe')

call minpac#add('terryma/vim-multiple-cursors')
" ColorScheme
call minpac#add('morhetz/gruvbox')

call minpac#add('gagoar/StripWhiteSpaces')
call minpac#add('sedm0784/vim-you-autocorrect')
call minpac#add('thinca/vim-quickrun')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('corylanou/vim-present')
call minpac#add('dart-lang/dart-vim-plugin')
call minpac#add('simnalamburt/vim-mundo')
call minpac#add('rust-lang/rust.vim')
call minpac#add('travisjeffery/vim-auto-mkdir')
call minpac#add('majutsushi/tagbar')
call minpac#add('francoiscabrol/ranger.vim')
" call minpac#add('sheerun/vim-polyglot')
call minpac#add('natebosch/vim-lsc')
call minpac#add('mattn/webapi-vim')
call minpac#add('mattn/gist-vim')
" call minpac#add('prabirshrestha/async.vim')
" call minpac#add('prabirshrestha/vim-lsp')
call minpac#add('racer-rust/vim-racer')
call minpac#add('wannesm/wmgraphviz.vim')


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
" copy {{{
" pbcopy
set clipboard=unnamed
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
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>lg :Gist<Space>
nnoremap <leader>gi :GoImport<Space>
nnoremap <leader>/ :Ack<Space>
nnoremap <leader>s :ALENextWrap<CR>
nnoremap <leader>m :TagbarToggle<CR>
nnoremap <leader>c :Bclose<CR>

" terminail
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap <C-v><ESC> <ESC>
else
  tnoremap <ESC> <C-\><C-n>
endif
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
" youcompleteme ultisnips {{{
" make ycm compatible with ultisnips (using supertab)
let g:ycm_key_list_select_completion = ['<c-n>', '<down>']
let g:ycm_key_list_previous_completion = ['<c-j>', '<up>']
let g:supertabdefaultcompletiontype = '<c-n>'

" better key bindings for ultisnipsexpandtrigger
let g:ultisnipsexpandtrigger = "<tab>"
let g:ultisnipsjumpforwardtrigger = "<tab>"
let g:ultisnipsjumpbackwardtrigger = "<s-tab>"
" }}}
" vim-mundo ------- {{{
set undofile
" check 'vim-mundo directory'
call EnsureDirExits($HOME . '/.vim/tmp/undo')
set undodir=~/.vim/tmp/undo
nnoremap <leader>u :MundoToggle<cr>
let g:mundo_debug = 1
let g:mundo_preview_bottom = 1
let g:mundo_tree_statusline = "mundo"
let g:mundo_preview_statusline = "mundo preview"
" }}}
" Dart-vim-plugin {{{
let dart_format_on_save = 1
" }}}
" range {{{
map <leader>f :Ranger<CR>
let g:NERDTreeHijackNetrw = 0 "// add this line if you use NERDTree
let g:ranger_replace_netrw = 1 "// open ranger when vim open a directory
" }}}
" ale always {{{
let g:ale_sign_column_always=1
let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_fixers = {'typescript': ['prettier_standard']}
let g:ale_linters = {'javascript': ['']}
let g:ale_linters = {'typescript': ['']}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_standard_use_global=1
" }}}
" dart {{{
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_auto_map = v:true " Use defaults
" ... or set only the keys you want mapped, defaults are:
" let g:lsc_auto_map = {
"     \ 'GoToDefinition': '<C-]>',
"     \ 'FindReferences': 'gr',
"     \ 'NextReference': '<C-n>',
"     \ 'PreviousReference': '<C-p>',
"     \ 'FindImplementations': 'gI',
"     \ 'FindCodeActions': 'ga',
"     \ 'DocumentSymbol': 'go',
"     \ 'WorkspaceSymbol': 'gS',
"     \ 'ShowHover': 'K',
"     \ 'Completion': 'completefunc',
"     \}
autocmd CompleteDone * silent! pclose
" let g:lsc_trace_level = 'verbose'
"
let g:lsc_preview_split_direction = 'above'
" }}}
" vim-go ----------------------------------- {{{
  let g:go_auto_type_info=1
  let g:go_fmt_autosave = 1
  let g:go_fmt_command = "goimports"
  let g:go_goimports_bin = "goimports -tabs=false -tabwidth=4"
  let g:go_fmt_fail_silently = 1
  let g:go_fmt_experimental = 1
  let g:go_doc_keywordprg_enabled = 1
  " let g:go_bin_path = expand("~/bin")
  let g:go_bin_path = $HOME."/bin"
  let g:go_highlight_array_whitespace_error = 1
  let g:go_highlight_chan_whitespace_error = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_space_tab_error = 1
  let g:go_highlight_trailing_whitespace_error = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_build_constraints = 1
  let g:go_snippet_engine = "ultisnips"

  let g:go_metalinter_autosave = 1
  "let g:go_metalinter_autosave_enabled = ['vet', 'golint']
  "let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
  " shortkey
  " au FileType go nmap <Leader>s <Plug>(go-implements)
  nnoremap <leader>es :vsplit ~/.vim/pack/minpac/start/vim-snippets/UltiSnips/

  set invsplitbelow
  let g:go_term_mode = "split"
  let g:go_term_enabled = 1
  "let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
  let g:syntastic_go_checkers = ['gometalinter']
  let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
  let g:go_list_type = "quickfix"
  nnoremap <leader>m :TagbarToggle<CR>
" }}}.
" Error and warning signs. {{{
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" }}}
" rust {{{
let g:LanguageClient_autoStart = 0
nnoremap <leader>lcs :LanguageClientStart<CR>
" if you want it to turn on automatically
" let g:LanguageClient_autoStart = 1

" let g:LanguageClient_serverCommands = {
"     \ 'python': ['pyls'],
"     \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'go': ['go-langserver'] }
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'] }

let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
" }}}
" read shell command result {{{
set shell=/bin/bash\ -i
" }}}
