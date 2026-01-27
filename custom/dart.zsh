# Pub installs executables into $HOME/.pub-cache/bin

add_to_path_if_exists() {
  local dir="$1"
  if [[ -d "$dir" ]] && [[ ":${PATH}:" != *":${dir}:"* ]]; then
    export PATH="${dir}:${PATH}"
  fi
}

add_to_path_if_exists "$HOME/.pub-cache/bin"
