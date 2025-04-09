local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- list of all servers configured.
lspconfig.servers = {
    "basedpyright",
    -- "jedi_language_server",
    "clangd",
    "hls",
    "ruff",
    "vtsls",
    "html",
    "astro",
    "emmet_language_server",
    "tailwindcss",
}

-- list of servers configured with default config.
local default_servers = {
    "basedpyright",
    -- "jedi_language_server",
    "clangd",
    "hls",
    "ruff",
    "vtsls",
    "html",
    "astro",
    "emmet_language_server",
    "tailwindcss",
    "jdtls"
}

lspconfig.basedpyright.setup {

    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,

    on_init = on_init,
    capabilities = capabilities,
    settings = {
        basedpyright = {
            disableOrganizeImports = true, -- Using Ruff's import organizer
            disableLanguageServices = false,
            analysis = {
                ignore = { '*' },                 -- Ignore all files for analysis to exclusively use Ruff for linting
                typeCheckingMode = 'off',
                diagnosticMode = 'openFilesOnly', -- Only analyze open files
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,     -- whether pyright offers auto-import completions
            },
        },
    },
}
-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end


-- lspconfig.clangd.setup {
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
-- }
--
-- lspconfig.hls.setup {
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--
--     on_init = on_init,
--     capabilities = capabilities,
-- }
