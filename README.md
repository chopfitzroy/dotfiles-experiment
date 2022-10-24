# Dotfiles 💻

Goals of this repo:

- Single repo.
- Backed by `git`.
- Does not need to be cloned to a specific location to work.
- Clear way to view the commit history for any given _category_ of tools.
- Introduce as few tools/abstractions as possible (we do this by using [vcsh](https://github.com/RichiH/vcsh)).
- Ability to **optionally** bootstrap system with Ansible but also use individual configs without requiring Ansible.

## Show me the code 🥵

View [all branches](https://github.com/chopfitzroy/dotfiles-experiment/branches) for each config.

## Automatic Setup with Ansible 🍃

The Ansible script currently supports macOS using [Homebrew](https://brew.sh/) and openSUSE (Tumbleweed).

Note, whether you are doing an automatic setup with Ansible or a manual setup it pays to first, [fork](https://github.com/chopfitzroy/dotfiles-experiment/fork) this repository to your own GitHub account.

Clone the repository using the following command **substituting in your new repository address**:

```sh
git clone git@github.com:user/repo.git
```

Update the `git_repo` value in `vars/generic.yml` to reflect your new repository address.

### Using openSUSE 🦎

Install `ansible` with the following command:

```sh
sudo zypper install ansible
```

Then run the playbook with the following command **in the project directory**:

```sh
ansible-playbook main.yml --ask-become-pass
```

### Using mac 🍏

Install `ansible` with the following command:

```sh
brew install ansible
```

Then run the playbook with the following command **in the project directory**:

```sh
ansible-playbook main.yml --ask-become-pass
```

## Synchronising changes 🔁

The Ansible scripts have been designed to be deterministic meaning you can run them an infinite number of times and they should always work.

Synchronising latest changes can always be done using the following command:

```sh
ansible-playbook main.yml --ask-become-pass
```

If you just want to update your categories to the latest version and don't care about updating your software a quick update can be done with:

```sh
vcsh pull
```

Note, there are some instances like `sheldon` on openSUSE installs where Ansible will not update `sheldon` if it already exists. There are some solutions to this but ideally we are waiting until `sheldon` is added to `zypper`.

## Manual Setup 🐢

There might be times you don't want to run the Ansible scripts but would still like to make use of some of the configuration files.

Note, whether you are doing an automatic setup with Ansible or a manual setup it pays to first, [fork](https://github.com/chopfitzroy/dotfiles-experiment/fork) this repository to your own GitHub account.

Below are instructions on how to manually clone down each category, note you will need [vcsh](https://github.com/RichiH/vcsh) installed to do this.

Clone the category you are interested in using the following command **substituting in your new repository address**.

```sh
vcsh clone -b category_name git@github.com:user/repo.git category_name
```

Where `category_name` is one of `shell`, `editor`, or `terminal`.

It is important to note this will not install any of the software these categories require, you will need to do that manually or use the Ansible scripts.

If you would like to commit your changes you will need to use [vcsh](https://github.com/RichiH/vcsh) to do this.

## Setting up a new category ✨

Ideally this shouldn't need to be done too often given most software should fit within the existing categories.

That being said if you do need to create a new category the below commands should do the trick. 

**Create new _local_ repo:**

```sh
vcsh init category_name
vcsh enter category_name
git remote add origin git@github.com:user/repo.git
git fetch
git checkout --orphan category_name
```

**Add ignored files:**

```sh
hx ~/.gitignore.d/category_name
```

- Always start with `*`.
- Add `!` paths for files you want to track.

**Commit new files:**

```sh
vcsh enter category_name
git add --all .
git status # If you want to confirm your ignore paths are working as expected
git commit -m "Commit message"
git push --set-upstream origin category_name
```

## What's in the box 📦

If running the Ansible scripts the following software will be installed:

- [Go](https://go.dev/) and it's LSP [`gopls`](https://pkg.go.dev/golang.org/x/tools/gopls)
- [Rust](https://www.rust-lang.org/) and it's LSP [`rust-analyzer`](https://rust-analyzer.github.io/) via [`rustup`](https://rustup.rs/)
- [Node](https://nodejs.org/en/) and it's LSP [`typescript-language-server`](ihttps://github.com/typescript-language-server/typescript-language-server) via [Volta](https://volta.sh/)

Additionally there are some really nice Zsh functions included `~/.zsh_functions`, in particular:

- `qsu` (_quick search utility_) which uses [cht.sh](http://cht.sh/) under the hood.
- `qsl` (_quick search language_) which uses [cht.sh](http://cht.sh/) under the hood.

## Reasoning 🔮

Below are some _breif_ reasonings behind each software I have chosen to use.

### Version control 🚦

You might be wondering why these dotfiles buy so heavily into [vcsh](https://github.com/RichiH/vcsh) over something like [stow](https://www.gnu.org/software/stow/).

Honestly it comes down to personal preference I have had some bad experiences with symlinks in the past so I much prefer a more `git` based solution over a symlink manager.

If I was to buy into a more symlink driven setup I would absolutely use [stow](https://www.gnu.org/software/stow/). I have used it in the past and it is very good at what it does.

If you are un-happy with [vcsh](https://github.com/RichiH/vcsh) I strongly recommend looking into some other dotfile solutions, a few I can recommend are:

- [stow](https://www.gnu.org/software/stow/)
- [yadm](https://yadm.io/)
- [dotbot](https://github.com/anishathalye/dotbot)

Note, if you are interested in how [vcsh](https://github.com/RichiH/vcsh) works under the hood I highly recommend reading [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).

### Command line utilities ⚡

There are a large number of command line utilities being developed by the open source community. Below is a list of all of the utilities included in this repo.

- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [exa](https://the.exa.website/)
- [bat](https://github.com/sharkdp/bat)
- [Zoxide](https://github.com/ajeetdsouza/zoxide)
- [Sheldon](https://github.com/rossmacarthur/sheldon)
- [Starship](https://starship.rs/)

### Editor 🧬

[Helix](https://helix-editor.com/) is a [Kakoune](https://kakoune.org/) inspired text editor. It is a modal editor similar to Vim but has some key differences.

Helix completely removes the need to manage editor plugins, this provides long term productivity payoffs and removes a lot of the headaches associated with dotfile management.

If you are a die hard [Neovim](https://neovim.io/) user but like the sound of not needing to manage your plugins I strongly recommend [NvChad](https://nvchad.com/).

### Zsh 🐚

The primary reason for using Zsh over something like [Fish](https://fishshell.com/) is that Zsh is Bash compatiable, meaning it _just works_ with a lot of tools I already use.
 
[Sheldon](https://sheldon.cli.rs/) plugin manager keeps the plugin config _outside_ of the `.zshrc`, this creates a clear separation between what is my config and what is plugins.

[Starship](https://starship.rs/) keeps the prompt config outside of the `.zshrc`, additionally it supports a number of different shells meaning if I ever switch shells I can likely bring this with me.

### Terminal 🧶

[WezTerm](https://wezfurlong.org/wezterm/) has a number of features that make it particularily appealing, some of the primary reasons are:

- It works well with WSL 2.
- It works on macOS, Linux and Windows.
- It has fallback font support which allows me to use any font I like with [nerd fonts symbols](https://sw.kovidgoyal.net/kitty/faq/#kitty-is-not-able-to-use-my-favorite-font).
- It has a built in multiplexer which prevents some [historic issues](https://github.com/kovidgoyal/kitty/issues/391#issuecomment-638320745) associated with using multiplexers.

## Theming 🌈

Theming is hugely personal but below are some notes to get you started.

### Fonts 🆎

Below are a number of fonts I have used (or wanted to use) over the years, I have split them into _premium_ meaning there is a cost associated with them and _free_ meaning they can be used for personal use (or in some cases commercial use) at no cost.

**Premium:**

- [Gintronic](https://markfromberg.com/projects/gintronic/)
- [MonoLisa](https://www.monolisa.dev/)
- [Dank Mono](https://philpl.gumroad.com/l/dank-mono)
- [Operator Mono](https://www.typography.com/blog/introducing-operator)
- [Berkeley Mono Typeface](https://berkeleygraphics.com/typefaces/berkeley-mono/)

I use [Berkeley Mono Typeface](https://berkeleygraphics.com/typefaces/berkeley-mono/) exclusively these days and absolutely love it. Yes I paid the $75.00 and it was worth every penny.

**Free:**

- [Hack](https://sourcefoundry.org/hack/)
- [Input Mono](https://input.djr.com/)
- [Cascadia Code](https://learn.microsoft.com/en-us/windows/terminal/cascadia-code)
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
- [Source Code Pro](https://fonts.adobe.com/fonts/source-code-pro)

### Color scheme 🎨

Helix includes a number of great themes out of the box, use `:theme` to find the theme that best suits you.

You may notice that I include a custom `gruvbox_dark` theme with the Helix config, this is to address [this issue](https://github.com/morhetz/gruvbox/issues/15).

## Gotcha's 😤

- The [Volta](https://volta.sh/) install script can sometimes modify the `~/.zshrc` to add `VOLTA_HOME` environment variable. This can be safely removed as it is defined in the `~/.zshenv`.

## Future Improvements 🎉

- Setup [`gitui`](https://github.com/extrawurst/gitui) for heavy git operations.
- Setup [`artempyanykh/marksman`](https://github.com/artempyanykh/marksman) for working with markdown files. 
- Setup [`vadimcn/vscode-lldb`](https://github.com/vadimcn/vscode-lldb) to work with Rust LSP. Pending this [issue](https://github.com/helix-editor/helix/issues/4231).

## References 📚

- [`gf3/dotfiles`](https://github.com/gf3/dotfiles)
- [`sloria/dotfiles`](https://github.com/sloria/dotfiles)
- [`ThePrimeagen/ansible`](https://github.com/ThePrimeagen/ansible)
- [Managing Your Dotfiles](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)
- [Conquer your dotfiles with VCSH and MR](https://germano.dev/dotfiles/)
- [file-hierarchy — File system hierarchy overview](https://www.freedesktop.org/software/systemd/man/file-hierarchy.html)
- [Ansible for dotfiles: the introduction I wish I've had](https://phelipetls.github.io/posts/introduction-to-ansible/)
- [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
