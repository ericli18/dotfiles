return {
    -- lazy.nvim
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("codecompanion").setup({
                strategies = {
                    chat = {
                        adapter = "copilot",
                    },
                    inline = {
                        adapter = "copilot",
                    },
                },
            })
        end
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
            { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
        lazy = true,
        branch = "regexp", -- This is the regexp branch, use this for the new version
        config = function()
            require("venv-selector").setup()
        end,
        keys = {
            { ",v", "<cmd>VenvSelect<cr>" },
        },
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require "nvchad.configs.luasnip"

            local ls = require "luasnip"

            ls.filetype_extend("javascriptreact", { "html" })
            ls.filetype_extend("typescriptreact", { "html" })

            require("luasnip.loaders.from_vscode").lazy_load { paths = { vim.fn.stdpath "config" .. "/snippets/vscode" } }
        end,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            picker = {
                win = {
                    input = {
                        keys = {
                            ["<Esc>"] = { "close", mode = { "n", "i" } },
                        }
                    }
                }
            },
            bigfile = { enabled = true },
            quickfile = { enabled = true },
        },
        keys = {
            -- Top Pickers & Explorer
            { "<leader><space>", function() Snacks.picker.files() end,   desc = "Smart Find Files" },
            { "<C-p>",           function() Snacks.picker.files() end,   desc = "Smart Find Files" },
            { "<leader>,",       function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>fg",      function() Snacks.picker.grep() end,    desc = "Grep" },
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command
                end,
            })
        end,
    },
    {
        "hiphish/rainbow-delimiters.nvim",
        version = "*", -- Pin to GitHub releases
        lazy = false,
        -- enabled = false,
        config = function()
            require('rainbow-delimiters.setup').setup {
                highlight = {
                    'RainbowDelimiterCyan',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterRed',
                },
            }
        end,
    },
    {
        "amitds1997/remote-nvim.nvim",
        version = "*",                       -- Pin to GitHub releases
        dependencies = {
            "nvim-lua/plenary.nvim",         -- For standard functions
            "MunifTanjim/nui.nvim",          -- To build the plugin UI
            "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
        },
        config = true,
    },
    {
        'xeluxee/competitest.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
        config = function()
            require('competitest').setup {
                -- testcases_directory = "./.tests",
                testcases_use_single_file = true,
                compile_command = {
                    c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
                    cpp = { exec = "g++", args = { "-DLOCAL", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
                    rust = { exec = "rustc", args = { "$(FNAME)" } },
                    java = { exec = "javac", args = { "$(FNAME)" } },
                },
            }
        end,
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
