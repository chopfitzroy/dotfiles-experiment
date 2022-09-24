# Volta (Node version manager)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Manually set XDG config to `~/.config`
export XDG_CONFIG_HOME="$HOME/.config"

# Enable auto complete for git
autoload -Uz compinit && compinit

# Sheldon
eval "$(sheldon source)"

# Starship (ZSH Prompt)
eval "$(starship init zsh)"
