vim.g.loaded_netrw = 1
vim.opt.termguicolors = true
vim.g.loaded_netrwPlugin = 1
-- vim.o.background = 'light'

-- Force .idl files to use webidl filetype for Ladybird browser development
vim.filetype.add({
  extension = {
    idl = "webidl",
  },
})

vim.diagnostic.config {
  virtual_lines = {
    current_line = true,
  },
}
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.swapfile = false
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
-- vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.scrolloff = 10
vim.opt.confirm = true

vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- global statusline
vim.o.laststatus = 3

-- Folding options
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
-- g.markdown_folding = 1

vim.opt.foldnestmax = 3
vim.opt.foldlevelstart = 99

local function close_all_folds()
  vim.api.nvim_exec2("%foldc!", { output = false })
end
local function open_all_folds()
  vim.api.nvim_exec2("%foldo!", { output = false })
end

vim.keymap.set("n", "<leader>zs", close_all_folds, { desc = "[s]hut all folds" })
vim.keymap.set("n", "<leader>zo", open_all_folds, { desc = "[o]pen all folds" })

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
    vim.g.neovide_cursor_animation_length = 0.04
    vim.g.neovide_cursor_animate_in_insert_mode = false

    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 8
    vim.g.neovide_padding_left = 8
end
