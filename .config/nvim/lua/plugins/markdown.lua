return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    preset = 'obsidian',
    -- completions = { blink = { enabled = true } },
  },
  keys = {
    {
      '<leader>tm',
      ft = 'markdown',
      '<cmd>RenderMarkdown toggle<cr>',
      desc = '[T]oggle [M]arkdown',
    },
  },
}
