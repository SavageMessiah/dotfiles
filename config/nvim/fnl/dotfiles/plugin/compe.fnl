(module dotfiles.plugin.compe
  {autoload {compe compe
             nvim aniseed.nvim}})

(set nvim.o.completeopt "menuone,noselect")

(compe.setup
  {:enabled true
   :autocomplete true
   :debug false
   :min_length 1
   :preselect "enable"
   :throttle_time 80
   :source_timeout 200
   :incomplete_delay 400
   :max_abbr_width 100
   :max_kind_width 100
   :max_menu_width 100
   :documentation true
   :source {:path true
            :buffer true
            :calc true
            :nvim_lsp true
            :nvim_lua true
            :conjure true }})

(nvim.ex.inoremap "<silent><expr> <TAB> pumvisible() ? \"\\<C-n>\" : \"\\<TAB>\"")
(nvim.ex.inoremap "<silent><expr> <S-TAB> pumvisible() ? \"\\<C-p>\" : \"\\<C-h>\"")
