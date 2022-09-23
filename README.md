# Dotfiles

This repo is largely modelled off [this guide](https://germano.dev/dotfiles/).

Criteria of this repo:

- A single repo to manage all dotfiles
- Ability to have multiple configs for all tools, i.e a work `.gitconfig` and a personal `.gitconfig`
- Ability to archive configs for tools I no longer use
- Backed by `git`
- Introduce as few tools/abstractions as possible
- Ability to show a `README.md` on GitHub without needing to have it sit in my `~/`

### Create new config

**Checkout new branch (from `main`):**

```sh
vcsh enter dotfiles
git checkout main
git checkout --orphan config_name
git rm -f README.md
```

**Update ignored files:**

```sh
hx ~/.gitignore.d/dotfiles
```

- Remove references to `README.md`
- Add `!` paths for files you want to track

**Add `myrepos` config:**

TODO...

**Commit new files:**

```sh
vcsh enter dotfiles
git add --all .
git commit -m "Commit message"
git push --set-upstream origin config_name 
```

