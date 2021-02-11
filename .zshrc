# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.emacs.d/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# utilize gnu utils installed with brew instead of mac utils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
# have gnu versions of man pages
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH




# 256 colors
export TERM=xterm-256color

# User configuration
autoload -U colors && colors 
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{240}(%b|%m%c%u)%f'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' stagedstr "+"
PROMPT='$FG[032]%2~%f ${vcs_info_msg_0_} %# '

# Set vi-mode
set -o vi

# share history between zsh sessions
setopt sharehistory



# Example aliases
alias typora="open -a typora"
alias ls="ls --color=auto"
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
alias emacs='emacs -nw'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if [ -e /Users/alfredang/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/alfredang/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


# NIX settings
alias ni="nix-env -f '<nixpkgs>' -iA"
function ghciWith { nix-shell -p "haskellPackages.ghcWithPackages (pkg: with pkg;[$argv])" --run ghci; }
eval "$(direnv hook zsh)"
eval $(thefuck --alias)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH=/usr/local/bin:$PATH

