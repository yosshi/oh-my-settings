syntax enable " syntax highligt 
set nocompatible " vi互換にしない
set wrap " 行の端まで到達すると折り返す
set noerrorbells " エラー時にベルを鳴らさない
set cmdheight=1 " コマンドラインの高さ
set number
set showmatch
set backspace=indent,eol,start
set expandtab " indent use space
set showmode       " always show what mode we're currently editing in
set nowrap         " don't wrap lines
set tabstop=4      " a tab is four spaces
set softtabstop=4  " when hitting <BS>, pretend like a tab is removed, even if spaces
set autoindent
set mouse=a   " enable using the mouse if terminal emulator supports it (xterm does)


if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif
 
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'L9'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'FuzzyFinder'
NeoBundle 'git://github.com/motemen/git-vim.git'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'

filetype plugin on
filetype indent on

" --------------------
" color settings
" --------------------
" Color Scheme

set background=dark
colorscheme solarized

" Highlight lines over 120 characters in length whenever a window opens
" From http://vim.wikia.com/wiki/Highlight_long_lines
if v:version >= 730
  :set cc=80,120
  :hi ColorColumn ctermbg=red guibg=red
elsif v:version >= 720
  :au BufWinEnter * let w:m1=matchadd('Search', '\%80v', -1)
  :au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%120v', -1)
elseif v:version >= 700
  :au BufRead,BufNewFile * syntax match Search /\%80v/
  :au BufRead,BufNewFile * syntax match ErrorMsg /\%120v/
endif



" ---------------------------
" GUI settings for MacVim.app
" ---------------------------
if has('gui_macvim')
    set showtabline=2	" タブを常に表示
    set imdisable	" IMを無効化
    set transparency=2	" 透明度を指定
    set antialias
    set guifont=Monaco:h12
    " -- color settings --
    set background=light
    colorscheme solarized
endif

" ----------------------------------------------------
" neocomplcache settings
" ----------------------------------------------------
set completeopt=menuone
let g:neocomplcache_enable_at_startup = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()




" ------------------------------------------------
" JavaScript
" ------------------------------------------------
au FileType javascript set ts=4 sw=4 sts=0










" ----------------------------------------------------
" Emacs風操作関係( INSERT mode )
" ----------------------------------------------------
" コマンド入力中断
imap <silent> <C-g> <ESC><ESC><ESC><CR>i

" 画面分割
imap <silent> <C-x>1 <ESC>:only<CR>i
imap <silent> <C-x>2 <ESC>:sp<CR>i
imap <silent> <C-x>0 <ESC>:vsp<CR>i
imap <silent> <C-x>o <ESC><C-w>w<CR>i
imap <silent> <C-x>p <ESC><C-w>p<CR>i

" 消去、編集
imap <C-k> <ESC>d$i
imap <C-y> <ESC>pi
imap <C-d> <ESC>xi

" 移動
imap <C-a>  <Home>
imap <C-e>  <End>
imap <C-b>  <Left>
imap <C-f>  <Right>
imap <C-n>  <Down>
imap <C-p>  <UP>
"imap <ESC>< <ESC>ggi
"imap <ESC>> <ESC>Gi

" ファイル
imap <C-c><C-c>  <ESC>:qa<CR>
imap <C-x><C-c>  <ESC>:qa!<CR>
imap <C-w><C-w>  <ESC>:w<CR>
imap <C-x><C-w>  <ESC>:w!<CR>
imap <C-x><C-f>  <ESC>:e 

" エラーリカバリ
" imap <C-/> <ESC>ui

" その他
map  <C-x><C-e>  :Explore<CR>

