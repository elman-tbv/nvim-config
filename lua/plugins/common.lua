return {

  -- colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
      })
    end
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("lualine").setup({
        icons_enables = true,
        theme = "gruvbox",
      })
    end
  },

  "williamboman/mason.nvim",           -- provides lsp servers
  "williamboman/mason-lspconfig.nvim", -- integrates with nvim lsp server
  "neovim/nvim-lspconfig",

  {
    "folke/lazydev.nvim", -- properly configures LuaLS for editing nvim config
    ft = "lua",           -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  "mfussenegger/nvim-dap", -- provides lsp servers
  "jay-babu/mason-nvim-dap.nvim",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-neotest/nvim-nio"
    },
  },

  -- completion
  {
    "hrsh7th/nvim-cmp",               -- code completion menu
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',         -- integrates with nvim lsp client
      'L3MON4D3/LuaSnip',             -- snippet engine
      'saadparwaiz1/cmp_luasnip',     -- integrates snippet engine with cmp
      'rafamadriz/friendly-snippets', -- snippet collection for different languages
    },
  },

  -- highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },

  {
    'Civitasv/cmake-tools.nvim',
    opts = {}
  },

  -- flexible cmdline and messages
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    lazy = false,
  },

  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {}, -- needed even when using default config

    -- recommended: disable vim's auto-folding
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
    end,
  },

  {
    "NotAShelf/direnv.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require('direnv').setup({
        autoload_direnv = true,
      })
    end,
  },

  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { "BufRead Cargo.toml" },
    config = function()
      require('crates').setup()
    end,
  },

  {
    'mrcjkb/haskell-tools.nvim',
    version = '^6',
    lazy = false,
  },

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    --  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      require("oil").setup()
      -- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<leader>-", function()
        require("oil").toggle_float()
      end, { desc = "Open Oil in a floating window" })
    end,
  }
}
