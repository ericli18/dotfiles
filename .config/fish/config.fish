if status is-interactive
    # Commands to run in interactive sessions can go here
end


set -g hydro_color_pwd      brcyan
set -g hydro_color_git      bryellow
set -g hydro_color_start    brgreen
set -g hydro_color_error    brred
set -g hydro_color_duration brmagenta
set -g hydro_multiline true
set -g hydro_fetch true

set --universal nvm_default_version latest
set -gx EDITOR vim

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
abbr -a dl gio trash

function nd 
nohup neovide &>/dev/null &
end

function ff
    cd (tv dirs)
end
abbr -a ... ../..

abbr -a de distrobox enter

#LSD Functions
abbr -a l 'eza --icons --group-directories-first'
function la
    eza -A
end

function ll
    eza -al
end

function md
    if test (count $argv) -ne 1
        echo "Usage: mcd <directory>"
        return 1
    end

    mkdir -p $argv[1]

    if test $status -eq 0
        cd $argv[1]
    else
        echo "Failed to create directory '$argv[1]'."
        return $status
    end
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end



# Keep this at the end
#starship init fish | source
source "$HOME/.cargo/env.fish"
zoxide init fish | source
set PATH "$HOME/.local/bin:$HOME/bin:$PATH"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if status --is-interactive
#     if test -f /home/ericli/miniconda3/bin/conda
#         eval /home/ericli/miniconda3/bin/conda "shell.fish" hook $argv | source
#     else
#         if test -f "/home/ericli/miniconda3/etc/fish/conf.d/conda.fish"
#             . "/home/ericli/miniconda3/etc/fish/conf.d/conda.fish"
#         else
#             set -x PATH /home/ericli/miniconda3/bin $PATH
#         end
#     end
# end
# <<< conda initialize <<<
# ~/.local/bin/mise activate fish | source
