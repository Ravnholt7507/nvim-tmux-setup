vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require('mason').setup()
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'nvim_lsp_signature_help'},
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
  snippet = {
      expand = function(args)
          require('luasnip').lsp_expand(args.body)
      end,
  },
  mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({select = false}),
      ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then
              cmp.select_next_item({behavior = 'select'})
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
              fallback()
          else
              cmp.complete()
          end
      end, {'i', 's'}),

      -- Go to previous item
      ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
      -- Jump to the next snippet placeholder
      ['<C-f>'] = cmp.mapping(function(fallback)
          local luasnip = require('luasnip')
          if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
          else
              fallback()
          end
      end, {'i', 's'}),
      -- Jump to the previous snippet placeholder
      ['<C-b>'] = cmp.mapping(function(fallback)
          local luasnip = require('luasnip')
          if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
          else
              fallback()
          end
      end, {'i', 's'}),
  }),
})
--Actual languange
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "tailwindcss", "ast_grep", "rome"},
}
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end


-- TypeScript
nvim_lsp.ts_ls.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascriptreact"},
    cmd = { "typescript-language-server", "--stdio" }
}

