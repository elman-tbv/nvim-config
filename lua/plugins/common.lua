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

  "williamboman/mason.nvim", -- provides lsp servers
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "folke/neodev.nvim",  -- configures lua-lsp for Neovim

  -- complitetion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {'hrsh7th/cmp-nvim-lsp'},
  },

  -- highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
  }
}
