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


# share history between zsh sessions
setopt sharehistory
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
if [ -e /Users/alfredang/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/alfredang/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
alias ni="nix-env -f '<nixpkgs>' -iA"
function ghciWith { nix-shell -p "haskellPackages.ghcWithPackages (pkg: with pkg;[$argv])" --run ghci; }
eval "$(direnv hook zsh)"
eval $(thefuck --alias)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# @begin(96550156)@ - Do not edit these lines - added automatically!
# You should customize CIAOPATH before this chunk if you place bundles in
# places other than ~/.ciao
if [ -x /Users/alfredang/temp/ciao/build/bin/ciao-env ] ; then
  eval "$(/Users/alfredang/temp/ciao/build/bin/ciao-env --sh)"
fi
# @end(96550156)@ - End of automatically added lines.

PATH="/Users/alfredang/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/alfredang/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/alfredang/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/alfredang/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/alfredang/perl5"; export PERL_MM_OPT;

# opam configuration
test -r /Users/alfredang/.opam/opam-init/init.zsh && . /Users/alfredang/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
