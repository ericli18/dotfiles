# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/ericli/.zsh/completions:"* ]]; then export FPATH="/home/ericli/.zsh/completions:$FPATH"; fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /home/ericli/.antidote/antidote.zsh
source /home/ericli/.zsh_aliases
export ELECTRON_OZONE_PLATFORM_HINT=wayland


# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
autoload -U compinit; compinit
zstyle ':completion:*' menu select

bindkey -r '^S'
bindkey -r '^R'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# `autoload -Uz promptinit && promptinit && prompt pure`

# bun completions
[ -s "/home/eric/.bun/_bun" ] && source "/home/eric/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.cargo/env"
. "/home/ericli/.deno/env"