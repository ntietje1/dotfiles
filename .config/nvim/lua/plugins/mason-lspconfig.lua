return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
    {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      -- Setup mason-lspconfig to automatically detect installed LSP servers
      mason_lspconfig.setup()

      -- Automatically configure installed LSP servers
      mason_lspconfig.setup_handlers({
        -- Default handler (for all installed servers)
        function(server_name)
          local lspconfig = require("lspconfig")
          lspconfig[server_name].setup {}
        end,

        -- You can add custom setups for specific LSPs here if necessary
        -- Example: custom setup for `lua_ls`
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          }
        end,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
     -- local lspconfig = require("lspconfig")
       --     lspconfig.lua_ls.setup {}
         --   lspconfig.pyright.setup {}
           -- lspconfig.gopls.setup {}
    -- opts = {
    --             diagnostics = {
    --                 update_in_insert = true
    --             },
    --             codelens = {
    --                 enabled = true
    --             }
    --         }
    end
  },
  {
    "hrsh7th/nvim-cmp",
        dependencies ={
            "hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
        },
    config = function()
        local cmp = require("cmp")
        vim.opt.completeopt = {"menu", "menuone", "noselect"}
              cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            mapping = {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            },
            sources= cmp.config.sources({
            {name = "nvim_lsp"},
            {name = "nvim_lua"},
            {name = "luasnip"},
            },
                {
                {name = "buffer"},
                {name = "path"},}
                )})
    end
    }
}
