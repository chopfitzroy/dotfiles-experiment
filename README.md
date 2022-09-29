# Dotfiles 💻

This repo is largely modelled off [this guide](https://germano.dev/dotfiles/).

Criteria of this repo:

- Backed by `git`
- A single repo to manage all dotfiles
- Introduce as few tools/abstractions as possible
- Ability to archive configs for tools I no longer use
- Ability to show a `README.md` on GitHub without needing to have it sit in my `~/`
- Ability to have multiple configs for all tools, i.e a work `.gitconfig` and a personal `.gitconfig`

## Show me the code 🥵

View [all branches](https://github.com/chopfitzroy/dotfiles-experiment/branches) for each config.

## Usage 🔮

Common scenarios and how to handle them are listed below. You will need to substitute in your own repository location where appropiate.

Rember even though each config is a branch on the remote. **Locally each branch will be initialized as it's own repo**.

### New host 👽

Install both [vcsh](https://github.com/RichiH/vcsh) and [myrepos](https://myrepos.branchable.com/).

**Mac:**

```sh
brew install vcsh myrepos
```

**Ubuntu:**

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

### Updating an existing tool/config 💉

```sh
vcsh enter config_name
git status # If you want to confirm changes
git add --all .
git commit -m "Commit message"
git push
```

### Setting up a new tool/config ✨

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
status = vcsh config_name status
pull = vcsh config_name pull
```

Once that is done it can be pushed to the remote:

```sh
vcsh enter myrepos
git add --all .
git commit -m "Commit message"
git push
```

## Supplementary 🎯

Some configs require additional packages/software to work, below you can find a list organised by config that details additional requirements.

### ZSH 🐚

- [fzf](https://github.com/junegunn/fzf)
- [Zoxide](https://github.com/ajeetdsouza/zoxide)
- [Sheldon](https://github.com/rossmacarthur/sheldon)
- [Starship](https://starship.rs/)

## Reasoning 🤔

Below you can find my (personal) reasoning for each config.

This is highly subjective and there is no _perfect config_, these are just what work for me.

### Helix 🧬

[Helix](https://helix-editor.com/) is a [Kakoune](https://kakoune.org/) inspired text editor. It is a modal editor similar to Vim but has some key differences.

Essentially Helix allows me to be productive fast and completely removes the need to manage plugins.

### Zsh 🐚

My primary reason for using Zsh over something like [Fish](https://fishshell.com/) is that Zsh is Bash compatiable, meaning it _just works_ with a lot of tools I already use.

If I was going to learn a new shell and commit to something that was not Bash compatiable, I would most likely pick up [Nushell](https://www.nushell.sh/) which also provides an _escape hatch_ to fallback to Bash commands when needed.
 
I use the [Sheldon](https://sheldon.cli.rs/) plugin manager because it keeps my plugin config _outside_ of my `.zshrc`, this creates a clear separation between what is my config and what is plugins.

I use [Starship prompt](https://starship.rs/) because it keeps my prompt config outside of my `.zshrc`, additionally it supports a number of different shells meaning if I ever switch shells I can likely bring this with me.

### Kitty 🧶

I use [Kitty](https://sw.kovidgoyal.net/kitty/) on Mac and Linux and [Windows Terminal](https://github.com/microsoft/terminal) on Windows (with [WSL](https://learn.microsoft.com/en-us/windows/wsl/about)).

I **do not** use [tmux](https://github.com/tmux/tmux/wiki) nor do I intend to. Terminal multiplexers come with a [plethora of issues](https://github.com/kovidgoyal/kitty/issues/391#issuecomment-638320745) that I don't need to buy into. Don't get me wrong there are absolutely uses cases for requiring a terminal multiplexer, but tabs and splits are not it. It's 2022 please let your terminal be your terminal.

## Themeing 🎨

Helix includes a number of great themes out of the box, use `:theme` to find the theme that best suits you.

You may notice that I include a custom `gruvbox_dark` theme with the Helix config, this is to address [this issue](https://github.com/morhetz/gruvbox/issues/15) if you do not mind inverted colors feel free to remove this in favour of the Helix default `gruvbox`.

If you are like me and want your terminal color scheme to match your editor color scheme I can recommend the [gruvbox_dark](https://github.com/dexpota/kitty-themes/blob/master/themes/gruvbox_dark.conf) theme from [kitty-themes](https://github.com/dexpota/kitty-themes) for Kitty.

And if you are using Windows Terminal you will need to follow the below steps to add the Gruvbox Dark theme:

- Open Windows Terminal
- Open "Settings" (Ctrl+,)
- Click Open JSON file (bottom left)
- Search for `"schemes"``
- Copy and paste the below snippet into the array
- Navigate to the relevant profile in Windows Terminal
- Under "Additional Settings" select "Appearance"
- Under "Color Scheme" select "Gruvbox Dark"

<details>
  <summary>Click to expand snippet</summary>
  
  ```json
  {
    "background" : "#282828",
    "black" : "#282828",
    "blue" : "#458588",
    "brightBlack" : "#928374",
    "brightBlue" : "#83A598",
    "brightCyan" : "#8EC07C",
    "brightGreen" : "#B8BB26",
    "brightPurple" : "#D3869B",
    "brightRed" : "#FB4934",
    "brightWhite" : "#EBDBB2",
    "brightYellow" : "#FABD2F",
    "cyan" : "#689D6A",
    "foreground" : "#EBDBB2",
    "green" : "#98971A",
    "name" : "Gruvbox Dark",
    "purple" : "#B16286",
    "red" : "#CC241D",
    "white" : "#A89984",
    "yellow" : "#D79921"
  }
  ```
</details>