if status is-interactive
    # Commands to run in interactive sessions can go here
end

set --universal nvm_default_version lts

set fish_greeting
#fish_vi_key_bindings
abbr -a gs git status
abbr -a gss git status -s
abbr -a ga git add
abbr -a gp git push
abbr -a gb git branch
abbr -a gc git commit
abbr -a gco git checkout
abbr -a gl git log --graph --oneline --decorate

abbr -a c clear
abbr -a lg lazygit
abbr -a nv nvim
abbr -a ... ../..

#LSD Functions
function la
    lsd -A
end

function ll
    lsd -al --group-dirs first
end

function ls
    lsd
end


# Keep this at the end
#starship init fish | source
source "$HOME/.cargo/env.fish"
zoxide init fish | source
set PATH "$HOME/.local/bin:$HOME/bin:$PATH"
