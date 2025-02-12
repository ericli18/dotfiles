require "nvchad.options"

-- add yours here!

local opt = vim.o
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode

opt.relativenumber = true -- Relative line numbers

opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically

opt.termguicolors = true -- True color support


local function augroup(name)
  return vim.api.nvim_create_augroup("nvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
