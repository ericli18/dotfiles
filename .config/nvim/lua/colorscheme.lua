-- return {
--   'savq/melange-nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'melange'
--   end,
-- }
return  {
  'sainnhe/everforest',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_background = 'hard'
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_better_performance = 1
    vim.g.everforest_ui_contrast = 'high'
    vim.g.everforest_diagnostic_virtual_text = 'colored'
    vim.cmd.colorscheme 'everforest'
  end,
}
--
-- return {
--   'catppuccin/nvim',
--   name = 'catppuccin',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'catppuccin-mocha'
--   end,
-- }
-- return {
--   'folke/tokyonight.nvim',
--   -- priority = 900,
--   config = function()
--     vim.cmd.colorscheme 'tokyonight'
--   end,
-- }
-- return{
--   'bluz71/vim-moonfly-colors',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'moonfly'
--   end,
-- }
-- return {
--   'miikanissi/modus-themes.nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'modus_operandi'
--   end,
-- }

-- Using lazy.nvim
-- return {
--   'deparr/tairiki.nvim',
--   lazy = false,
--   priority = 1000, -- recommended if you use tairiki as your default theme
--   config = function()
--     vim.cmd.colorscheme 'tairiki-light'
--   end,
-- }
