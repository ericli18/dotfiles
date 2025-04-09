local options = {
    ensure_installed = {
        "html",
        "bash",
        "c",
        "cmake",
        "cpp",
        "fish",
        "haskell",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "printf",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        "tsx",
        "typescript",
        "javascript",
        "java"
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
