# Dotfiles

This repo is largely modelled off [this guide](https://germano.dev/dotfiles/).

Criteria of this repo:

- Backed by `git`
- A single repo to manage all dotfiles
- Introduce as few tools/abstractions as possible
- Ability to archive configs for tools I no longer use
- Ability to show a `README.md` on GitHub without needing to have it sit in my `~/`
- Ability to have multiple configs for all tools, i.e a work `.gitconfig` and a personal `.gitconfig`

## Usage

Common scenarios and how to handle them are listed below. You will need to substitute in your own repository location where appropiate.

Rember even though each config is a branch on the remote. **Locally each branch will be initialized as it's own repo**.

### New host

Install both [vcsh](https://github.com/RichiH/vcsh) and [myrepos](https://myrepos.branchable.com/).

**Mac:**

```sh
brew install vcsh myrepos
```

**WLS:**

```sh
sudo apt-get install vcsh myrepos
```

**Clone down the `myrepos` branch:**

```sh
vcsh clone -b myrepos git@github.com:chopfitzroy/dotfiles-experiment.git myrepos
```

**Link desired tools:**

```sh
mkdir ~/.config/mr/config.d/
cd ~/.config/mr/config.d/
ls ../available.d/ # This will print out available configs
ln -s ../available.d/zsh.vcsh # This would setup ZSH config, rinse and repeat for all desired tools
```

**Checkout all the other tools at once:**

```sh
mr checkout
```

### Updating an existing tool/config

```sh
vcsh enter config_name
git status # If you want to confirm changes
git add --all .
git commit -m "Commit message"
git push
```

### Setting up a new tool/config

**Create new _local_ repo:**

```sh
vcsh init config_name
vcsh enter config_name
git remote add origin git@github.com:chopfitzroy/dotfiles-experiment.git
git fetch
git checkout --orphan config_name
```

**Add ignored files:**

```sh
hx ~/.gitignore.d/config_name
```

- Always start with `*`
- Add `!` paths for files you want to track

**Commit new files:**

```sh
vcsh enter config_name
git add --all .
git status # If you want to confirm your ignore paths are working as expected
git commit -m "Commit message"
git push --set-upstream origin config_name
```

**Add `myrepos` config:**

```sh
hx ~/.config/mr/available.d/config_name.vcsh
```

Then paste the following in **pay attention to replacing config_name**:

```
[$HOME/.config/vcsh/repo.d/config_name.git]
checkout =
  vcsh clone -b config_name git@github.com:chopfitzroy/dotfiles-experiment.git config_name
update = vcsh config_name pull
status = vcsh config_name status
```

Once that is done it can be pushed to the remote:

```sh
vcsh enter myrepos
git add --all .
git commit -m "Commit message"
git push
```

## Supplementary

Additional to the configs are the actual tools themselves, dependant on what configs you copy across you will also need to install the respective tool.

Please refer to each individual package for install instructions, it is not worth detailing them here especially if they become outdated.

### ZSH

- [fzf](https://github.com/junegunn/fzf)
- [Zoxide](https://github.com/ajeetdsouza/zoxide)
- [Sheldon](https://github.com/rossmacarthur/sheldon)
- [Starship](https://starship.rs/)

### Helix

- [Helix](https://helix-editor.com/)

## Reasoning

Below you can find my (personal) justifications for each tool configured here.

This is highly subjective and there is no _perfect tool_, these are just tools that most easily fit into my own workflow.

### Helix

[Helix](https://helix-editor.com/) is a [Kakoune](https://kakoune.org/) inspired text editor. It is a modal editor similar to Vim but has some key differences.

Most importantly [Helix](https://helix-editor.com/) aims to ship a viable default experience, that is to say it comes out of the box with things like a fuzzy finder and LSP support.

[Helix](https://helix-editor.com/) allows me to be productive fast and has effectively eliminated time spent maintaining plugins between updates.

### ZSH

My primary reason for using ZSH over something like [fish](https://fishshell.com/) is that ZSH is BASH compatiable, meaning it _just works_ with a lot of tools I already use.

If I was going to learn a new shell and commit to something that was not bash compatiable, I would most likely pick up [Nushell](https://www.nushell.sh/) which also provides an _escape hatch_ to fallback to BASH commands when needed.
 
I also use the [Sheldon](https://sheldon.cli.rs/) plugin manager. The main reason I prefer this tool is that it keeps my plugin config _outside_ of my `.zshrc`, this creates a clear separation between what is my config and what is plugins.

Finally I use [Starship prompt](https://starship.rs/). Again what I like about this tool is it keeps my prompt config outside of my `.zshrc`, additionally it supports a number of different shells meaning if I ever switch shells I can likely bring this with me.

### Kitty

I use [Kitty](https://sw.kovidgoyal.net/kitty/) on Mac and Linux and [Windows Terminal](https://github.com/microsoft/terminal) on Windows (with [WSL](https://learn.microsoft.com/en-us/windows/wsl/about)).

I **do not** use [tmux](https://github.com/tmux/tmux/wiki) nor do I intend to. Terminal multiplexers come with a [plethora of issues](https://github.com/kovidgoyal/kitty/issues/391#issuecomment-638320745) that I don't need to buy into. Don't get me wrong there are absolutely uses cases for requiring a terminal multiplexer, but tabs and splits are not it. It's 2022 please let your terminal be your terminal.

