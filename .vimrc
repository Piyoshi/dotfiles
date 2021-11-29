"一旦ファイルタイプ関連を無効かする
filetype off
filetype plugin indent off


"---------------------------
" plugin manage
"---------------------------
"dein.vim
if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/repos/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin(expand('~/.vim/dein'))

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'


  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})


  "--------------------------
  " color
  "--------------------------
  "colorscheme
  "tomorrow-theme
  call dein#add('chriskempson/vim-tomorrow-theme')
  "hybrid
  set background=dark
  set background=dark
  call dein#add('w0ng/vim-hybrid')
  "jellybeans
  call dein#add('nanotech/jellybeans.vim')
  "twilight
  call dein#add('vim-scripts/twilight')
  "lucius##
  call dein#add('jonathanfilip/vim-lucius')
  "railscasts
  call dein#add('jpo/vim-railscasts-theme')
  "solarized
  call dein#add('altercation/vim-colors-solarized')
  "wombat
  call dein#add('vim-scripts/Wombat')
  "rdark
  call dein#add('vim-scripts/rdark')
  "zenburn
  call dein#add('vim-scripts/Zenburn')
  "molokai
  call dein#add('tomasr/molokai')
  "mustang
  call dein#add('croaker/mustang-vim')
  "mrkn256
  call dein#add('mrkn/mrkn256.vim')
  "pyte
  call dein#add('therubymug/vim-pyte')
  "landscape
  call dein#add('itchyny/landscape.vim')

  call dein#add('Shougo/unite.vim')
  "colorscheme一覧表示
  "Unite.vim (:Unite colorscheme -auto-preview)
  call dein#add('ujihisa/unite-colorscheme')
  " Unite.vimで最近使ったファイルを表示できるようにする
  call dein#add('Shougo/neomru.vim')
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
  call dein#add('scrooloose/nerdtree')
  " tree表示をノーマルモードのShift + t にマッピングする
  nmap <silent> <S-T> :NERDTreeToggle<CR>

  "------------------------------
  " input
  "------------------------------
  "入力補完機能
  call dein#add('Shougo/neocomplcache')
  "スニペット入力サポート
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  "ステータスライン表示をおしゃれに
  call dein#add('itchyny/lightline.vim')
  let g:lightline = {
        \ 'colorscheme': 'landscape',
        \ 'component': {
        \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
        \ },
        \ 'separator': {'left': '\ue0b0', 'right': '\ue0b2'},
        \ 'subseparator': {'left': '\ue0b1', 'right': '\ue0b3'}
        \}

  "HTMLタグなどの囲まれているものの編集補助
  call dein#add('vim-scripts/surround.vim')
  "シンタックスチェックプラグイン
  call dein#add('scrooloose/syntastic')
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


  ""---Beautify---
  "":Beautifyで整形・変換を行う
  "NeoBundleLazy 'alpaca-tc/beautify.vim', {
  "\  'autoload' : {
  "\    'commands' : [
  "\      {
  "\        'name' : 'Beautify',
  "\        'complete' : 'customlist,beautify#complete_options'
  "\      }
  "\    ]
  "\  }
  "\ }
  " Ruby向けにendを自動挿入してくれる
  call dein#add('tpope/vim-endwise')

  " コメントのON/OFFを手軽に実行(Ctrl + -を２回)
  call dein#add('tomtom/tcomment_vim')

  " ログファイルを色付けしてくれる
  call dein#add('vim-scripts/AnsiEsc.vim')

  " 行末の半角スペースを可視化
  call dein#add('bronson/vim-trailing-whitespace')

  " 色のプレビューを表示
  call dein#add('gorodinskiy/vim-coloresque')


  " Markdownの環境
  "call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')
  " HTML5
  call dein#add('othree/html5.vim')

  " CSS3
  call dein#add('hail2u/vim-css3-syntax')

  " SCSS
  call dein#add('cakebaker/scss-syntax.vim')

  " LESS
  call dein#add('groenewege/vim-less')

  " Elixir
  call dein#add('elixir-lang/vim-elixir')

  " Coffee Script
  call dein#add('kchmck/vim-coffee-script')

  " Io
  "call dein#add('andreimaxim/vim-io')

  " JavaScript
  " インデントをそろえる
  call dein#add('jiangmiao/simple-javascript-indenter')
  let g:SimpleJsIntenter_CaseIndnetLEvel = -1
  " シンタックスハイライト
  call dein#add('jelera/vim-javascript-syntax')

  " ES6
  call dein#add('isRuslan/vim-es6')
  " JSON
  call dein#add('elzr/vim-json')
  " Jqコマンドとの連携によるJSON整形
  " command! -nargs=? Jq call s:Jq(<f-args>)
  " function! s:Jq(...)
  "   if 0 == a:0
  "     let l:arg = "."
  "   else
  "     let l:arg = a:l
  "   endif
  "   execute '%! jq 95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;' . l:arg . '95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;'
  " endfunction

  call dein#add('leafgarland/typescript-vim')

  call dein#add('posva/vim-vue')
  call dein#add('leafoftree/vim-vue-plugin')

  call dein#add('rust-lang/rust.vim')

  call dein#add('udalov/kotlin-vim')

  "" インデントに色をつけて見やすくする
  "call dein#add('nathanaelkane/vim-indent-guides')
  "" vimを立ち上げたときに自動的にvim-indent-guidesをオンにする
  "let g:indent_guides_enable_on_vim_startup=1
  "let g:indent_guides_auto_colors=0
  "let g:indent_guides_start_level=1
  "" let g:indent_guides_color_change_percent=30
  ""autocmd VimEnter,Colorscheme * :hi CorsorLine cterm=underline ctermbg=234
  "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=12
  "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240
  "set background=dark
  "let g:indent_guides_guide_size=1
  ""let g:indent_guides_guide_size=&tabstop



  "--------------------------
  " Other
  "--------------------------
  call dein#add('vim-scripts/sudo.vim')

  call dein#end()
  call dein#save_state()
endif


" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif



" vim-indent-guides インデントに色をつけて見やすくする
" vimを立ち上げたときに自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_start_level=1
" let g:indent_guides_color_change_percent=30
"autocmd VimEnter,Colorscheme * :hi CorsorLine cterm=underline ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=12
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240
let g:indent_guides_guide_size=1
"let g:indent_guides_guide_size=&tabstop

""インデントを線で可視化
"call dein#add('Yggdroot/indentLine')

"" Vim
"let g:indentLine_color_term = 239

"" GVim
"let g:indentLine_color_gui = '#A4E57E'

"" none X terminal
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)

"" Background (Vim, GVim)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'

"let g:indentLine_char = 'c'



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

"モード毎にカーソルを変形
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[2 q"
let &t_te.="\e[1 q"

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
set shiftwidth=4
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
