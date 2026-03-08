
"=======================================================================基本設定
" マウスを有効化
set mouse=a

" クリップボードを共有
" set clipboard+=unnamed

" vi互換を切る
set nocompatible

" backspaceを使えるように
noremap! <C-?> <C-h>
set backspace=indent,eol,start

" 文字コードをUFT-8に設定
set fenc=utf-8

" バックアップファイルを作らない
"set nobackup

" スワップファイルを作らない
set noswapfile

" 編集中のファイルが変更されたら自動で読み直す
set autoread

" バッファが編集中でもその他のファイルを開けるように
set hidden

" ファイルタイプ検出を有効にする
filetype plugin indent on

" カーソル位置保存
augroup vimrcEx
autocmd!
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line('$') |
\   exe "normal! g`\"" |
\ endif
augroup END

" ファイル保存時に行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge



"=======================================================================インデント関連
"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4

" 行頭でのTab文字の表示幅
set shiftwidth=4

"改行時に前の行のインデントを継続する
set autoindent

" インデントはスマートインデント
set smartindent

" スマートタブ
set smarttab

" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-

" Tab文字を半角スペースにする
set expandtab

" 以前の autocmd コマンドをクリア
augroup vimrc
    autocmd!
    " C/C++/Java 言語系のファイルタイプが設定されたら cindent モードを有効にする
    autocmd FileType c,cpp,java setl cindent
augroup END



"=======================================================================挙動の変更
" 行末の1文字先までカーソルを移動できるように
" set virtualedit=onemore

" 行頭行末の左右移動で行をまたぐようにする
set whichwrap=b,s,h,l,<,>,[,],~

" 単語が連続とみなされる文字の設定 上だとeclipseバグる
" set isk=@,48-57,_,192-255,-
set isk+=-

" かっこの組み合わせを設定
set matchpairs=(:),{:},[:]

" コマンドラインの補完
set wildmode=list:longest

" タイムアウト設定
set timeout tm=280



"=======================================================================見た目関連
" 行番号を表示
set number

" 相対行番号を表示
" set relativenumber

" 現在の行を強調表示
set cursorline

" 現在の行を強調表示（縦）
"set cursorcolumn

" ビープ音を可視化
"set visualbell

" 入力中のコマンドをステータスに表示する
set showcmd

" ステータスラインを常に表示
set laststatus=2
"===================================================検索・ハイライト関連
" シンタックスハイライトの有効化
syntax enable

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

" インサートモードを抜けた時の挙動を設定
autocmd InsertLeave * highlight CursorLine ctermbg=NONE guibg=NONE

" 括弧入力時の対応する括弧を表示
set showmatch


"=======================================================================マッピング
" Leaderキーの割り当て
let mapleader = "\<Space>"

" ESC連打でハイライト解除
noremap <Esc><Esc> :noh<CR><Esc>

" 折り返し時に表示行単位での移動できるようにする
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Tabで全てインデント
nnoremap <TAB> mxgg=G`xzz
" inoremap <TAB> <ESC>0d^i;<ESC>==i<Del>

" ノーマルモードの挙動を指定
nnoremap A AX<Esc>==A<BS>
nnoremap <CR> o<Esc>
nnoremap <Leader><CR> O<Esc>
" nnoremap <CR> oX<Esc>"_x
" nnoremap <Leader><CR> OX<Esc>"_x

" インデントを勝手に消さない
" nnoremap A AX<C-o>==<C-o>A<BS>
" nnoremap o oX<BS>
" nnoremap O OX<BS>
" inoremap <CR> <CR>X<BS>

" Esc割り当て silentにする場合 : ex)inoremap <silent> jk <ESC>
inoremap jk <ESC>
inoremap kj <ESC>
inoremap JK <ESC>
inoremap KJ <ESC>
" inoremap jj <ESC>j
" inoremap kk <ESC>k

" m で対応するかっこに移動
noremap m %

" * で次の文字に移動しない
noremap * mx*`xzz

" . で位置を移動しない
noremap . mx.`x

" カーソル移動
noremap <S-h> 12h
noremap <S-j> 3j
noremap <S-k> 3k
noremap <S-l> 12l

noremap <C-h> ^
noremap <C-j> 10jzz
noremap <C-k> 10kzz
noremap <C-l> $

noremap <Leader>h 0
noremap <Leader>l $
noremap <Leader>j G
noremap <Leader>k gg

" eで単語の最後尾に移動して入力
" noremap e ea

" q で細かく編集
nnoremap q :set nohls<CR>/[A-Z]\\|[^a-z]<CR>:set hls\|noh<CR>
nnoremap Q :set nohls<CR>?[A-Z]\\|[^a-z]<CR>:set hls\|noh<CR>
vnoremap q :set nohls<CR>/[A-Z]\\|[^a-z]<CR>:set hls\|noh<CR>
nnoremap Q :set nohls<CR>?[A-Z]\\|[^a-z]<CR>:set hls\|noh<CR>

" __qで大文字と記号区切りで編集 [a-z]は[A-Z]もマッチするから注意
nnoremap ciq :set nohls<CR>l?[A-Z]\\|[^a-z]<CR>h/[a-z]<CR>v/[A-Z]\\|[^a-z]<CR>hd:set hls\|noh<CR>i
nnoremap caq :set nohls<CR>l?[A-Z]\\|[^a-z]<CR>v/[A-Z]\\|[^a-z]<CR>hd:set hls\|noh<CR>i
nnoremap diq :set nohls<CR>l?[A-Z]\\|[^a-z]<CR>h/[a-z]<CR>v/[A-Z]\\|[^a-z]<CR>hd:set hls\|noh<CR>
nnoremap daq :set nohls<CR>l?[A-Z]\\|[^a-z]<CR>v/[A-Z]\\|[^a-z]<CR>hd:set hls\|noh<CR>
nnoremap yiq :set nohls<CR>l?[A-Z]\\|[^a-z]<CR>h/[a-z]<CR>v/[A-Z]\\|[^a-z]<CR>hy:set hls\|noh<CR>
nnoremap yaq :set nohls<CR>l?[A-Z]\\|[^a-z]<CR>v/[A-Z]\\|[^a-z]<CR>hy:set hls\|noh<CR>
" nnoremap ciq :set isk=97-122,48-57<CR>wblviwohd:set isk=@,48-57,_,192-255,-<CR>i

" :set isk-=は複数指定すると、すでにあるかのチェックしてくれないから注意
" iskは英数字を指定する。デフォは英数字と-,_。
" nnoremap q :set isk-=-<CR>:set isk-=_<CR>w:set isk+=-,_<CR>
" vnoremap q <Esc>:set isk-=-<CR>:set isk-=_<CR>gvw<Esc>:set isk+=-,_<CR>gv
" nnoremap diq :set isk-=-<CR>:set isk-=_<CR>diw:set isk+=-,_<CR>


" __nで数字を編集
nnoremap cin :set nohls<CR>l?[^0-9]<CR>lv/[^0-9]<CR>hd:set hls\|noh<CR>i
nnoremap can :set nohls<CR>l?[^0-9]<CR>lv/[^0-9]<CR>d:set hls\|noh<CR>i
nnoremap din :set nohls<CR>l?[^0-9]<CR>lv/[^0-9]<CR>hd:set hls\|noh<CR>
nnoremap dan :set nohls<CR>l?[^0-9]<CR>lv/[^0-9]<CR>d:set hls\|noh<CR>
nnoremap yin :set nohls<CR>l?[^0-9]<CR>lv/[^0-9]<CR>hy:set hls\|noh<CR>
nnoremap yan :set nohls<CR>l?[^0-9]<CR>lv/[^0-9]<CR>y`>:set hls\|noh<CR>
" nnoremap cin :set isk=48-57<CR>diw:set isk=@,48-57,_,192-255,-<CR>i


" t で タグで挟まれたやつの中に移動
nnoremap t f>
nnoremap T F>
vnoremap t f>
vnoremap T F>


" 文字消す系の動作割り当て
nnoremap <BS> "_dh
nnoremap <Del> mxi<Del><Esc>`x
vnoremap <BS> "_d
vnoremap <Del> "_d
nnoremap x mxi<Del><Esc>`x
vnoremap x "_d
nnoremap s "_s
vnoremap x "_d
nnoremap z "_
" nnoremap z "_dh
" vnoremap z "_d

" コピペの挙動指定 gp gPでペーストした文の後ろにカーソルが移動
noremap Y v$hy
vnoremap y y`>
" nnoremap P gP
" 次2行は同じ
vnoremap p "_dP
vnoremap P "_dP

" @と`の挙動設定
noremap @ aX<Esc>"_Dp
noremap ` "_Dp

" <Leader>d,cで、前の部分を削除
" noremap <C-d> hv^d^
noremap <Leader>d hv^d^
noremap <Leader>c hv^d^i


noremap <C-y>y hv^y`>l
noremap <Leader>y hv^y`>l

" Leader p でクリップボードからその行を上書き
noremap <Leader>p ^gP"_D

" インデントの<>設定
nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

" _u でその行を消去しつつ、クリップボードに行形式でない文字列をコピー
nnoremap yu mx^v$hy`x
nnoremap du mx^v$hd`x"_dd

noremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
noremap <C-c> y`>
inoremap <C-c> <Nop>
noremap <C-x> d
inoremap <C-x> <Nop>
nnoremap <C-v> gP
vnoremap <C-v> "_dgP
inoremap <C-v> <Esc>gpi
noremap <C-z> u
inoremap <C-z> <Esc>u

noremap R <C-r>

" noremap <C-x> hd
" vnoremap <C-c> <Esc>`<v`>hy`>l
" noremap <Leader>p :let @x=@"<CR>"ydiw"xP:let @"=@y<CR>
" vnoremap <C-v> <Esc>`<v`>h"_dgP

" ZZか__でinsertモードでも保存
vnoremap ZZ <ESC>ZZ
inoremap ZZ <ESC>ZZ
" nnoremap __ ZZ
" vnoremap __ <Esc>ZZ
" inoremap __ <ESC>ZZ

" inoremapでタイムアウトまで待たない
" inoremap j<Space> j
" inoremap k<Space> k
" inoremap Z<Space> Z
" inoremap _<Space> _

" C-s と F5 で保存
noremap <c-s> <esc>:w<cr>
inoremap <c-s> <esc>:w<cr>a
noremap <F5> <esc>:w<cr>
inoremap <F5> <esc>:w<cr>a

" 行の統合 and 埋まってるやつの対処
nnoremap <Leader>J <S-j>
nnoremap <Leader>K j"xddk"xP<S-j>

" 埋まってるやつの対処
noremap <Leader> <Nop>
nnoremap <Leader><Space> a<Space><Esc>l
noremap <Leader>a g<C-a>
" noremap <Leader>x g<C-x>
noremap <Leader>v <C-v>
noremap <Leader>m ma
noremap <Leader>n `a
noremap <Leader>S <S-s>
noremap <Leader>zz zz

" いらない操作を消す
noremap ZQ <Nop>


"=======================================================================テンプレート
nnoremap <Leader>tpp Iprint(<Esc>A)<Esc>
nnoremap <Leader>tpq Ipprint.pprint(<Esc>A)<Esc>
nnoremap <Leader>tpo ^"_dt(mx%"_x`x"_x

nnoremap <Leader>thc i<!--  --><Esc>3h


"=======================================================================dein
" パスの設定
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" let s:rc_dir = expand('~/.vim')
" let s:toml = s:rc_dir . '/dein.toml'
let s:toml = '~/.toml'
let s:lazy_toml = '~/.lazy_toml'


" deinがdein_dirにない場合、.cacheディレクトリを作成し、deinをダウンロード
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" begin settings
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " tomlファイルを格納しているディレクトリが無かったら作成する。
  " if !isdirectory(s:rc_dir)
    " call mkdir(s:rc_dir, 'p')
  " endif

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  

  " end settings
  call dein#end()
  call dein#save_state()
endif

" plugin installation check
if dein#check_install()
  call dein#install()
endif

" plugin remove check
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif


"=======================================================================環境依存
""---------Eclipse パイプはj,k,xには効かないぽい
" unmap j
" unmap k
" unmap x

""---------VSCode
" vnoremap ZZ <Esc>:wq

" インサートモードに入った時にカーソル行の色を変更する
" 黒配色
autocmd InsertEnter * highlight CursorLine ctermbg=24 guibg=#005f87|highlight Search ctermbg=23 guibg=#005f5f|highlight MatchParen ctermbg=241 guibg=#626262

" 白配色
" autocmd InsertEnter * highlight CursorLine ctermbg=189 guibg=#dfdfff|highlight Search ctermbg=152 guibg=#afd7d7|highlight MatchParen ctermbg=253 guibg=#dadada





