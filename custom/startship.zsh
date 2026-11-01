if (( $+commands[starship] )); then
  # change default config dir
  export STARSHIP_CONFIG="$DOTFILES/starship-rs/starship.toml"

  # ignore oh-my-zsh theme
  unset ZSH_THEME

  eval "$(starship init zsh)"

else
  echo '[oh-my-zsh] starship not found, please install it from https://starship.rs'
fi

