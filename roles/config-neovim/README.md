# Neovim 💎

My [Neovim](https://neovim.io/) config aimed primarily at [Lisp](https://en.wikipedia.org/wiki/Lisp_(programming_language)) editing.

![image](https://user-images.githubusercontent.com/2978850/231408234-b0c39860-9148-4974-a4b3-fb68c3024752.png)

### Fennel 🪴

This project is configured using [Fennel](https://fennel-lang.org/) a Lisp dialect that compiles to [Lua](https://www.lua.org/).

### Aniseed 🍭

[`Olical/aniseed`](https://github.com/Olical/aniseed) can be considered the _glue_ between Neovim and Fennel.

When starting it is not always clear when we are using something from Aniseed or Fennel itself, `defn` and `defn-` are good examples of this. At first glance you may think these are part of the Fennel syntax but they are instead macros defined as part of Fennel.

Throughout the various `.fnl` files I have tried my best to comment where we are using features provided by Aniseed.

If you are interested in this split and want to understand more I highly recommend [this talk](https://www.youtube.com/watch?v=RU28xy9JXxs).

### Lazy 🦑

[`folke/lazy.nvim`](https://github.com/folke/lazy.nvim) (not [LazyVim](https://www.lazyvim.org/)) allows us to lazy load plugins and improve Neovim startup time.

There are other plugin managers that allow this but Lazy has gone to great pains to create a pleasant developer experience in terms of how you configure plugins.

Before getting started with Lazy I highly recommend [this overview](https://www.youtube.com/watch?v=aqlxqpHs-aQ).

### Plugins & Pacakges 🧰

**Plugin management:**

- [`folke/lazy.nvim`](https://github.com/folke/lazy.nvim)

**LISP:**

- [`Olical/aniseed`](https://github.com/Olical/aniseed)
- [`Olical/conjure`](https://github.com/Olical/conjure) 

**Navigation:**

- [`mbbill/undotree`](https://github.com/mbbill/undotree)
- [`nvim-telescope/telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim)

**Editing:**

- [`zbirenbaum/copilot.lua`](https://github.com/zbirenbaum/copilot.lua)
- [`windwp/nvim-ts-autotag`](https://github.com/windwp/nvim-ts-autotag)
- [`HiPhish/nvim-ts-rainbow2`](https://github.com/HiPhish/nvim-ts-rainbow2)
- [`nvim-treesitter/nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
- [`nvim-treesitter/nvim-treesitter-textobjects`](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [`JoosepAlviste/nvim-ts-context-commentstring`](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)

**Theme:**

- [`nyoom-engineering/oxocarbon.nvim`](https://github.com/nyoom-engineering/oxocarbon.nvim)

**Discovery:**

- [`folke/which-key.nvim`](https://github.com/folke/which-key.nvim)
- [`junegunn/vim-peekaboo`](https://github.com/junegunn/vim-peekaboo)

**Misc:**

- [`numToStr/FTerm.nvim`](https://github.com/numToStr/FTerm.nvim)
- [`echasnovski/mini.nvim`](https://github.com/echasnovski/mini.nvim)

**NOTE:** `echasnovski/mini.nvim` is responsible for powering a number of different features across multiple categories.

### References 📚

**Dotfiles:**

- [`rinx/dotfiles`](https://github.com/rinx/dotfiles)
- [`suonlight/dotfiles`](https://github.com/suonlight/dotfiles)
- [`Grazfather/dotfiles`](https://github.com/Grazfather/dotfiles)
- [`katawful/dotfiles-nvim`](https://github.com/katawful/dotfiles-nvim)

**Configurations:**

- [`LazyVim/LazyVim`](https://github.com/LazyVim/LazyVim)
- [`Olical/magic-kit`](https://github.com/Olical/magic-kit)
- [`nvim-lua/kickstart.nvim`](https://github.com/nvim-lua/kickstart.nvim)
- [`nyoom-engineering/nyoom.nvim`](https://github.com/nyoom-engineering/nyoom.nvim)

**NOTE:** For an exhaustive list of Neovim distributions see [here](https://github.com/rockerBOO/awesome-neovim#preconfigured-configuration).

**Fennel integrations:**

- [`Olical/aniseed`](https://github.com/Olical/aniseed)
- [`rktjmp/hotpot.nvim`](https://github.com/rktjmp/hotpot.nvim)
- [`udayvir-singh/tangerine.nvim`](https://github.com/udayvir-singh/tangerine.nvim)

