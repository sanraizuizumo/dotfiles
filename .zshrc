# ~/.zshrc zsh シェルの設定


# 環境変数
export LANG=ja_JP.UTF-8

# 自動補完
autoload -Uz compinit; compinit

# "..." "...." で上のディレクトリへ移動
alias ...='cd ../..'
alias ....='cd ../../..'

# 削除するか確認
alias rm='rm -i'

# 上書き確認
alias mv='mv -i'

# 中間層のディレクトリも作成
alias mkdir='mkdir -p'

# コマンドのスペルミスを指摘
setopt correct

# 移動したディレクトリを記録 "cd -[Tab]" で一覧
setopt auto_pushd

# コマンドが履歴に含まれる場合,古い方を削除
setopt hist_ignore_all_dups

# 小文字で大文字を補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ディレクトリ名の入力で cd
setopt auto_cd

# 補完候補を一覧で表示
setopt auto_list
setopt nonomatch

# dnf を pacman 風に操作
alias dnfin='sudo dnf install'
alias dnfupg='sudo dnf upgrade'
alias dnfrm='sudo dnf remove'
alias dnfse='sudo dnf search'

# suffix alias
function runcpp(){ g++ -O2 $1; ./a.out }
alias -s {c,cpp}=runcpp

function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

# 色
	autoload colors
	colors

	export LSCOLORS=gxfxcxdxbxexexaxaxaxax
	export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
	zstyle ':completion:*' list-colors 'di=32'

	case "${OSTYPE}" in
	linux*)
		alias ls='ls -F --color'
		;;
	esac

# tmux 自動起動
	if [ -z $TMUX ]; then
		tmux -2
	fi

# プロンプト
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%B%n%b%# "
RPROMPT="[%~]"

zle -N zle-keymap-select
