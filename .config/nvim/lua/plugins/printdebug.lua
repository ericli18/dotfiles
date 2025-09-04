-- return {
--   'chrisgrieser/nvim-chainsaw',
--   event = 'VeryLazy',
--   opts = {},
--   keys = {
--     {
--       '<leader>lv',
--       function()
--         require('chainsaw').variableLog()
--       end,
--       desc = '[L]og [V]ariable',
--     },
--     {
--       '<leader>lo',
--       function()
--         require('chainsaw').objectLog()
--       end,
--       desc = '[L]og [O]bject',
--     },
--     {
--       '<leader>lt',
--       function()
--         require('chainsaw').typeLog()
--       end,
--       desc = '[L]og [T]ype',
--     },
--     {
--       '<leader>le',
--       function()
--         require('chainsaw').emojiLog()
--       end,
--       desc = '[L]og [E]moji',
--     },
--     {
--       '<leader>lm',
--       function()
--         require('chainsaw').messageLog()
--       end,
--       desc = '[L]og [M]essage',
--     },
--     {
--       '<leader>lr',
--       function()
--         require('chainsaw').removeLogs()
--       end,
--       desc = '[L]ogs [R]emove',
--     },
--   },
-- }
--
return {
  'Goose97/timber.nvim',
  version = '*',
  event = 'VeryLazy',
  config = function()
    require('timber').setup {
      log_templates = {
        default = {
          cpp = [[debug(%log_target);]],
        },
      },
    }
  end,
}
