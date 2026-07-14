# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples

export PATH="$HOME/.local/bin:$PATH"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

setopt autocd

# zsh plugins with zinit
zinit load zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# zinit snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# activate omp
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/catppuccin_Zee.omp.json)"

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# zsh highlight styling
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan, bold'


# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# aliases
alias l='eza --color=always --long --git --no-filesize --icons=automatic --no-time --no-user --no-permissions' # better ls
alias ll='eza -l --icons=automatic'
alias la='eza -A --icons=automatic'
alias lla='eza -lA --icons=always --git'
alias lt='eza -T --icons=automatic'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

alias ff='fastfetch'
alias speedtest='speedtest --secure'
alias clock='tty-clock -c -C 5 -s -b'

alias c='clear'
alias q='exit'

alias wa='whatscli'
alias rtodo='cat ~/Todo.txt'
alias wtodo='nano ~/Todo.txt'

alias raven='distrobox enter kali-raven'


open() {
    local target="${1:-.}"
    xdg-open "$target" >/dev/null 2>&1 &
    disown %+$  # Tells the shell to forget about this background job immediately
}

# fzf color scheme
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
zstyle ':fzf-tab:completion:*' list-colors "${(s.:.)LS_COLORS}"

eval "$(zoxide init zsh)"
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
fi

# Error sound setup

autoload -Uz add-zsh-hook

error_sound() {
    [[ $? -ne 0 ]] && setsid ffplay -nodisp -autoexit -loglevel quiet ~/Audio/error.mp3 >/dev/null 2>&1 < /dev/null
}
add-zsh-hook precmd error_sound

# On startup runs
clear
ff
