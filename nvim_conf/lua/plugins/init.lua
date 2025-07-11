return {

   -- {
   --    'nvim-telescope/telescope.nvim', version = '0.1.0',
   --    -- or                            , branch = '0.1.x',
   --    dependencies = { {'nvim-lua/plenary.nvim'} }
   -- }

   'NvChad/nvim-colorizer.lua',

   {
     "AckslD/nvim-neoclip.lua",
     dependencies = {
       {'nvim-telescope/telescope.nvim'},
     },
     config = function()
       require('neoclip').setup()
     end,
   },

   "windwp/nvim-autopairs",
   -- ({
   --     "windwp/nvim-autopairs",
   --     -- event = "InsertEnter",
   --     -- dependencies = { "nvim-treesitter/nvim-treesitter" },
   -- })

   ({ 'nvim-telescope/telescope-live-grep-args.nvim' }),
   {
     'nvim-telescope/telescope.nvim',
     dependencies = {
       { 'nvim-telescope/telescope-live-grep-args.nvim' },
     },
   },

   'rcarriga/nvim-notify',

   -- colorscheme
   ({
      'EdenEast/nightfox.nvim',
      name = 'nightfox',
      config = function()
         vim.cmd('colorscheme nightfox')
      end
   }),

   ({'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'}),
   ({
      "nvim-treesitter/nvim-treesitter-textobjects",
      -- after = "nvim-treesitter",
      dependencies = "nvim-treesitter/nvim-treesitter",
   }),
  ("stevearc/aerial.nvim"),
   --{'nvim-telescope/telescope-file-browser.nvim'} -- not d
   ('nvim-treesitter/playground'),
   ('mbbill/undotree'),
   ('tpope/vim-fugitive'),
   ('tpope/vim-surround'),
   ('tpope/vim-unimpaired'),
   ('tpope/vim-commentary'),
   ('tpope/vim-repeat'),
   ('tpope/vim-sleuth'),
   ('godlygeek/tabular'),
   ('tommcdo/vim-exchange'),

   {
       's1n7ax/nvim-window-picker',
       version = 'v2.*',
   },

   -- tabline
   {
      'akinsho/bufferline.nvim',
      -- version = "v3.*",
      dependencies = 'nvim-tree/nvim-web-devicons'
   },

   ('folke/which-key.nvim'),

   -- automatic session management
   {
      'jedrzejboczar/possession.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
   },

   {
      'TimUntersberger/neogit',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim'
      }
    },
    ('lewis6991/gitsigns.nvim'),

   -- {
   --    'nvimdev/dashboard-nvim',
   --    -- event = 'VimEnter', -- enabling this event makes packer install it in opt folder and screwing it. works without it
   --     -- this reffers to local file in after/plugin folder -- this reffers to local file in after/plugin folder
   --    -- config = function() require('dashboard-nvim') end,
   --    dependencies = {'nvim-tree/nvim-web-devicons'}
   -- }

   {
      'kana/vim-textobj-entire',
      dependencies = { { 'kana/vim-textobj-user' } }
   },

   {
      'VonHeikemen/lsp-zero.nvim',
      dependencies = {
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
   },

   ("folke/zen-mode.nvim"),

   {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
         'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      -- version = 'nightly' -- optional, updated every week. (see issue #1193)
   },

   -- {
   --    'mrcjkb/rustaceanvim'
   -- }

   'mfussenegger/nvim-dap',

   {
      "rcarriga/nvim-dap-ui",
      dependencies = {
         "mfussenegger/nvim-dap",
         "nvim-neotest/nvim-nio"
      }
   }
}
