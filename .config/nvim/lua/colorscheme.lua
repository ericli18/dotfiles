return
--   {
--   'sainnhe/everforest',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.everforest_background = 'hard'
--     vim.g.everforest_enable_italic = 1
--     vim.g.everforest_better_performance = 1
--     vim.g.everforest_ui_contrast = 'high'
--     vim.g.everforest_diagnostic_virtual_text = 'colored'
--     vim.cmd.colorscheme 'everforest'
--   end,
-- }
-- {
--   'folke/tokyonight.nvim',
--   -- priority = 900,
--   config = function()
--     require('tokyonight').setup {
--       styles = {
--         comments = { italic = false },
--       },
--     }
--   end,
-- },
{
  'bluz71/vim-moonfly-colors',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'moonfly'
  end,
}
-- {
--   'miikanissi/modus-themes.nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'modus'
--   end,
-- }
