-- "The I in LLM stands for intelligence".
return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'j-hui/fidget.nvim',
    },
    cmd = 'CodeCompanion',
    keys = {
      { '<leader>ta', '<cmd>CodeCompanionChat Toggle<cr>', desc = '[T]oggle [A]I' },
      { '<leader>aa', '<cmd>CodeCompanionChat Add<cr>', desc = '[A]i [A]dd to chat', mode = 'x' },
    },
    opts = function()
      local config = require('codecompanion.config').config

      local diff_opts = config.display.diff.opts

      require('plugins.ai.fidget'):init()

      return {
        strategies = {
          chat = {
            adapter = 'copilot',
          },
          inline = {
            adapter = 'copilot',
            keymaps = {
              accept_change = {
                modes = { n = '<leader>ay' },
                description = '[A]i [Y]es change',
              },
              reject_change = {
                modes = { n = '<leader>an' },
                description = '[A]i [N]o change',
              },
            },
          },
        },
        display = {
          diff = { opts = diff_opts },
        },
      }
    end,
  },
}
