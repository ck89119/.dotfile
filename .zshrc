# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="awesome-patched"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    git
    zsh-syntax-highlighting
    zsh-vi-mode
)
if [ `uname` = "Darwin" ]; then
    plugins+=(macos)
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# brew
if [ `arch` = "arm64" ]; then
    export BREW_PREFIX=/opt/homebrew
else
    export BREW_PREFIX=/usr/local
fi

# default path
export PATH="$BREW_PREFIX/bin:$BREW_PREFIX/sbin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

# go
export GOROOT=$BREW_PREFIX/opt/go/libexec
export GOPATH=$HOME/Develop/go
export GOPROXY=https://goproxy.cn
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# cpp
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$HOME/.dotfile/include
# if [ `uname` = "Darwin" ]; then
#     alias g++='clang++'
#     alias clang++='clang++ -std=c++17'
# fi

# llvm
export PATH="/opt/homebrew/opt/llvm@16/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@16/include"

# python
export PATH=$PATH:$BREW_PREFIX/opt/python/libexec/bin

# java
if [ `uname` = "Darwin" ]; then
    JAVA_VERSION='1.8.0_333'
    export JAVA_HOME=$(/usr/libexec/java_home -v $JAVA_VERSION)
fi

# rust
export PATH=$PATH:$HOME/.cargo/bin

export TERM="xterm-256color"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# alias emacs=emacsclient
alias tmux='tmux -2'

# vscode
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# bindkey
if [ `uname` = "Linux" ]; then
    bindkey "^[[1;3C" forward-word
    bindkey "^[[1;3D" backward-word
fi

# riscv-gnu-toolchain
export PATH=$PATH:$BREW_PREFIX/Cellar/riscv-gnu-toolchain/bin

# tidb
export PATH=/Users/LoveYY/.tiup/bin:$PATH

# tools
if [ `uname` = "Linux" ]; then
    alias bat='batcat'
    alias fd='fdfind'
    BAT='batcat'
    FD='fdfind'
fi
alias cat='bat --paging=never'
alias diff='delta'
alias ls='eza --color=always --long --git'

export BAT_THEME="Solarized (dark)"
export MANPAGER="sh -c 'col -bx | $BAT -l man -p'"

# fzf
if [ `uname` = "Darwin" ]; then
    eval "$(fzf --zsh)"
else
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
fi

fg="#CBE0F0"
bg="#011628"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"
export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

export FZF_DEFAULT_COMMAND="$FD --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FD --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

preview_file_cmd="$BAT -n --color=always --line-range :500 {}"
preview_dir_cmd="eza --tree --level=1 --color=always {} | head -200"
show_file_or_dir_preview="if [ -d {} ]; then $preview_dir_cmd; else $preview_file_cmd; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview '$preview_dir_cmd'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --level=1 --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
