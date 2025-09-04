return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    keys = {
      { '<leader>gp', '<cmd>Gitsigns preview_hunk_inline<cr>', desc = '[G]it [P]review' },
      { '<leader>gb', '<cmd>Gitsigns blame_line<cr>', desc = '[G]it [B]lame' },
      { '<leader>grh', '<cmd>Gitsigns reset_hunk<cr>', desc = '[G]it [R]eset [H]unk' },
      { '<leader>gph', '<cmd>Gitsigns prev_hunk<cr>', desc = '[G]it [P]revious [H]unk' },
      { '<leader>gnh', '<cmd>Gitsigns next_hunk<cr>', desc = '[G]it [N]ext [H]unk' },
    },
  },
}
