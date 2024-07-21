fpath+=~/.zfunc

source ~/alias
source ~/.myshrc

# VCS情報を取得するzshの便利関数vcs_infoを使う
autoload -Uz vcs_info

# branch情報の表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


# 名前で色を付けるようにする
autoload colors
colors

# LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33;ex=31;bd=46;34;cd=43;34;su=41;30:sb=46;30:tw=42;30:ow=43;30'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -U compinit
compinit -u#
# 補完候補の大文字小文字の区別なしに表示する（ただし大文字の補完は大文字の候補にマッチ）
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
# 補完候補に色づけする
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 補完候補を十字キーで選択
zstyle ':completion:*:default' menu select=2


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


