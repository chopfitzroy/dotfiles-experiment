# ZSH Profile Configuration
# 
# This file runs for LOGIN shells ONLY (not for every new shell instance)
# 
# EXECUTION ORDER for login shells:
# 1. /etc/zshenv       - System-wide environment (all shells)
# 2. ~/.zshenv         - User environment variables (all shells) 
# 3. /etc/zprofile     - System-wide login setup
# 4. ~/.zprofile       - User login setup (THIS FILE)
# 5. /etc/zshrc        - System-wide interactive setup
# 6. ~/.zshrc          - User interactive setup
# 7. /etc/zlogin       - System-wide login finalization
# 8. ~/.zlogin         - User login finalization
#
# CRITICAL macOS BEHAVIOR:
# /etc/zprofile runs `/usr/libexec/path_helper -s` which:
# - Reads /etc/paths and /etc/paths.d/* 
# - REORDERS your PATH to put system paths (/usr/bin, /bin, etc.) first
# - This happens AFTER ~/.zshenv runs, potentially breaking custom PATH setup
# - Any PATH modifications in ~/.zshenv may be overridden by path_helper
#
# WORKAROUND OPTIONS:
# 1. Set PATH in ~/.zprofile (after path_helper runs) - this file
# 2. Set PATH in ~/.zshrc (interactive shells only)
# 3. Re-source ~/.zshenv in ~/.zprofile to restore custom PATH
#
# TYPICAL ~/.zprofile CONTENTS:
# 
# 1. LOGIN-ONLY OPERATIONS:
#    - Things that should run once per login session, not every shell
#    - Expensive operations (key generation, system checks, etc.)
#    - Session initialization that doesn't need to repeat
#
# 2. PATH CORRECTIONS:
#    - Fix PATH after system path_helper runs
#    - Ensure custom tools take precedence over system tools
#    - Language version managers that modify PATH
#
# 3. LOGIN NOTIFICATIONS:
#    - Welcome messages, system status, reminders
#    - Check for updates, security alerts
#    - Display system information (disk space, etc.)
#
# 4. SESSION SETUP:
#    - Start background services for the session
#    - Initialize authentication agents (SSH, GPG)
#    - Set up terminal multiplexer sessions
#
# 5. ENVIRONMENT CORRECTIONS:
#    - Fix environment variables modified by system login scripts
#    - Override system defaults that can't be set in ~/.zshenv
#    - Apply user-specific locale/language settings
#
# 6. INTERACTIVE TTY OPERATIONS:
#    - Operations that require terminal interaction
#    - Password prompts, key unlocking
#    - User confirmation dialogs
#
# EXAMPLES of what could be moved here from ~/.zshrc:
# - Homebrew environment setup (if it's slow)
# - ASDF initialization (if it affects PATH significantly)  
# - SSH agent startup
# - Welcome messages or system status
# - One-time session setup for development tools
#
# NOTE: Non-login shells (scripts, subshells, etc.) will NOT run this file
# Only put things here that are specifically for interactive login sessions

# Currently empty - add login-specific setup as needed