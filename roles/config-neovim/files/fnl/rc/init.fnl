(module rc.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             lazy lazy}})

(defn- use [pkgs]
  (let [plugins (icollect [name opts (pairs pkgs)]
                  (core.assoc opts 1 name))]
    (lazy.setup
      plugins)))

(set nvim.o.background :dark)
(set nvim.o.termguicolors true)

;;; Mappings

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;;; Plugins

(use
  { :folke/lazy.nvim { :lazy true }
    :Olical/aniseed { :lazy true }
    :nyoom-engineering/oxocarbon.nvim { :lazy true }})

;;; Themes
(nvim.ex.colorscheme :oxocarbon)

