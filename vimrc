" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Plugins
call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'terryma/vim-multiple-cursors'

Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'

" Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'zah/nim.vim', { 'for': 'nim' }
" Plug 'baabelfish/nvim-nim', { 'for': 'nim' }

Plug 'edkolev/promptline.vim'
" Plug 'edkolev/tmuxline.vim'

Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'frozen': 1, 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" Plug  'xolox/vim-misc' | Plug 'xolox/vim-easytags'

call plug#end()

set number " Turn on line numbers
set relativenumber " Turn on relative line numbers
set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set expandtab " tabs are spaces
set showcmd " shows last command at the bottom
set cursorline " highlights current line
set showmatch " highlight matching [{()}]
set hlsearch " highlight matches
set ttyfast " Optimize for fast terminal connections
set clipboard=unnamed " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set foldmethod=syntax " Turn on folds using syntax-defined folding

" Set the color scheme
colorscheme Tomorrow-Night
let g:rehash256 = 1

" Change cursor style for different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'tomorrow'
set laststatus=2

" nim.vim
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Promptline
" available slices:
"
" promptline#slices#cwd() - current dir, truncated to 3 dirs. To configure: promptline#slices#cwd({ 'dir_limit': 4 })
" promptline#slices#vcs_branch() - branch name only. By default, only git branch is enabled. Use promptline#slices#vcs_branch({ 'hg': 1, 'svn': 1, 'fossil': 1}) to enable check for svn, mercurial and fossil branches. Note that always checking if inside a branch slows down the prompt
" promptline#slices#last_exit_code() - display exit code of last command if not zero
" promptline#slices#jobs() - display number of shell jobs if more than zero
" promptline#slices#battery() - display battery percentage (on OSX and linux) only if below 10%. Configure the threshold with promptline#slices#battery({ 'threshold': 25 })
" promptline#slices#host() - current hostname.  To hide the hostname unless connected via SSH, use promptline#slices#host({ 'only_if_ssh': 1 })
" promptline#slices#user()
" promptline#slices#python_virtualenv() - display which virtual env is active (empty is none)
" promptline#slices#git_status() - count of commits ahead/behind upstream, count of modified/added/unmerged files, symbol for clean branch and symbol for existing untraced files
"
" any command can be used in a slice, for example to print the output of whoami in section 'b':
"       \'b' : [ '$(whoami)'],
"
" more than one slice can be placed in a section, e.g. print both host and user in section 'a':
"       \'a': [ promptline#slices#host(), promptline#slices#user() ],
"
" to disable powerline symbols
" `let g:promptline_powerline_symbols = 0`
"
" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}


" IndentLine
let g:indentLine_enabled = 0 " disable by default
let g:indentLine_color_term = 239
let g:indentLine_char = '│'

" Easytags
" let g:easytags_auto_update = 0 " Disable auto tag updating because gutentags will handle it
let g:easytags_async = 1 " Enable asynchronous tag updates
