return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    ---@param buf integer
    ---@param language string
    ---@return boolean
    local function treesitter_attach(buf, language)
      if not vim.treesitter.language.add(language) then
        return false
      end
      vim.treesitter.start(buf, language)

      -- enables treesitter based folds
      -- for more info on folds see `:help folds`
      -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      return true
    end

    local available_parsers = require('nvim-treesitter.config').get_available()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local buf, filetype = args.buf, args.match
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        if not (treesitter_attach(buf, language) or vim.tbl_contains(available_parsers, language)) then
          return
        end

        if not vim.tbl_contains(require('nvim-treesitter.config').get_installed 'parsers', language) then
          require('nvim-treesitter.install').install(language):await(function()
            treesitter_attach(buf, language)
          end)
        end
      end,
    })

    local parsers = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
    require('nvim-treesitter').install(parsers)
  end,
}
-- return {
--   'nvim-treesitter/nvim-treesitter',
--   build = ':TSUpdate',
--   main = 'nvim-treesitter.configs', -- Sets main module to use for opts
--   -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--   opts = {
--     ensure_installed = { 'astro', 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
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
