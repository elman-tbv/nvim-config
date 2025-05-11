return {

  -- comment/uncomment
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

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
  "folke/neodev.nvim",                 -- configures lua-lsp for Neovim

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
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
