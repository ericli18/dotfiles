-- return {
--   'hiphish/rainbow-delimiters.nvim',
--   version = '*',
--   event = { "BufReadPost", "BufNewFile" },
--   config = function()
--     require('rainbow-delimiters.setup').setup {
--       highlight = {
--         'RainbowDelimiterCyan',
--         'RainbowDelimiterYellow',
--         'RainbowDelimiterBlue',
--         'RainbowDelimiterOrange',
--         'RainbowDelimiterGreen',
--         'RainbowDelimiterViolet',
--         'RainbowDelimiterRed',
--       },
--     }
--   end,
-- }
--
return {
  'saghen/blink.pairs',
  version = '*',

  dependencies = 'saghen/blink.download',
  enabled=false,

  --- @module 'blink.pairs'
  --- @type blink.pairs.Config
  opts = {
    mappings = {
      -- you can call require("blink.pairs.mappings").enable() and require("blink.pairs.mappings").disable() to enable/disable mappings at runtime
      enabled = false,
      -- you may also disable with `vim.g.pairs = false` (global) or `vim.b.pairs = false` (per-buffer)
      disabled_filetypes = {},
      -- see the defaults: https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L12
      pairs = {},
    },
    highlights = {
      enabled = true,
      groups = {
        'BlinkPairsBlue',
        'BlinkPairsPurple',
        'BlinkPairsOrange',
      },
      matchparen = {
        enabled = true,
        group = 'MatchParen',
      },
    },
    debug = false,
  },
}
