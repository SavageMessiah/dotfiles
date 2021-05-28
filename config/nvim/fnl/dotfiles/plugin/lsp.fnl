(module dotfiles.plugin.lsp
  {autoload {nvim aniseed.nvim
             lsp lspconfig}})

(defn on_attach [client bufnr]
  (fn bsk [map key impl]
    (nvim.buf_set_keymap bufnr map key impl {:noremap true :silent true}))
  
  (bsk :n :gD "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  (bsk :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>")
  (bsk :n :gi "<cmd>lua vim.lsp.buf.implementation()<CR>")
  (bsk :n :gr "<cmd>lua vim.lsp.buf.references()<CR>")
  (bsk :n :<leader>la "<cmd>lua vim.lsp.buf.code_action()<CR>")
  (bsk :n :<leader>lr "<cmd>lua vim.lsp.buf.rename()<CR>")
  (bsk :n :<leader>ld "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  (bsk :n :<leader>lq "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
  (bsk :n :<leader>lf "<cmd>lua vim.lsp.buf.formatting()<CR>")
  ;;buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  ;;buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  ;;buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  ;;buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  (bsk :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>")
  (bsk :n :<C-k> "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  (bsk :n "[d" "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  (bsk :n "]d" "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"))

(lsp.clojure_lsp.setup {:on_attach on_attach})
