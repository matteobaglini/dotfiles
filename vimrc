set nocompatible

" Sets how many lines of history VIM has to remember
set history=1000
set undolevels=1000
" Set to auto read when a file is changed from the outside
set autoread
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Set to show line number
set number
" Set to show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Display the mode you're in
set showmode
" Set show matching parenthesis
set showmatch
" Set to highlighting the last used search pattern.
set hlsearch
" Set to do incremental searching
set incsearch
" Case-insensitive search
set ignorecase
" But case-sensitive if expression contains a capital letter
set smartcase
" Handle multiple buffers better.
set hidden
" Set autoindent
set autoindent
" Copy previous indentation
set copyindent
" Set the terminal's title
set title
" Don't make a backup before overwriting a file.
set nobackup
" And again.
set nowritebackup
" Don't make swap file
set noswapfile
" No word wrap
set nowrap
" Add a bit extra margin to the left
set foldcolumn=1
" Height of the command bar
set cmdheight=2
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Prevents some security exploits
set modelines=0
" Set N lines of context around the cursor, at bottom-side
set scrolloff=5
" Same as before but left-side
set sidescrolloff=15
set sidescroll=1
" Enhaced command line completion
set wildmenu
" Complete files like a shell
set wildmode=list:longest,full
" Ignore when expand
set wildignore=*.swp,*.bak,*.o,*.obj
" Always show status line
set laststatus=2
" Highlight current line
set cursorline
" Faster esc in visual/insert mode
set ttimeout
set ttimeoutlen=10
" Longer mapping waiting time
set timeout
set timeoutlen=3000
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>\ ,trail:.,nbsp:.,eol:¬
" No sound bell, flash screen
set visualbell
" Fast terminal connection
set ttyfast
" Global tab width.
set tabstop=4
" And again, related.
set softtabstop=4
" And again, related.
set shiftwidth=4
" Use spaces instead of tabs
set expandtab
" Max line width
set textwidth=80
" Max number of tab pages
set tabpagemax=100
" Enable folding
set foldenable
" Start with all fold closed
set foldlevelstart=0
" Max nested level (not so deep)
set foldnestmax=2
" Use marker as fold method
set foldmethod=marker

" Fix terminal problems
if !has('gui_running')
    set t_RV=
    set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
endif

" GUI config
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
endif

" Remap leader
let mapleader=","
let maplocalleader=","

" Make Y behave consistently with D and C
nnoremap Y y$

" Shortcuts
"
" Force file write
nnoremap <leader>w :w!<cr>
" Quit all
nnoremap <leader>q :qall<cr>
" Toggle listchars option
nnoremap <leader>l :set list!<cr>
" Turn off highlighted matches
nnoremap <leader><space> :nohls<cr>
" Togglw NERDTree left side panel
nnoremap <leader>n :NERDTreeToggle<cr>
" Simple ad blank line (next)
nnoremap <leader>o o<esc>k
" Simple add blank line (prev)
nnoremap <leader>O O<esc>j

" Access vimrc
nnoremap <silent> <leader>erc :tabedit $MYVIMRC<cr>
nnoremap <silent> <leader>egrc :tabedit $MYGVIMRC<cr>
nnoremap <silent> <leader>src :source $MYVIMRC<cr>
nnoremap <silent> <leader>sgrc :source $MYGVIMRC<cr>

" Opening files located in the same directory as the current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Upper\Lower case mapping
nnoremap <C-u> g~iwe
inoremap <C-u> <esc>g~iwea

" Tabs mappings
noremap <leader>tt :tabnew<cr>
noremap <leader>te :tabedit
noremap <leader>tc :tabclose<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprevious<cr>
noremap <leader>tf :tabfirst<cr>
noremap <leader>tl :tablast<cr>
noremap <leader>tm :tabmove

" Windows mappings
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" No Arrow Keys!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" No stupid help
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

" Move by screen line instead of file line
nnoremap j gj
nnoremap k gk

" Visual shifting does not exit visual mode
vnoremap < <gv
vnoremap > >gv

" Run an external command with only single bang
nnoremap ! :!

augroup FixBeforeWrite
    autocmd!
    autocmd BufWritePre * call RemoveTrailingWhitespaces()
augroup END

" Disable filetpye, this is important to do *before* 'vundle#begin()'
filetype off

" Install bundles via Vundle
if has("win32") || has("win64")
    set rtp+=~/vim/vimfiles/bundle/Vundle.vim/
    let path='~/vim/vimfiles/bundle'
    call vundle#begin(path)
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

Plugin 'gmarik/Vundle.vim'

" {{{ misc
Plugin 'tmhedberg/matchit'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
Plugin 'goldfeld/vim-seek'
Plugin 'pafcu/vimsplain'
Plugin 'Tabular'
" }}}

" {{{ status/tabline
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
" }}}

" {{{ syntax checking
Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" }}}

" {{{ fuzzy finder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|bower_components)$',
            \ 'file': '\v\.(exe|so|dll|suo)$',
            \ }
let g:ctrlp_cmd = 'CtrlPMixed'
" }}}"

" {{{ git
Plugin 'airblade/vim-gitgutter'
Plugin 'chrisbra/vim-diff-enhanced'
" }}}

" {{{ langs
Plugin 'gabrielelana/vim-markdown'
Plugin 'PProvost/vim-ps1'
Plugin 'whatyouhide/vim-dockerfile'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'OmniSharp/omnisharp-vim'
" }}}

call vundle#end()

" Enable syntax
syntax on

" Enable indentation, this is important to do *after* 'vundle#end()'
filetype plugin indent on

" Activate color scheme
colorscheme molokai

" Custom function
function! RemoveTrailingWhitespaces()
    let l:save_cursor = getpos('.')
    silent! execute ':%s/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
