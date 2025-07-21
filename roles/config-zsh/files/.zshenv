# Setup ZSH environment
# - https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
# - https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where

# Manually set XDG config to `~/.config`
# - Required for `zoxide`
export XDG_CONFIG_HOME="$HOME/.config"

# Turn on additional suggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# This file is not tracked as it contains private keys
PRIVATE_KEYS="$HOME/.zsh_private_keys"
if [ -f $PRIVATE_KEYS ]; then
  source $PRIVATE_KEYS
fi

FZF_THEME="$HOME/zsh_fzf_themes/base16-everforest.config"
if [ -f $FZF_THEME ]; then
  source $FZF_THEME
fi

# Use `fd` for standard `fzf` usage
# - https://github.com/junegunn/fzf#respecting-gitignore
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# fly.io
export FLYCTL_INSTALL="$HOME/.fly"

# Java (Zulu)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"
