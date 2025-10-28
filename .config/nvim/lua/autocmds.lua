--- Autocmds ---
-- -- Treesitter
-- local function on_buf_win_enter(_args)
--   if vim.bo.filetype ~= '' then
--     vim.treesitter.start()
--   end
-- end
--
-- vim.api.nvim_create_autocmd('BufWinEnter', { pattern = '*', callback = on_buf_win_enter })
-- 2) track explorer open/close so you can (for example) disable format-on-save
local explorer_grp = vim.api.nvim_create_augroup('minifiles', { clear = true })
vim.api.nvim_create_autocmd('User', {
  group = explorer_grp,
  pattern = 'MiniFilesExplorerOpen',
  callback = function()
    vim.g.minifiles_active = true
  end,
})

vim.api.nvim_create_autocmd('User', {
  group = explorer_grp,
  pattern = 'MiniFilesExplorerClose',
  callback = function()
    vim.g.minifiles_active = false
  end,
})

vim.api.nvim_create_autocmd('User', {
  desc = 'Notify LSPs that a file was renamed',
  pattern = 'MiniFilesActionRename',
  callback = function(args)
    require('mini.files').close()
    local changes = {
      files = { {
        oldUri = vim.uri_from_fname(args.data.from),
        newUri = vim.uri_from_fname(args.data.to),
      } },
    }
    local will, did = vim.lsp.protocol.Methods.workspace_willRenameFiles, vim.lsp.protocol.Methods.workspace_didRenameFiles

    for _, c in ipairs(vim.lsp.get_clients()) do
      if c:supports_method(will) then
        local res = c:request_sync(will, changes, 1000, 0)
        if res and res.result then
          vim.lsp.util.apply_workspace_edit(res.result, c.offset_encoding)
        end
      end
    end

    for _, c in ipairs(vim.lsp.get_clients()) do
      if c:supports_method(did) then
        c:notify(did, changes)
      end
    end
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
