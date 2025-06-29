return {
  'hiphish/rainbow-delimiters.nvim',
  version = '*',
  event = { "BufReadPost", "BufNewFile" },
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
}
