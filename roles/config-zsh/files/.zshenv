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

# Set Glamour style (for Slides)
# Hopefully we will be able to set the code block theme in the future
# - https://github.com/maaslalani/slides/issues/205
export GLAMOUR_STYLE="$XDG_CONFIG_HOME/glamour/themes/mocha.json"

# Nap snippet manager
# - This can be moved to a config file after next release
export NAP_HOME="$HOME/.local/share/nap"
export NAP_THEME="catppuccin-mocha"
export NAP_DEFAULT_LANGUAGE="ts"

# Catppuccin theme
# - https://github.com/catppuccin/fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

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
