# Volta (Node version manager)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Enable auto complete for git
autoload -Uz compinit && compinit

# Starship (ZSH Prompt)
eval "$(starship init zsh)"
