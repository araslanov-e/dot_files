PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
SSH_ENV=$HOME/.ssh/environment

# load custom executable functions
for function in ~/.bash/*; do
  source $function
done

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# GO
export PATH=$PATH:/usr/local/go/bin

# some more ls aliases
alias ll='ls -alF -color'
alias la='ls -A -color'
alias l='ls -CF -color'

# cd aliases
alias cdb='cd ..'
alias cdh='cd ~'

# start the ssh-agent
function start_agent {
  echo "Initializing new SSH agent..."
  #  spawn ssh-agent
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
  echo succeeded
  chmod 600 ${SSH_ENV}
  . ${SSH_ENV} > /dev/null
  /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
  . ${SSH_ENV} > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# ENV
export PAGER=less
export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Save
bind -r '\C-s'
stty -ixon
