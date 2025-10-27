# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /home/ericli/.antidote/antidote.zsh
source /home/ericli/.zsh_aliases
export ELECTRON_OZONE_PLATFORM_HINT=wayland

ff() {
    cd $(tv dirs)
}



# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
autoload -U compinit; compinit
zstyle ':completion:*' menu select

bindkey -r '^S'
bindkey -r '^R'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# `autoload -Uz promptinit && promptinit && prompt pure`

. "$HOME/.cargo/env"

eval "$(zoxide init zsh)"

. "$HOME/.local/share/../bin/env"
