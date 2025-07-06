-- yoink from https://github.com/VVoruganti/dotfiles/blob/master/neovim/lua/marshmalon/lazy/lsp.lua

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },
  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls"
      },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          require('lspconfig').lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = {
                  version = 'LuaJIT'
                },
                diagnostics = {
                  globals = { 'vim', 'love' },
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  }
                }
              }
            }
          })
        end,
        -- https://www.reddit.com/r/neovim/comments/1g4e3sa/finally_neovim_native_vue_lsp_perfection_2024/
        ["ts_ls"] = function()
          require('lspconfig').ts_ls.setup({
              capabilities = capabilities,
              init_options = {
                plugins = { -- I think this was my breakthrough that made it work
                  {
                    name = "@vue/typescript-plugin",
                    location = vim.fn.stdpath 'data' ..
                        '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                    languages = { "vue" },
                  },
                },
              },
              filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            },

            require('lspconfig').volar.setup({})
          )
        end
      }
    })

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    -- this is the function that loads the extra snippets to luasnip
    -- from rafamadriz/friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    })
  end
}
