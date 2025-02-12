-- return {
--   {
--     "stevearc/conform.nvim",
--     -- event = 'BufWritePre', -- uncomment for format on save
--     opts = require "configs.conform",
--   },
--
--   -- These are some examples, uncomment them if you want to see them work!
--   {
--     "neovim/nvim-lspconfig",
--     config = function()
--       require "configs.lspconfig"
--     end,
--   },
--   -- {
--   -- 	"nvim-treesitter/nvim-treesitter",
--   -- 	opts = {
--   -- 		ensure_installed = {
--   -- 			"vim", "lua", "vimdoc",
--   --      "html", "css"
--   -- 		},
--   -- 	},
--   -- },
-- }
return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",                      -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim",          -- For standard functions
      "MunifTanjim/nui.nvim",           -- To build the plugin UI
      "nvim-telescope/telescope.nvim",  -- For picking b/w different remote methods
    },
    config = true,
  },
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function() require('competitest').setup() end,
    lazy = false
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.treesitter")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require("configs.mason-lspconfig")
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.lint")
    end,
  },

  {
    "rshkarin/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "nvim-lint" },
    config = function()
      require("configs.mason-lint")
    end,
  },

  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre",
    config = function()
      require("configs.conform")
    end,
  },

  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "conform.nvim" },
    config = function()
      require("configs.mason-conform")
    end,
  },
}
