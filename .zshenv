# Setup ZSH environment
# - https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
# - https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where

# Go
# - https://go.dev/doc/code
export GOPATH="$HOME/go"

# Manually set XDG config to `~/.config`
# - Required for `zoxide`
export XDG_CONFIG_HOME="$HOME/.config"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"

# Android SDK (depreceated)
# - https://github.com/facebook/react-native/issues/34304
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"

# Turn on additional suggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Nap snippet manager
# - This can be moved to a config file after next release
export NAP_HOME="$HOME/.local/share/nap"
export NAP_THEME="gruvbox"
export NAP_DEFAULT_LANGUAGE="ts"

# Use gruvbox theme with `bat`
export BAT_THEME="gruvbox-dark" 

# Use `fd` for standard `fzf` usage
# - https://github.com/junegunn/fzf#respecting-gitignore
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# Could probably add this to path manually
# However this is the way the Rust installer does it by default
CARGO_ENV_PATH="$HOME/.cargo/env"
if [ -f $CARGO_ENV_PATH ]; then
  source $CARGO_ENV_PATH
fi

# Remove duplicate entries
# - https://stackoverflow.com/questions/68605927/how-can-i-change-path-variable-in-zsh
typeset -U path PATH

path=(
  $HOME/.local/bin
  $GOPATH/bin
  $ANDROID_HOME/emulator
  $ANDROID_HOME/platform-tools
  $path
)
