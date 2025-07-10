-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
   -- Packer can manage itself
   use 'wbthomason/packer.nvim'

   -- use {
   --    'nvim-telescope/telescope.nvim', tag = '0.1.0',
   --    -- or                            , branch = '0.1.x',
   --    requires = { {'nvim-lua/plenary.nvim'} }
   -- }

   use 'NvChad/nvim-colorizer.lua'

   use {
     "AckslD/nvim-neoclip.lua",
     requires = {
       {'nvim-telescope/telescope.nvim'},
     },
     config = function()
       require('neoclip').setup()
     end,
   }

   use "windwp/nvim-autopairs"
   -- use ({
   --     "windwp/nvim-autopairs",
   --     -- event = "InsertEnter",
   --     -- requires = { "nvim-treesitter/nvim-treesitter" },
   -- })

   use({ 'nvim-telescope/telescope-live-grep-args.nvim' })
   use {
     'nvim-telescope/telescope.nvim',
     requires = {
       { 'nvim-telescope/telescope-live-grep-args.nvim' },
     },
   }

   use 'rcarriga/nvim-notify'

   -- colorscheme
   use({
      'EdenEast/nightfox.nvim',
      as = 'nightfox',
      config = function()
         vim.cmd('colorscheme nightfox')
      end
   })

   use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
   use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
      requires = "nvim-treesitter/nvim-treesitter",
   })
  use("stevearc/aerial.nvim")
   --use {'nvim-telescope/telescope-file-browser.nvim'} -- not used
   use('nvim-treesitter/playground')
   use('theprimeagen/harpoon')
   use('mbbill/undotree')
   use('tpope/vim-fugitive')
   use('tpope/vim-surround')
   use('tpope/vim-unimpaired')
   use('tpope/vim-commentary')
   use('tpope/vim-repeat')
   use('tpope/vim-sleuth')
   use('godlygeek/tabular')
   use('tommcdo/vim-exchange')

   use {
       's1n7ax/nvim-window-picker',
       tag = 'v2.*',
   }

   -- tabline
   use {
      'akinsho/bufferline.nvim',
      -- tag = "v3.*",
      requires = 'nvim-tree/nvim-web-devicons'
   }

   use('folke/which-key.nvim')

   -- automatic session management
   use {
      'jedrzejboczar/possession.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
   }

   use {
      'TimUntersberger/neogit',
      requires = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim'
      }
    }
    use('lewis6991/gitsigns.nvim')

   -- use {
   --    'nvimdev/dashboard-nvim',
   --    -- event = 'VimEnter', -- enabling this event makes packer install it in opt folder and screwing it. works without it
   --     -- this reffers to local file in after/plugin folder -- this reffers to local file in after/plugin folder
   --    -- config = function() require('dashboard-nvim') end,
   --    requires = {'nvim-tree/nvim-web-devicons'}
   -- }

   use {
      'kana/vim-textobj-entire',
      requires = { { 'kana/vim-textobj-user' } }
   }

   use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
         -- LSP Support
         {'neovim/nvim-lspconfig'},
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},

         -- Autocompletion
         {'hrsh7th/nvim-cmp'},
         {'hrsh7th/cmp-buffer'},
         {'hrsh7th/cmp-path'},
         {'saadparwaiz1/cmp_luasnip'},
         {'hrsh7th/cmp-nvim-lsp'},
         {'hrsh7th/cmp-nvim-lua'},

         -- Snippets
         {'L3MON4D3/LuaSnip'},
         {'rafamadriz/friendly-snippets'},
      }
   }

   use("folke/zen-mode.nvim")

   use {
      'nvim-tree/nvim-tree.lua',
      requires = {
         'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
   }

   -- use {
   --    'mrcjkb/rustaceanvim'
   -- }

   use 'mfussenegger/nvim-dap'

   use {
      "rcarriga/nvim-dap-ui",
      requires = {
         "mfussenegger/nvim-dap",
         "nvim-neotest/nvim-nio"
      }
   }


end)
