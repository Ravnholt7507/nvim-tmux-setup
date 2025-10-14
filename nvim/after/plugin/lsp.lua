local on_attach = function(_, bufnr)
    local opts = {buffer = bufnr}
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

require('mason').setup()

vim.lsp.config('vue_ls', {
    filetypes = {
        "vue"
    },
    init_options = {
        typescript = {
            tsdk = vim.fn.expand("~/.nvm/versions/node/v20.19.3/lib/node_modules/typescript/lib"),
        },
    },
})

vim.lsp.config('ts_ls',{
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
})

vim.lsp.config('pylsp', {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    maxLineLength = 200,
                },
                flake8 = {
                    enabled = true,
                    maxLineLength = 200,
                },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
            }
        }
    }
})

vim.lsp.config('lua_ls', {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        }
    }
})

vim.lsp.config('ansiblels', {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "yaml.ansible" }, -- important for triggering only on Ansible YAML files
    settings = {
        ansible = {
            python = {
                interpreterPath = "python3" -- change this if you use a virtualenv
            },
            ansible = {
                path = "ansible", -- or your custom ansible binary path
            },
            validation = {
                enabled = true,
                lint = {
                    enabled = true,
                    path = "ansible-lint", -- must be in PATH or virtualenv
                }
            }
        }
    }
})

vim.lsp.config('clangd', {
    on_attach = on_attach,
    capabilities = capabilities
})

vim.lsp.config('bashls', {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {'sh', 'bash'}
})

vim.lsp.config('yamlls', {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {'yaml', 'yml'}
})

vim.lsp.enable({'vue_ls', 'ts_ls', 'pylsp', 'lua_ls', 'ansiblels', 'clangd', 'bashls', 'yamlls'})
