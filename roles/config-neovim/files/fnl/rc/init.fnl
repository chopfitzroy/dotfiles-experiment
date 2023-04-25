(module rc.init
  {autoload {util rc.util
             nvim aniseed.nvim
             configs nvim-treesitter.configs
             parsers nvim-treesitter.parsers}})

(set nvim.o.background :dark)
(set nvim.o.termguicolors true)

;; Mappings
;; Must be set before Lazy config
;; This is because Lazy references the <leader> as part of it's `keys` option

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; Plugins

(util.use
  { 
    ;; Lazy
    :Olical/aniseed { :lazy true }
    :folke/lazy.nvim { :lazy true }
    :nyoom-engineering/oxocarbon.nvim { :lazy true }
    ;; Buff enter
    :Olical/conjure { :event [:BufEnter] }
    :mbbill/undotree { :event [:BufEnter] }
    :folke/which-key.nvim { :event [:BufEnter] }
    :junegunn/vim-peekaboo { :event [:BufEnter] }
    :windwp/nvim-ts-autotag { :event [:BufEnter] }
    :HiPhish/nvim-ts-rainbow2 { :event [:BufEnter] }
    :JoosepAlviste/nvim-ts-context-commentstring { :event [:BufEnter] }
    ;; Very lazy (on `require`)
    :numToStr/FTerm.nvim { :event [:VeryLazy] }
    ;; @TODO
    :echasnovski/mini.nvim { :lazy true }
    ;; Not at all lazy
    :nvim-treesitter/nvim-treesitter { :build (util.cmd->fn :TSUpdate) }
    :nvim-telescope/telescope.nvim { :dependencies [:nvim-lua/plenary.nvim] }})

;; Themes
;; Must be done after Lazy config so theme exists

(nvim.ex.colorscheme :oxocarbon)

;; Language support

(def- languages
  [:clojure
   :fennel
   :html
   :javascript
   :jsdoc
   :json
   :json5
   :jsonc
   :toml
   :tsx
   :typescript
   :vim
   :yaml])

(configs.setup
  {:ensure_installed languages
   :highlight {:enable true
               :disable []}
   :indent {:enable true
            :disable []}
   :context_commentstring {:enable true
                           :enable_autocmd false}})


