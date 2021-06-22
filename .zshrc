# utilize gnu utils installed with brew instead of mac utils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
# have gnu versions of man pages
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

# 256 colors
export TERM=xterm-256color

### Prompt configuration

# Display the existence of files not yet known to VCS

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='*'
  fi
}

# Actual configuration
autoload -U colors && colors 
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{214}(%b%m%u%c) %f'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
PROMPT='%F{240}${(r:$COLUMNS::-:)}%f %2~ ${vcs_info_msg_0_} %# '
RPROMPT='%F{240}%m%f'

# case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt nocaseglob
# enable history logging
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# share history between zsh sessions
setopt sharehistory
setopt appendhistory
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# <C-r> searches zsh command history
bindkey '^R' history-incremental-search-backward



# Example aliases
alias typora="open -a typora"
alias ls="ls --color"
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias lsa='ls -lah'
alias md='mkdir -p'
alias mv="mv -i"
alias cp="cp -i"
alias python='python3'
alias pip='pip3'
alias nlghci='stack ghci --no-load'
#alias emacs='emacs -nw'


# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# NIX settings
if [ -e /home/alfredang/.nix-profile/etc/profile.d/nix.sh ]; then . /home/alfredang/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
alias ni="nix-env -f '<nixpkgs>' -iA"
function ghciWith { nix-shell -p "haskellPackages.ghcWithPackages (pkg: with pkg;[$argv])" --run ghci; }
eval "$(direnv hook zsh)"
eval $(thefuck --alias)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# opam configuration
test -r /home/alfredang/.opam/opam-init/init.zsh && . /home/alfredang/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
