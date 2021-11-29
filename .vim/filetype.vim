if exists("did_load_filetypes")
        finish
endif
augroup filetypedetect
    " ファイルの拡張しごとにタブ幅を設定
    au BufNewFile,BufRead *.c           setfiletype c
    au BufNewFile,BufRead *.ino         setfiletype c
    au BufNewFile,BufRead *.cuda        setfiletype cuda
    au BufNewFile,BufRead *.cpp         setfiletype cpp
    au BufNewFile,BufRead *.rb          setfiletype ruby
    au BufNewFile,BufRead *.erb         setfiletype eruby
    au BufNewFile,BufRead *.py          setfiletype python
    au BufNewFile,BufRead *.php         setfiletype php
    au BufNewFile,BufRead *.perl        setfiletype perl
    au BufNewFile,BufRead *.html        setfiletype html
    au BufNewFile,BufRead *.vim         setfiletype vim
    au BufNewFile,BufRead *.tex         setfiletype tex
    au BufNewFile,BufRead *.sty         setfiletype tex
    au BufNewFile,BufRead *.coffee      setfiletype coffee
    au BufNewFile,BufRead *.yml         setfiletype yaml
    au BufNewFile,BufRead *.css         setfiletype css
    au BufNewFile,BufRead *.scss        setfiletype scss
    au BUfNewFile,BufRead *.less        setfiletype less
    au BufNewFile,BufRead *.java        setfiletype java
    au BufNewFile,BufRead *.js          setfiletype javascript
    au BufNewFile,BufRead *.ts          setfiletype javascript
    au BufNewFile,BufRead *.vue         setfiletype vue
    au BufNewFile,BufRead *.json        setfiletype json
    au BufNewFile,BufRead *.md          setfiletype markdown
    au BufNewFile,BufRead *.xml         setfiletype xml
    au BufNewFile,BufRead *.io          setfiletype io
augroup END
