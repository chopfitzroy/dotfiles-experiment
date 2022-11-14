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

# Could probably add this to path manually
# However this is the way the Rust installer does it by default
CARGO_ENV_PATH="$HOME/.cargo/env"
if [ -f $CARGO_ENV_PATH ]; then
  source $CARGO_ENV_PATH
fi

# NOTE
# - We keep these here instead of `~/.zshenv`
# - This is because they interract with the `$PATH`
# - And `~/.zshenv` is sourced earlier in the shell startup
ASDF_HOME="$HOME/.asdf/asdf.sh"
if [ -f $ASDF_HOME ]; then
  source $ASDF_HOME
fi

# Zoxide (z)
eval "$(zoxide init zsh)"

# Starship (ZSH Prompt)
eval "$(starship init zsh)"

