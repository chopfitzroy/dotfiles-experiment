# Helix 🧬

[Helix](https://helix-editor.com/) is a [Kakoune](https://kakoune.org/) inspired text editor. It is a modal editor similar to Vim but has some key differences.

Helix completely removes the need to manage editor plugins, this provides long term productivity payoffs and removes a lot of the headaches associated with dotfile management.

If you want to learn more about Helix I recommend this [overview](https://www.youtube.com/watch?v=xHebvTGOdH8) and if you want something more hands on I highly recommend this [channel](https://www.youtube.com/@LukePighetti/featured).

Fortunately Helix does not require any plugins and is effectively plug and play.

### LSP 🐍

It is worth noting that Helix requires the installation of certain LSP on your system for various languages.

Any language installed as part of these dotfiles should include it's respective LSP.

If in doubt run `hx --health` to check.

### Why Neovim? 🤔

You might be wondering why we install Helix **and** Neovim.

It honestly comes down to support for editing [Lisp](https://en.wikipedia.org/wiki/Lisp_(programming_language)) languages.

Helix has everything I need in an editor except the ability to integrate with a REPL.

Until Helix has [plugin](https://github.com/helix-editor/helix/discussions/3806) support it is unlikely that Neovim will be dropped.
