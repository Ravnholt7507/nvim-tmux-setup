-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'ThePrimeagen/vim-be-good'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Colorscheme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Highlighting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- Undo Tree <leader>u
    use 'mbbill/undotree'

    --LSP
    use({ 'williamboman/mason.nvim' })
    use({ 'williamboman/mason-lspconfig.nvim' })
    use({ 'neovim/nvim-lspconfig' })
    use({ 'hrsh7th/cmp-nvim-lsp' })
    use({ 'hrsh7th/cmp-nvim-lsp-signature-help' })

    use { 'nvim-tree/nvim-web-devicons', opt = true }
    -- Status lines
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Typescript auto tags (automatic close of divs)
    use({ 'windwp/nvim-ts-autotag' })

    -- Automatic close of brackets.
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use({
        "L3MON4D3/LuaSnip",
    })
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require 'cmp'.setup {
                snippet = {
                    expand = function(args)
                        require 'luasnip'.lsp_expand(args.body)
                    end
                },

                sources = {
                    { name = 'luasnip' },
                    -- more sources
                },
            }
        end
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    use "nvim-lua/plenary.nvim"
     use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
end)
