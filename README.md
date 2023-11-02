# Dotfiles 💻

Goals of this repo:

- Single repo.
- Backed by `git`.
- Powered entirely by Ansible with no other tooling.
- Does not need to be cloned to a specific location to work.

## Automatic Setup with Ansible 🍃

The Ansible script currently supports macOS using [Homebrew](https://brew.sh/) and openSUSE (Tumbleweed).

### Cloning ⚗

Start by [forking](https://github.com/chopfitzroy/dotfiles-experiment/fork) this repository to your own GitHub account.

Clone the repository using the following command **(substituting your own values)**:

```sh
git clone git@github.com:{{ user_name }}/{{ repository }}.git
```

### Create variables 🦈

You will need to create a variables file that defines a few variables related to your machine.

We ignore this file by default because it will change from machine to machine, if you only have one machine you work on feel free to commit this file.

To create this file run:

```sh
touch vars/system.yml
```

Now paste **(and update)** the below snippets, we maintain both macOS and openSUSE examples:

**macOS:**

```yml
# Git
git_user: user@email.com

# System directories
local_bin: "{{ ansible_user_dir }}/.local/bin"
vendor_bin: /opt/homebrew/bin # // Use '/usr/local/bin' for older (non m1) devices
config_dir: "{{ ansible_user_dir }}/.config"
local_share: "{{ ansible_user_dir }}/.local/share"
 
# Tools & applications
asdf_home: "{{ ansible_user_dir}}/.asdf"
asdf_bin: "{{ asdf_home }}/bin"
wezterm_dir: "{{ config_dir }}/wezterm"
zsh_completions: "{{ ansible_user_dir }}/.zsh_completions"
```

**openSUSE:**

```yml
# Git
git_user: user@email.com

# System directories
local_bin: "{{ ansible_user_dir }}/.local/bin"
vendor_bin: /usr/bin
config_dir: "{{ ansible_user_dir }}/.config"
local_share: "{{ ansible_user_dir }}/.local/share"

# Tools & applications
asdf_home: "{{ ansible_user_dir}}/.asdf"
asdf_bin: "{{ asdf_home }}/bin"
# Use "/mnt/c/Users/{{ windows_user_name }}/.config/wezterm" when using WSL on Windows (substitute your windows username)
wezterm_dir: "{{ config_dir }}/wezterm"  
zsh_completions: "{{ ansible_user_dir }}/.zsh_completions"
```

### Setup for openSUSE 🦎

Install `ansible` with the following command:

```sh
sudo zypper install ansible
```

### Setup for macOS 🍏

Install `ansible` with the following command:

```sh
brew install ansible
```

### Full install ⚡

Run the **entire** playbook with the following command **in the project directory**:

```sh
ansible-playbook main.yml --ask-become-pass
```

### Partial installs ⛅

In the event that you to perform a partial installation you can mask use of [Ansible tags](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_tags.html). An example of what this might look like:

```sh
ansible-playbook main.yml --tags "asdf,node,deno" --ask-become-pass
```

Please refer to `main.yml` to get an understanding of which tags are available.

## Synchronising changes 🔁

The Ansible scripts have been designed to be deterministic meaning you can run them an infinite number of times and they should always work.

Synchronising latest changes can always be done using the following command:

```sh
ansible-playbook main.yml --ask-become-pass
```

Alternatively if you just have config changes a faster option is:

```sh
ansible-playbook main.yml --tags "rsync,config" --ask-become-pass
```

Or use `config-{{ name }}` to update only one config:

```sh
ansible-playbook main.yml --tags "rsync,config-helix" --ask-become-pass
```

**NOTE:** `rsync` installs a required package for Ansible synchronize, if it is already installed you can omit this tag.

## Language support 💬

If running the Ansible scripts the following software will be installed:

- [Go](https://go.dev/) and it's LSP [`gopls`](https://pkg.go.dev/golang.org/x/tools/gopls)
- [Deno](https://deno.land/).
- [Node](https://nodejs.org/en/) and it's LSP [`typescript-language-server`](https://github.com/typescript-language-server/typescript-language-server)
- [Ruby](https://www.ruby-lang.org/en/) and it's LSP [`solargraph`](https://solargraph.org/)
- [Rust](https://www.rust-lang.org/) and it's LSP [`rust-analyzer`](https://rust-analyzer.github.io/) via [`rustup`](https://rustup.rs/)
- [Clojure](https://clojure.org/) (via [Leiningen](https://leiningen.org/)) and it's LSP [`clojure-lsp`](https://clojure-lsp.io/).

Finally we utilize [asdf](https://asdf-vm.com/) for languages that do not have an _official_ way to manage versions.

### Known issues 💣

- `asdf` uses [ruby-build](https://github.com/rbenv/ruby-build) under the hood, this has strict [build requirements](https://github.com/rbenv/ruby-build/wiki) which differ from system to system, so if you see any errors I recommend starting here.
- `docker` [cannot be installed on WSL](https://www.reddit.com/r/ansible/comments/s4u9gj/comment/hsu0rdy/) and instead you must use [Docker Desktop](https://docs.docker.com/desktop/wsl/) like you would on macOS.
 
## Reasoning 🔮

Below are some _brief_ reasonings behind each software I have chosen to use.

In terms of _managing dotfiles_ I have written about the topic extensively in my [knowledgebase](https://github.com/chopfitzroy/kb/blob/master/Dotfiles.md).

### Tools 👾

Any tool that requires significant configuration has been documented seperately, below are links to each document:

- [Zsh](/roles/config-zsh/README.md)
- [Helix](/roles/config-helix/README.md)
- [Neovim](/roles/config-neovim/README.md)
- [WezTerm](/roles/config-wezterm/README.md)

### Command line utilities ⚡

There are a large number of command line utilities being developed by the open source community. Below is a list of all of the utilities included in this repo.

**Development:**

- [bat](https://github.com/sharkdp/bat)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [the-way](https://github.com/out-of-cheese-error/the-way)

**Navigation:**

- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [exa](https://the.exa.website)

**Shell:**

- [Sheldon](https://github.com/rossmacarthur/sheldon)
- [Starship](https://starship.rs)

**Misc:**

- [Silicon](https://github.com/Aloxaf/silicon)
- [Tealdeer](https://dbrgn.github.io/tealdeer)
- [base16-builder-go](https://github.com/tinted-theming/base16-builder-go)

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

If you are like me and you want all your application to use the same color scheme there are a couple of limitations you need to be aware of.

Essentially there are 5 applications you need to theme `fzf`, `bat`, `nap`, Helix, and WezTerm. These all have their own theme engines so you are effectively limited to themes **supported by all 6 applications**.

Here are some tips for finding themes for each application:

- [fzf](https://github.com/junegunn/fzf) is the hardest by far, some themes include `fzf` snippets in their docs if your lucky, I have however had a lot of success with [base16-fzf](https://github.com/tinted-theming/base16-fzf) which includes a lot of modern themes.
- [bat](https://github.com/sharkdp/bat) comes with a number of themes out of the box use `bat --list-themes` to view installed themes. Fourtunately `bat` use `.tmTheme` themes meaning any [Sublime Text](https://www.sublimetext.com/) theme will work with `bat`, the Ansible script will install a few extra `bat` themes for you.
- [the-way](https://github.com/out-of-cheese-error/the-way) uses the same themes as `bat` so whatever you use here you can use for `the-way` as well.
- [WezTerm](https://wezfurlong.org/wezterm/) ships with over 700 themes and is usually easy to match up with everything else, browse the [online directory](https://wezfurlong.org/wezterm/colorschemes/index.html) to find the theme for you.

## Future Improvements 🎉

Below are a list of future improvements I would like to make to this repository.

- Setup [`vadimcn/vscode-lldb`](https://github.com/vadimcn/vscode-lldb) to work with Rust LSP. Pending this [issue](https://github.com/helix-editor/helix/issues/4231).
- Setup [`teaxyz/cli`](https://github.com/teaxyz/cli) once it is a bit more mature.
- Setup [`zyedidia/eget`](https://github.com/zyedidia/eget) for GitHub downloads.
- Setup [`valentjn/ltex-ls`](https://github.com/valentjn/ltex-ls) for grammer checks. [More information](https://microblog.desipenguin.com/post/grammar-check-with-helix-editor/).

## Gotchas ⚠

Below are some common gotchas and how to fix them.

### GitHub API limit 💥

It is possible to hit the upper limit of GitHub API interactions if the Ansible playbook is being run repeatedly.

You can get around this by running the following command **substituting in your own token**:

```bash
ansible-playbook main.yml --ask-become-pass --extra-vars="github_token={{ token_value }}"
```

### asdf reshim 🗡

When installing global packages (i.e with `npm`) these packages will not be [reshimmed](https://asdf-vm.com/manage/core.html#reshim) automatically.

To reshim all packages run:

```bash
asdf reshim
```

## Experiments 🧪

Below are some of the experiments that I have tried over the years either didn't make it into my dotfiles or were removed.

### Emacs

I tried to love [Emacs](https://www.gnu.org/software/emacs/) while becomming aquainted with [Clojure](https://clojure.org/) but try as I might I couldn't make it _stick_.

I have written about my experience with editors _ad nauseam_ in my [knowledgebase](https://github.com/chopfitzroy/kb).

### Terminal docs 🧾

I really wanted a terminal based workflow for quickly looking up language documentation when needed.

I tried both [`cht.sh`](https://github.com/chubin/cheat.sh) and [`dasht`](https://github.com/sunaku/dasht) but neither really stuck in the way I wanted.

For now I have setup a [custom search engine](https://zapier.com/blog/add-search-engine-to-chrome/) for [devdocs.io](https://devdocs.io/) which is still relatively fast and has the advantage of correctly rendering the MDN examples.

If you want to do this yourself the URL you will need is below, note `%s` refers to the search term placeholder.

```
https://devdocs.io/#q=%s
```

In the future I would like to explore doing something like [this](https://eseth.org/2020/devdocs-cli.html) for a more terminal centric workflow.

### Markdown knowledge base 🧠

I originally tried to create my own markdown knowledge base rendered in the terminal via [Glow](https://github.com/charmbracelet/glow).

Unfortunately this didn't quite have the flow I wanted.

I had varying success with [Silver Bullet](https://silverbullet.md/) but it encourages editing via the browser and I would much prefer to stay in my editor.

Now I am using Helix with [Marksman](https://github.com/artempyanykh/marksman) and this is working well.

If you are interested in building your own knowledge base here is [mine](https://github.com/chopfitzroy/kb).

## References 📚

The below resources were quintessential in creating this repository.

- [`gf3/dotfiles`](https://github.com/gf3/dotfiles)
- [`sloria/dotfiles`](https://github.com/sloria/dotfiles)
- [`ThePrimeagen/ansible`](https://github.com/ThePrimeagen/ansible)
- [Managing Your Dotfiles](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)
- [Conquer your dotfiles with VCSH and MR](https://germano.dev/dotfiles/)
- [file-hierarchy — File system hierarchy overview](https://www.freedesktop.org/software/systemd/man/file-hierarchy.html)
- [Ansible for dotfiles: the introduction I wish I've had](https://phelipetls.github.io/posts/introduction-to-ansible/)
- [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
