-- "The I in LLM stands for intelligence".
return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = 'CodeCompanion',
    keys = {
      { '<leader>ta', '<cmd>CodeCompanionChat Toggle<cr>', desc = '[T]oggle [A]I' },
      { '<leader>aa', '<cmd>CodeCompanionChat Add<cr>', desc = '[A]i [A]dd to chat', mode = 'x' },
      { '<leader>ai', '<cmd>CodeCompanion<cr>', desc = '[A]i [I]nline prompt', mode = { 'n', 'x' } },
      { '<leader>ac', '<cmd>CodeCompanionActions<cr>', desc = '[A]i a[C]tions', mode = { 'n', 'x' } },
    },
    opts = {
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = 'Prompt ',
          provider = 'snacks',
          opts = {
            show_preset_actions = true,
            show_preset_prompts = true,
            title = 'Actions',
          },
        },
      },
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
    },
  },
}
