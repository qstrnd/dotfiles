###########################
# ZSH CUSTOMIZATION

# set theme to powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Source Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add .zsh to the shell's path
fpath=(~/.zsh $fpath)

# static load for antibody plugin manager
# all specific plugins are listed in ~/.zsh_plugins.txt
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# Completion setup
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash # load git completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' # case insensitive completion
autoload -Uz compinit && compinit # enable copinit to load completion functions

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk # bind jk to escape in insert mode
HYPHEN_INSENSITIVE="true" # make hyphen insensitive

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(
    git
    brew
    common-aliases
    history
)

# set oh-my-zsh path
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh # load oh-my-zsh

###########################
# INITIAL LOADING

# setup path for ruby
eval "$(rbenv init -)"

# Add ssh key to key agent
# eval "$(ssh-agent -s)" && ssh-add --apple-use-keychain ~/.ssh/ozon_ssh
eval "$(ssh-agent -s)" && find ~/.ssh -type f -name '~/.ssh/ozon_ssh' -exec ssh-add {} \;

###########################
# GLOBAL VARIABLES

export PATH="$PATH:$HOME/sourcekit-lsp/.build/debug/"
export PATH="$PATH:$HOME/Library/Mobile Documents/com~apple~CloudDocs/Scripts/bin/" # scripts stored in iCloud
export PATH="$PATH:$HOME/Developer/dotfiles/bin/" # scripts stored in dotfiles repo

export DRIVEPATH="$HOME/Library/Mobile Documents/com~apple~CloudDocs/" # iCloud path
export DOTFILESPATH="$HOME/Developer/dotfiles/" # dotfiles repo path

###########################
# SCRIPTS & Functions

source "$DOTFILESPATH/bash/xcode_simulator.sh" # simulator functions
source "$DRIVEPATH/Scripts/bin/default-scripts" # run default scripts

###########################
# ALIASES

alias vim='nvim'
alias v='nvim'
alias c='code'

# Pods
alias pi='pod install'

# Navigation
alias tf='open -a Finder .'
alias cddrive="cd '$DRIVEPATH'"
alias cddrivebin="cd '$DRIVEPATH/Scripts/bin'"
alias cdbin="cd ~/Developer/dotfiles/bin"
alias cdd='cd ~/Developer'
alias cdo='cd ~/Developer/ozon'
alias cdo2='cd ~/Developer/ozon-2'
alias cdc='cd ~/Developer/contracts'
alias cdjs='cd ~/Developer/JS'
alias cddotfiles='cd ~/Developer/dotfiles'
alias ..='cd ..'
alias ~='cd ~'

# Better default commands
alias ll='ls -lh' # List all files in long format
alias mv='mv -i' # Move with confirmation
alias rm='rm -i' # Remove with confirmation
alias mkdir='mkdir -p' # Create parent directories on the fly
alias cls='clear' # Clear the terminal
alias df='df -h' # Disk free in human readable format

# zsh
alias zshconf='code ~/.zshrc'
alias zshreload='source ~/.zshenv'

###########################
# FUNCTIONS

# make directory and cd into it
function mkcd() {
  mkdir -p "$@" && cd "$@"
}