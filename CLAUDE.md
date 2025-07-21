# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
This is an Ansible-based dotfiles management system for configuring development environments across macOS and openSUSE Linux.

## Commands
- Run full playbook: `ansible-playbook main.yml --ask-become-pass`
- Run specific roles: `ansible-playbook main.yml --tags "tag1,tag2" --ask-become-pass`
- Update configurations: `ansible-playbook main.yml --tags "rsync,config" --ask-become-pass`
- Lint: `ansible-lint main.yml roles/*/tasks/*.yml`

## Code Style Guidelines
- Follow standard Ansible YAML conventions with 2-space indentation
- Organize roles with consistent structure: tasks/main.yml as entry point with OS-specific tasks in separate files
- Use descriptive variable names in snake_case
- Include comments for complex tasks
- Keep tasks focused on a single responsibility
- Organize larger playbooks with tags for selective execution
- Use OS-specific conditionals consistently (`when: ansible_os_family == 'Darwin'` or `when: ansible_os_family == 'Suse'`)