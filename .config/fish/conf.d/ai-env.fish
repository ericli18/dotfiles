set -l ai_env_file "$__fish_config_dir/private/ai-env.fish"

if test -f $ai_env_file
    source $ai_env_file
end
