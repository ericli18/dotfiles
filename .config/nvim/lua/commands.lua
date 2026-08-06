local function current_file()
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    vim.notify('Current buffer has no file path', vim.log.levels.WARN)
    return nil
  end

  return vim.fn.fnamemodify(path, ':p')
end

local function repo_root(path)
  local dir = vim.fn.fnamemodify(path, ':h')
  local output = vim.fn.systemlist({ 'git', '-C', dir, 'rev-parse', '--show-toplevel' })

  if vim.v.shell_error ~= 0 or vim.tbl_isempty(output) then
    vim.notify('Current file is not in a Git repository', vim.log.levels.WARN)
    return nil
  end

  return output[1]
end

vim.api.nvim_create_user_command('CopyRepoPath', function()
  local path = current_file()
  if not path then
    return
  end

  local root = repo_root(path)
  if not root then
    return
  end

  local relative_path = vim.fs.relpath(root, path)
  if not relative_path then
    vim.notify('Could not make file path relative to repo root', vim.log.levels.WARN)
    return
  end

  vim.fn.setreg('+', relative_path)
  vim.notify('Copied ' .. relative_path)
end, {
  desc = 'Copy the current file path relative to the Git repository root',
})
