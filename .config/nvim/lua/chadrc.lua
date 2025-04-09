---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvchad",

}

M.ui = {
    statusline = {
        theme = "vscode_colored",

        -- order = { "mode", "f", "git", "%=", "lsp_msg", "%=", "lsp" },
        -- order = { "mode", "kirby_face" },
        order = { "custom_mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "cwd" },
        modules = {

            custom_mode = function()
                local mode = vim.fn.mode()

                local mode_names = {
                    n      = "NORMAL",
                    i      = "INSERT",
                    v      = "VISUAL",
                    ['']  = "VISUAL-BLOCK",
                    V      = "V-LINE",
                    c      = "COMMAND",
                    no     = "NORMAL (operator pending)",
                    s      = "SELECT",
                    S      = "S-LINE",
                    ['']  = "S-BLOCK",
                    ic     = "INSERT (completion)",
                    R      = "REPLACE",
                    Rv     = "V-REPLACE",
                    cv     = "COMMAND",
                    ce     = "COMMAND",
                    r      = "PROMPT",
                    rm     = "MORE",
                    ['r?'] = "CONFIRM",
                    ['!']  = "SHELL",
                    t      = "TERMINAL",
                }

                -- The Kirby face mapping.
                local mode_kirby = {
                    n      = "<(•ᴗ•)>",
                    i      = "<(•o•)>",
                    v      = "(v•-•)v",
                    [""]  = "(v•-•)>",
                    V      = "(>•-•)>",
                    c      = "(>*-*)>",
                    no     = "<(•ᴗ•)>",
                    s      = "(>*-*)>",
                    S      = "(>*-*)>",
                    [""]  = "(>*-*)>",
                    ic     = "(>*-*)>",
                    R      = "(>*-*)>",
                    Rv     = "(>*-*)>",
                    cv     = "<(•ᴗ•)>",
                    ce     = "<(•ᴗ•)>",
                    r      = "(>*-*)>",
                    rm     = "(>*-*)>",
                    ["r?"] = "(>*-*)>",
                    ["!"]  = "<(•ᴗ•)>",
                    t      = "<(•ᴗ•)>",
                }

                local mode_hl = {
                    n      = "St_NormalMode",
                    i      = "St_InsertMode",
                    v      = "St_VisualMode",
                    [""]  = "St_VisualMode",
                    V      = "St_VisualMode",
                    c      = "St_CommandMode",
                    no     = "St_NormalMode",
                    s      = "St_SelectMode",
                    S      = "St_SelectMode",
                    ['']  = "St_SelectMode",
                    ic     = "St_InsertMode",
                    R      = "St_ReplaceMode",
                    Rv     = "St_ReplaceMode",
                    cv     = "St_CommandMode",
                    ce     = "St_CommandMode",
                    r      = "St_PromptMode",
                    rm     = "St_PromptMode",
                    ['r?'] = "St_PromptMode",
                    ['!']  = "St_ShellMode",
                    t      = "St_TerminalMode",
                }

                local mode_name = mode_names[mode] or mode
                local kirby = mode_kirby[mode] or mode
                local hl = mode_hl[mode] or "St_NormalMode"

                return string.format("%%#%s# %s %s ", hl, mode_name, kirby)
            end,

        },
    },

    tabufline = {
        enabled = true,
        order = { "treeOffset", "buffers", "tabs" },
        lazyload = false,
    },

    cheatsheet = {
        theme = "simple", -- simple/grid
    },
}

return M
