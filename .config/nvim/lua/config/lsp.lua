-- lsp.lua

-- Ensure required plugins are loaded
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Setup nvim-cmp.
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/`
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- LSP settings
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python LSP configuration
lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local opts = {
            noremap=true,
            silent=true,
            update_in_insert=true,
            codelens = {
                enabled = true
            }
        }
    local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Mappings.
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  end
}
--
-- local servers = {
--     "arduino_language_server",
--     "bashls",
--     "cssls",
--     "css_variables",
--     "cssmodules_ls",
--     "docker_compose_language_service",
--     "dockerls",
--     "eslint",
--     "html",
--     "jsonls",
--     "kotlin_language_server",
--     "lua_ls",
--     "pyright",
--     "tailwindcss",
--     "terraformls",
--     "vimls",
--     "yamlls",
--     -- Add more if needed
-- }
--
-- for _, server in ipairs(servers) do
--     lspconfig[server].setup {
--         on_attach = function(client, bufnr)
--             -- Only use the LSP's formatting if the server supports it
--             if client.server_capabilities.documentFormattingProvider then
--                 -- Auto-format on save
--                 vim.api.nvim_create_autocmd("BufWritePre", {
--                     buffer = bufnr,
--                     callback = function()
--                         vim.lsp.buf.format({ async = true })
--                     end,
--                 })
--             end
--         end,
--     }
-- end


