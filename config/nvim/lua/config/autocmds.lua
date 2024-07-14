-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
  pattern = "clojure",
  callback = function(args)
    vim.keymap.set("i", "'", "'", { silent = true, buffer = args.buf })
    vim.keymap.set("i", "`", "`", { silent = true, buffer = args.buf })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(args)
    vim.keymap.set("i", "'", "'", { silent = true, buffer = args.buf })
  end,
})
