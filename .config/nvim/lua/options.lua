require "nvchad.options"

-- add yours here!
--
vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/snippets/vscode"

local opt = vim.o
opt.linebreak = true      -- Wrap lines at convenient points
opt.list = true           -- Show some invisible characters (tabs...
opt.mouse = "a"           -- Enable mouse mode

opt.relativenumber = true -- Relative line numbers

opt.smartcase = true      -- Don't ignore case with capitals
opt.smartindent = true    -- Insert indents automatically

opt.termguicolors = true  -- True color support

opt.shiftwidth = 0
opt.tabstop = 4
local function augroup(name)
    return vim.api.nvim_create_augroup("nvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

if vim.g.neovide then
    vim.o.guifont = "jetbrains mono:h15"
    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<c-=>", function()
        change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<c-->", function()
        change_scale_factor(1 / 1.25)
    end)

    vim.g.neovide_cursor_trail_size = 0.8
    vim.keymap.set({ "n", "x" }, "<c-s-c>", '"+y', { desc = "copy system clipboard" })
    vim.keymap.set({ "n", "x" }, "<c-s-v>", '"+p', { desc = "paste system clipboard" })
    vim.g.neovide_scroll_animation_length = 0.2
    vim.g.neovide_cursor_trail_size = 0.5
    vim.g.neovide_cursor_animation_length = 0.05
    vim.g.neovide_cursor_animate_in_insert_mode = true

    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 8
    vim.g.neovide_padding_left = 8
end
