# Setup ZSH environment
# - https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
# - https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where

# Manually set XDG config to `~/.config`
# - Required for `zoxide`
export XDG_CONFIG_HOME="$HOME/.config"

# Volta (Node version manager)
export VOLTA_HOME="$HOME/.volta"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"

# Turn on additional suggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Match terminal color scheme
# - https://github.com/junegunn/fzf/wiki/Color-schemes
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

# Remove duplicate entries
# - https://stackoverflow.com/questions/68605927/how-can-i-change-path-variable-in-zsh
typeset -U path PATH

# Ignore missing directories `(-/N)`
# - https://unix.stackexchange.com/questions/31193/adding-paths-to-path-using-a-multi-line-syntax
path=(
  $HOME/.local/bin(N-/)
  $VOLTA_HOME/bin(N-/)
  $ANDROID_HOME/emulator(N-/)
  $ANDROID_HOME/platform-tools(N-/)
  /usr/local/go/bin(N-/)
  $path
)

# Could probably add this to path manually
# However this is the way the Rust installer does it by default
if [ -f $HOME/.cargo/env ]; then
  source "$HOME/.cargo/env"
fi

