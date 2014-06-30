"一旦ファイルタイプ関連を無効かする
filetype off
filetype plugin indent off


"---------------------------
" plugin manage
"---------------------------
"NeoBundle
if has('vim_starting')
    set nocompatible
    let g:neobundle_default_git_protocol='git'
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))

"Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"--------------------------
" color
"--------------------------
"colorscheme
"hybrid
NeoBundle 'w0ng/vim-hybrid'
"jellybeans
NeoBundle 'nanotech/jellybeans.vim'
"twilight
NeoBundle 'vim-scripts/twilight'
"lucius
NeoBundle 'jonathanfilip/vim-lucius'
"railscasts
NeoBundle 'jpo/vim-railscasts-theme'
"solarized
NeoBundle 'altercation/vim-colors-solarized'
"wombat
NeoBundle 'vim-scripts/Wombat'
"rdark
NeoBundle 'vim-scripts/rdark'
"zenburn
NeoBundle 'vim-scripts/Zenburn'
"molokai
NeoBundle 'tomasr/molokai'
"mustang
NeoBundle 'croaker/mustang-vim'
"mrkn256
NeoBundle 'mrkn/mrkn256.vim'
"pyte
NeoBundle 'therubymug/vim-pyte'

NeoBundle 'Shougo/unite.vim'
"colorscheme一覧表示
"Unite.vim (:Unite colorscheme -auto-preview)
NeoBundle 'ujihisa/unite-colorscheme'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

""""""""""""""""""""""""""
" Unite.vimの設定
""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-F> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリとする」
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを２回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" tree表示をノーマルモードのShift + t にマッピングする
nmap <silent> <S-T> :NERDTreeToggle<CR>


"vim-powerline
NeoBundle 'Lokaltog/vim-powerline'

"------------------------------
" input
"------------------------------
"入力補完機能
NeoBundle 'Shougo/neocomplcache'
"スニペット入力サポート
NeoBundle 'Shougo/neosnippet'
"ステータスライン表示をおしゃれに
NeoBundle 'itchyny/lightline.vim'
" let g:lightline = {
"     \ 'colorscheme': 'solarized'
"     \}

"HTMLタグなどの囲まれているものの編集補助
NeoBundle 'surround.vim'
"シンタックスチェックプラグイン
NeoBundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" Disable AutoComplePop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default' : '',
\ 'ruby' : '~/.vim/dict/ruby.dict',
\ 'eruby' : '~/.vim/dict/ruby.dict',
\ 'java' : '~/.vim/dict/java.dict',
\ 'scala' : '~/.vim/dict/scala.dict',
\ 'javascript' : '~/.vim/dict/javascript.dict',
\ 'coffee' : '~/.vim/dict/javascript.dict',
\ 'perl' : '~/.vim/dict/perl.dict',
\ 'objective-c' : '~/.vim/dict/objc.dict',
\ 'c' : '~/.vim/dict/c.dict',
\ 'cpp' : '~/.vim/dict/cpp.dict',
\ 'scheme' : '~/.vim/dict/scheme.dict',
\ 'html' : '~/.vim/dict/html.dict',
\ 'css' : '~/.vim/dict/css.dict'
\ }

" Enable snipMate compatibility feature
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets'


" Select with <TAB>
" <TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-h> neocomplcache#cancel_popup()

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete maker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


"---Beautify---
":Beautifyで整形・変換を行う
NeoBundleLazy 'alpaca-tc/beautify.vim', {
\  'autoload' : {
\    'commands' : [
\      {
\        'name' : 'Beautify',
\        'complete' : 'customlist,beautify#complete_options'
\      }
\    ]
\  }
\ }


" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" コメントのON/OFFを手軽に実行(Ctrl + -を２回)
NeoBundle 'tomtom/tcomment_vim'

" インデントに色をつけて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level=1
" let g:indent_guides_color_change_percent=30
"autocmd VimEnter,Colorscheme * :hi CorsorLine cterm=underline ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=12
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240
" set background=dark
let g:indent_guides_guide_size=1
"let g:indent_guides_guide_size=&tabstop


" ログファイルを色付けしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

" Markdownの環境
"NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'


"---------------------------
"base setting
"---------------------------
"カラースキーマを設定
colorscheme koehler

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_runnning")
    "シンタックスハイライトを有効にする
    syntax enable 
    "検索結果の文字列のハイライトを有効にする
    set hlsearch
endif

"<Space>.を押せば.vimrcが開くようにする
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>

"<Space>s.を押せば.vimrcをリロードする
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

"全モードでマウスを有効化
set mouse=a

"□や○があってもカーソル位置がずれないようにする
set ambiwidth=double

"コマンドライン保管するときに強化されたものを使う
set wildmenu

"クリップボードを共有
set clipboard+=unnamed
set clipboard=unnamed

"Visual blockモードでフリーカーソルを有効にする
set virtualedit=block

"--------------------------
"display
"--------------------------
"タイトルをウィンドウ枠に表示する
set title

"行番号を表示する
set number

"右下に表示される行・列の番号を表示する
set ruler

"入力中のコマンドをステータスに表示する
set showcmd

"括弧入力時の対応する括弧を表示
set showmatch

"コマンドラインの高さ
set cmdheight=1
set laststatus=2

"コメント文の色を変更
highlight Comment ctermfg=DarkCyan

"ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

"画面最後の行をできる限り表示する
set display=lastline

"カーソル行をハイライト
set cursorline

"カレントウィンドウのカーソル行をハイライトする
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

"---------------------------
"edit
"---------------------------

"---indent---
"オートインデントを有効にする
set autoindent
" 改行時に入力された行の末尾に合わせて次のインデントを増幅する
set smartindent
"タブが対応する空白の数
set tabstop=4
set softtabstop=4
" set shiftwidth=4
"タブ入力を複数の空白入力に置き換える
set expandtab

set noswapfile


"---emmet---
"ctrl + e で展開
let g:user_emmet_expandabbr_key = '<c-e>'

"展開設定(インデントをスペース２つにして展開した時のlangをjaに)
let g:user_emmet_settings = {
\ 'indentation' : '  ',
\ 'lang' : 'ja'
\}


"ファイルタイプ関連を有効にする
filetype plugin indent on

NeoBundleCheck
