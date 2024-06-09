# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /home/eric/.antidote/antidote.zsh
source ~/.zaliases
export ELECTRON_OZONE_PLATFORM_HINT=wayland


# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
autoload -U compinit; compinit
zstyle ':completion:*' menu select
source ~/.powerlevel10k/powerlevel10k.zsh-theme

bindkey -r '^S'
bindkey -r '^R'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/eric/.bun/_bun" ] && source "/home/eric/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH=$PATH:/home/eric/.spicetify

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/eric/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/eric/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/eric/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/eric/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

