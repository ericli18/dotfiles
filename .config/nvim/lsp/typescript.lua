---@type vim.lsp.Config
return {
  cmd = { 'tsc', '--lsp', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  root_markers = {
    { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' },
    '.git',
  },
  settings = {
    typescript = {
      preferences = {
        importModuleSpecifier = 'non-relative',
      },
    },
    javascript = {
      preferences = {
        importModuleSpecifier = 'non-relative',
      },
    },
  },
}
