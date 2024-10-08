# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Tmuxinator
# source ~/.tmuxinator.zsh
alias mux='tmuxinator'

# Aliases
alias ll='ls -alF -color'
alias xcc='xclip -selection clipboard'
alias opendir='nautilus'

export EDITOR=vim

#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

export PATH=$PATH:/usr/local/go/bin
# TODO: add kubectl
# source <(kubectl completion zsh)

# kubectlo
alias kpods='kubectl get pods'
alias kexec='kubectl exec -it'
alias kcontexts='kubectl config get-contexts'
alias kuse='kubectl config use-context'
kconnect () {
  kuse $1 && kexec $(echo -n $(kpods | grep $2 | head -1 | sed 's/\s.*//g')) bash
}
kconsole() {
  kuse $1 && kexec $(echo -n $(kpods | grep $2 | head -1 | sed 's/\s.*//g')) bundle exec rails c
}
kirb() {
  kuse $1 && kexec $(echo -n $(kpods | grep $2 | head -1 | sed 's/\s.*//g')) bundle exec  irb
}
kbash() {
  kuse $1 && kexec $(echo -n $(kpods | grep $2 | head -1 | sed 's/\s.*//g')) bash
}   

eval $(thefuck --alias)

source ~/.gitshrc
source ~/.zshrc_local

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
else
  . /usr/local/opt/asdf/asdf.sh
fi
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# # initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# drone
export DRONE_SERVER=https://ci.citbits.com
export DRONE_TOKEN=q3LzumdPAmPFLkOGn0BZbYapEoX6MYxg

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

