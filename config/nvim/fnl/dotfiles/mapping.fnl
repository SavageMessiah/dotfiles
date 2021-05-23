(module dotfiles.mapping
  {autoload {nvim aniseed.nvim
             nu aniseed.nvim.util
             core aniseed.core}})

(defn- noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))

;; Generic mapping configuration.
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; jk escape sequences.
(noremap :i :jk :<esc>)
(noremap :c :jk :<c-c>)
(noremap :t :jk :<c-\><c-n>)

;; Spacemacs style leader mappings.
(noremap :n :<leader>wm ":tab sp<cr>")
(noremap :n :<leader>wc ":only<cr>")
(noremap :n :<leader>bd ":bdelete!<cr>")
(noremap :n :<leader>to ":tabonly<cr>")
(noremap :n :<leader>sw ":mksession! .quicksave.vim<cr>")
(noremap :n :<leader>sr ":source .quicksave.vim<cr>")
