# Function to alias commands only if they exist
alias_if_available() {
    local alias_name=$1
    local target_command=$2
    local extra_args=${3:-}
    
    if command -v "$target_command" &> /dev/null; then
        alias "$alias_name"="$target_command $extra_args"
        return 0
    else
        echo "Note: $target_command not found, skipping alias '$alias_name'"
        return 1
    fi
}

# alias_if_available nano nvim "--clean"
# alias_if_available unzip unar 
