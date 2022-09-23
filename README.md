# Dotfiles

This repo is largely modelled off [this guide](https://germano.dev/dotfiles/).

Criteria of this repo:

- A single repo to manage all dotfiles
- Ability to have multiple configs for all tools, i.e a work `.gitconfig` and a personal `.gitconfig`
- Ability to archive configs for tools I no longer use
- Backed by `git`
- Introduce as few tools/abstractions as possible
- Ability to show a `README.md` on GitHub without needing to have it sit in my `~/`

### Footguns

Even though each config is a branch on the remote (where you are now on GitHub). **Locally each branch will be initialized as it's own repo**.

### Create new config

**Create new _local_ repo:**

```sh
vcsh init config_name
git remote add origin git@github.com:chopfitzroy/dotfiles-experiment.git
git pull
git checkout --orphan config_name
git rm -rf .
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
git status # If you want to config your ignore paths are working as expected
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
order = 10
checkout =
  vcsh clone -b config_name git@github.com:chopfitzroy/dotfiles-experiment.git config_name
```

Once that is done it can be pushed to the remote:

```sh
vcsh enter myrepos
git add --all .
git commit -m "Commit message"
git push
```

