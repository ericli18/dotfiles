return {
  'NeogitOrg/neogit',
  cmd = 'Neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- VSCode-style side-by-side diff backend for Neogit.
    { 'esmuellert/codediff.nvim', opts = {} },
  },
  opts = {
    integrations = {
      snacks = true,
      codediff = true,
    },
  },
  keys = {
    {
      '<leader>gg',
      function()
        require('neogit').open()
      end,
      desc = 'Open Neo[g]it',
    },
  },
}
