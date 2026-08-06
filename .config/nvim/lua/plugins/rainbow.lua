return {
  'hiphish/rainbow-delimiters.nvim',
  version = '*',
  enabled=false,
  event = { 'BufReadPost', 'BufNewFile' },
  opt = {
    highlight = {
      'RainbowDelimiterCyan',
      'RainbowDelimiterYellow',
      'RainbowDelimiterBlue',
      'RainbowDelimiterOrange',
      'RainbowDelimiterGreen',
      'RainbowDelimiterViolet',
    },
  },
}
--
-- return {
--   'saghen/blink.pairs',
--   dependencies = 'saghen/blink.lib',
--
--   version = '*',
--   -- download prebuilt binaries from github releases, must be on a versioned release
--   build = function() require('blink.pairs').download():pwait(60000) end,
--   -- OR build from source
--   -- build = function() require('blink.pairs').build():pwait(60000) end,
--
--   --- @module 'blink.pairs'
--   --- @type blink.pairs.Config
--   opts = {
--     mappings = {
--       enabled = false,
--       cmdline = true,
--     },
--     highlights = {
--       enabled = true,
--       cmdline = true,
--       groups = { 'BlinkPairsOrange', 'BlinkPairsPurple', 'BlinkPairsBlue' },
--       unmatched_group = 'BlinkPairsUnmatched',
--
--       -- highlights matching pairs under the cursor
--       matchparen = {
--         enabled = true,
--         -- known issue where typing won't update matchparen highlight, disabled by default
--         cmdline = false,
--         -- also include pairs not on top of the cursor, but surrounding the cursor
--         include_surrounding = false,
--         group = 'BlinkPairsMatchParen',
--         priority = 250,
--       },
--     },
--     debug = false,
--   }
-- }
