(module dotfiles.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util dotfiles.util
             packer packer}})

(defn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :dotfiles.plugin. name))]
    (when (not ok?)
      (print (.. "dotfiles error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name))))))))

;; Plugins to be managed by packer.
(use
  :Olical/aniseed {:mod :conjure}
  :Olical/conjure {}
  :Olical/nvim-local-fennel {}
  :airblade/vim-gitgutter {}
  :arcticicestudio/nord-vim {:mod :nord}
  :clojure-vim/clojure.vim {}
  :clojure-vim/vim-jack-in {}
  ;;:dag/vim-fish {}
  :easymotion/vim-easymotion {:mod :easymotion}
  :folke/which-key.nvim {}
  :guns/vim-sexp {:mod :sexp}
  :hrsh7th/nvim-compe {:mod :compe}
  :itchyny/lightline.vim {:mod :lightline}
  :jiangmiao/auto-pairs {}
  :junegunn/fzf {:mod :fzf}
  :junegunn/fzf.vim {}
  :liuchengxu/vim-better-default {:mod :better-default}
  :mbbill/undotree {:mod :undotree}
  :neovim/nvim-lspconfig {:mod :lsp}
  :radenling/vim-dispatch-neovim {}
  :tami5/compe-conjure {}
  :tpope/vim-commentary {}
  :tpope/vim-dispatch {}
  :tpope/vim-fugitive {:mod :fugitive}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}
  :tweekmonster/startuptime.vim {}
  ;;:w0rp/ale {:mod :ale}
  :wbthomason/packer.nvim {}
  )
