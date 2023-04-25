(module rc.util
  {autoload {lazy lazy
             nvim aniseed.nvim
             core aniseed.core}})

;; NOTE
;; `defn` defines a function that can be exported
;; https://github.com/Olical/aniseed/blob/44d2886a9ec38abac61b4c73c2e57fb752232cfe/doc/aniseed.txt#L348
;; `defn-` defines a private function that will not be exported
;; https://github.com/Olical/aniseed/blob/44d2886a9ec38abac61b4c73c2e57fb752232cfe/doc/aniseed.txt#L356

(defn cmd->fn [cmd]
  "Run Vim command"
  (fn []
    (vim.cmd (.. ":" cmd))))

(defn use [pkgs]
  "Handle Lazy config"
  (let [plugins (icollect [name opts (pairs pkgs)]
                  (core.assoc opts 1 name))]
    (lazy.setup
      plugins)))

(defn nnoremap [from to opts]
  "Setup new key map"
  (let [map-opts {:noremap true}
        to (.. ":" to "<cr>")]
    (if (core.get opts :local?)
      (nvim.buf_set_keymap 0 :n from to map-opts)
      (nvim.set_keymap :n from to map-opts))))

(defn lnnoremap [from to]
  "Setup new keymap with leader already specified"
  (nnoremap (.. "<leader>" from) to))
