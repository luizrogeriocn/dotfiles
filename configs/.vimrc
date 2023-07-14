let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  "Plug 'chriskempson/base16-vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'elixir-editors/vim-elixir'
call plug#end()

let g:ag_working_path_mode="r"
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <C-P> :Files<cr>
nnoremap <C-F> :Ag
vnoremap <C-c> :w !xclip -i -sel c<CR><CR>
syntax on
"set background=dark
"let base16colorspace=256
"colorscheme base16-monokai
set showmatch
set nocompatible
set clipboard=unnamedplus
set wildmenu
set esckeys
set backspace=indent,eol,start
set ttyfast
set encoding=utf-8 nobomb
let mapleader=" "
set number
set colorcolumn=80,100
highlight ColorColumn ctermbg=235
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set hlsearch
set ignorecase
set incsearch
set noerrorbells
set nostartofline
set ruler
set shortmess=atI
set showmode
set title
set showcmd
set scrolloff=4
set path+=**
set rtp+=/home/roger/.fzf
command FV call fzf#run({'source': 'fd', 'sink': 'vsp', 'options': '-m', 'down': '30%'})
command FS call fzf#run({'source': 'fd', 'sink': 'sp', 'options': '-m', 'down': '30%'})
command FE call fzf#run({'source': 'fd', 'sink': 'e', 'options': '-m', 'down': '30%'})
command GV call fzf#run({'source': 'git status --porcelain | sed s/^...//', 'sink': 'vsp', 'options': '-m', 'down': '30%'})
command GS call fzf#run({'source': 'git status --porcelain | sed s/^...//', 'sink': 'sp', 'options': '-m', 'down': '30%'})
command GE call fzf#run({'source': 'git status --porcelain | sed s/^...//', 'sink': 'e', 'options': '-m', 'down': '30%'})
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif
" Strip trailing whitespace (,ss)
function! StripWhitespace()
 let save_cursor = getpos(".")
 let old_query = getreg('/')
 :%s/\s\+$//e
 call setpos('.', save_cursor)
 call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Automatic commands
if has("autocmd")
 " Enable file type detection
 filetype on
 " Treat .json files as .js
 autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
 autocmd BufNewFile,BufRead *.axlsx setfiletype axlsx syntax=ruby
 " Treat .md files as Markdown
 autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
