---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace' },
      -- Using stylua for formatting.
      format = { enable = false },
      hint = {
        enable = true,
        arrayIndex = 'Disable',
      },
      runtime = {
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      diagnostics = {
        globals = { 'vim' },
        disable = { 'missing-parameters', 'missing-fields' },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
}
