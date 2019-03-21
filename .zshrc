# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tobal/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Autoload the prompt theme system
autoload -Uz promptinit
promptinit
prompt bart

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Load custom prompt
#if [ -f ~/.zsh_prompt ]; then
#    . ~/.zsh_prompt
#fi

# Set path
export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# Set up pyenv
# Install with:
# $> curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# System specific settings
# TODO: move these to where they belong
export ALSA_CARD=PCH
