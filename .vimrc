set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
" https://github.com/vim-airline/vim-airline/issues/124#issuecomment-22389800
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set ttimeoutlen=5
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
" let g:ycm_auto_trigger=1
Plugin 'lilydjwg/colorizer'
Plugin 'valloric/youcompleteme'
Plugin 'kien/rainbow_parentheses.vim'
" always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
Plugin 'fatih/vim-go'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" syntax highlighting
syntax on
" line numbers
set number
" highlight current line number
set cursorline
" tab settings
set tabstop=4
set shiftwidth=4
set expandtab
" highlight and ignore case in search
set hlsearch
set ignorecase
" always show status line
"set laststatus=2 " not needed with airline 
" enable mouse in all modes
set mouse=a
" show filename in title bar

set title
" show (partial) command as it is being typed
set showcmd
" Load color theme
" colorscheme ~/.vim/colors/badwolf.vim
" colorscheme ~/.vim/colors/gabriel.vim
" colorscheme ~/.vim/colors/foobar.vim
"set t_Co=256
"set background=dark
set termguicolors
"colorscheme puttehi
colorscheme puttehi-dark
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
" Use Ctrl+Space to always get to normal mode
"  or to get to insert mode from normal mode

" Use Ctrl+Space for normal mode in all modes.
noremap <C-@> <Esc>
" Use Ctrl+Space for insert mode in normal mode
" (append version a?) i.e. cursor doesnt jump
nnoremap <C-@> a
" Insert mode exits too
inoremap <C-@> <Esc>

" Use Ctrl+Shift+Arrows to move lines up or down like VSCode
noremap <C-S-Up> :m -2<CR>
noremap <C-S-Down> :m +1<CR>

" Highlight matching text highlighted under cursor automatically
"nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
" Count found words
fun! CountWordFunction()
    try
        let l:win_view = winsaveview()
        let l:old_query = getreg('/')
        let var = expand("<cword>")
        exec "%s/" . var . "//gn"
    finally
        call winrestview(l:win_view)
        call setreg('/', l:old_query)
    endtry
endfun
" Bellow we set a command "CountWord" and a mapping to count word
" change as you like it
command! -nargs=0 CountWord :call CountWordFunction()
"nnoremap <f3> :CountWord<CR>
" highlight found text and count occurences
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>:CountWord<cr>

