return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "clojure",
        "haskell",
        "lua",
        "markdown",
      },
    },
  },
  { "clojure-vim/clojure.vim", branch = "indent-forms" },
  { "EdenEast/nightfox.nvim" },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
    },
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3", -- Recommended
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      if type(opts.sources) == "table" then
        vim.list_extend(opts.sources, { name = "clojure" })
      end
      opts.mapping["<CR>"] = nil
      opts.mapping["<C-Space>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true })
        else
          cmp.complete()
        end
      end)
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    "julienvincent/nvim-paredit",
    ft = { "clojure" },
    config = function()
      require("nvim-paredit").setup()
    end,
  },
  { "PaterJason/nvim-treesitter-sexp", enabled = false },
  {
    "Olical/conjure",
    event = function(_, _)
      return {}
    end,
    ft = { "clojure", "fennel", "janet" },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clojure_lsp = {},
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    opts = {
      skip_unbalanced = false,
    },
  },
}
