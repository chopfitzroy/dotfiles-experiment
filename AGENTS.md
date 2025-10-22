# Repository Guidelines

## Project Structure & Module Organization
The repository is an Ansible playbook for installing and syncing dotfiles. `main.yml` drives the full setup and loads roles in `roles/`. Each role isolates one tool or config (e.g. `roles/helix`, `roles/config-starship`) with tasks, templates, and files local to that tool. Machine specific variables live in `vars/system.yml` (ignored from git). Supporting docs such as `APACHE.md` capture service-specific notes; keep additional references adjacent to their role for quick discovery.

## Build, Test, and Development Commands
Use Ansible to apply or inspect changes:
```sh
ansible-playbook main.yml --ask-become-pass          # full install
ansible-playbook main.yml --tags "config,zsh" --ask-become-pass  # targeted run
ansible-playbook main.yml --check --diff --ask-become-pass       # dry-run validation
ansible-playbook main.yml --list-tags               # discover available tags
```
Run commands from repo root with a populated `vars/system.yml`.

## Coding Style & Naming Conventions
Author YAML with two-space indentation, lowercase keys, and `snake_case` variable names. Task names should be imperative ("Install fd") and tag sets should match the directory name (`config-starship`). Prefer Ansible built-ins over raw shell where possible, and keep idempotency in mind—conditional checks (`creates`, `when`) belong inside the task.

## Testing Guidelines
Before opening a PR, run the playbook with `--check` and `--diff` to confirm idempotent behaviour and review intended mutations. For new roles, execute them individually with `--tags "<role>"` to keep verification fast. Capture regressions by re-running the full play after major refactors. If a role manipulates services such as Apache or MariaDB, include a manual validation note in its README.

## Commit & Pull Request Guidelines
Follow concise, imperative commit messages (e.g. “Add composer task”). Group related changes per commit and align with the tags they touch. PRs should summarise the scenario, list the tags or hosts exercised, and link any tracking issue. Attach relevant Ansible output or screenshots of affected tools when behaviour changes. Re-run the dry-run commands above before requesting review.

## Security & Configuration Tips
Never commit personal secrets or tokens; keep `vars/system.yml` local or encrypt sensitive overrides with `ansible-vault`. When scripting credentials, prefer environment variables and ensure resulting files respect restrictive permissions (`mode: "0600"`). Document required secrets in role READMEs without revealing actual values.
