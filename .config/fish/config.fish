if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set -g hydro_color_pwd      white
set -g hydro_color_git      brmagenta
set -g hydro_color_start    cyan
set -g hydro_color_error    brred
set -g hydro_color_duration bryellow
set -g hydro_color_prompt   brgreen
set -g hydro_multiline true
set -g hydro_fetch true

set -gx EDITOR nvim

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
abbr -a sss sudo systemctl suspend

function nd 
nohup neovide &>/dev/null &
end

function n
    foot nvim . &>/dev/null &
end

function ff
    cd (tv dirs)
end

function cpshot
    set src_dir ~/Pictures/Screenshots

    if not test -d $src_dir
        echo "Screenshot directory not found: $src_dir"
        return 1
    end

    if test (count $argv) -ne 1
        echo "Usage: cpshot <new-name-without-extension>"
        return 1
    end

    # Find most recent file
    set latest (ls -t $src_dir | head -n 1)

    if test -z "$latest"
        echo "No files found in $src_dir"
        return 1
    end

    set ext (string split -r -m1 . $latest)[2]
    set dest "$argv[1].$ext"

    cp "$src_dir/$latest" "$dest"
    echo "Copied $latest → $dest"
end

abbr -a ... ../..

abbr -a de distrobox enter

#LSD Functions
abbr -a l 'eza --icons --group-directories-first'
function la
    eza -A --icons --group-directories-first
end

function ll
    eza -al --icons --group-directories-first
end

function mcd
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

function tempe
    # Create and move into a temporary directory
    cd (mktemp -d)

    if test (count $argv) -eq 1
        command mkdir -p $argv[1]
        cd $argv[1]
    end
end

# Keep this at the end
#starship init fish | source
source "$HOME/.cargo/env.fish"
zoxide init fish | source
fish_add_path "$HOME/.local/bin" "$HOME/bin"

fish_add_path "$HOME/eric/scripts"

# function fish_prompt
#     set_color normal
#     echo -n (basename (pwd))
#     echo -n ' '
#     set_color green
#     echo -n '$ '
#     set_color normal
# end

$HOME/.local/bin/mise activate fish | source
