# Sheldon (plugins)
# - Must be called first
# - Must be called before `zoxide`
# - https://github.com/ajeetdsouza/zoxide/issues/348
eval "$(sheldon source)"

# Completions (downloaded by sheldon)
fpath=(~/.zsh_completions "${fpath[@]}")

# Custom functions
# - https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh
fpath=( ~/.zsh_functions "${fpath[@]}" )

# Autoload custom functions
# - https://dev.to/lukeojones/1up-your-zsh-abilities-by-autoloading-your-own-functions-2ngp
autoload -Uz $fpath[1]/*(.:t)

# Autoload completions
# - Completions in depth
# - https://thevaluable.dev/zsh-completion-guide-examples/
autoload -Uz compinit
compinit

# Use `fd` with `fzf` completions
# - https://github.com/junegunn/fzf#settings
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# NOTE
# - `~/.zshenv` is sourced too early for the asdf scripts to be useful
# - As a result we have to source this as part of the `~/.zshrc`
ASDF_HOME="$HOME/.asdf/asdf.sh"
if [ -f $ASDF_HOME ]; then
  source $ASDF_HOME
fi

# https://stackoverflow.com/questions/53996607/most-efficient-if-statement-in-zshrc-to-check-whether-linux-os-is-running-on-ws
if [[ $(uname -r) == (#s)*[mM]icrosoft*(#e) ]]; then
  # NOTE
  # - Long term would like to find a better location for this
  ZSH_WSL_HELPERS="$HOME/.zsh_wsl_helpers"
  source $ZSH_WSL_HELPERS
fi

# NOTE
# - By default macOS adds brew to the `$PATH` after `~/.zshenv` is loaded
# - We could override this behaviour but it feels counter intuitive when it can be done automatically
export VISUAL=$(which hx)
export EDITOR=$(which hx)

# Zoxide (z)
eval "$(zoxide init zsh)"

# Starship (ZSH Prompt)
eval "$(starship init zsh)"

