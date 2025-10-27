return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup()

    local ensure_installed = {
      'astro',
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
    }
    require('nvim-treesitter').install(ensure_installed)
  end,
}
-- return {
--   'nvim-treesitter/nvim-treesitter',
--   build = ':TSUpdate',
--   main = 'nvim-treesitter.configs', -- Sets main module to use for opts
--   -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--   opts = {
--     ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
--     auto_install = true,
--     highlight = {
--       enable = true,
--       additional_vim_regex_highlighting = { 'ruby' },
--     },
--     indent = { enable = true, disable = { 'ruby' } },
--     incremental_selection = {
--       enable = true,
--       keymaps = {
--         init_selection = '<cr>',
--         node_incremental = '<cr>',
--         scope_incremental = false,
--         node_decremental = '<bs>',
--       },
--     },
--   },
-- }
--
