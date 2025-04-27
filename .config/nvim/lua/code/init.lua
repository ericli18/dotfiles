if not vim.g.vscode then
  return
end

local map = vim.keymap.set

map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)
map("n", "<leader>sg", [[<cmd>call VSCodeNotify('workbench.action.quickTextSearch')<cr>]])
map("n", "<leader>ss", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])
map("n", "<leader>e", [[<cmd>call VSCodeNotify('workbench.view.explorer')<cr>]])
map("n", "L", [[<cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<cr>]])
map("n", "H", [[<cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<cr>]])
map("n", "<leader>cs", [[<cmd>call VSCodeNotify('workbench.action.toggleAuxiliaryBar')<cr>]])


map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
