return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false, -- 透明
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    },
  },

  -- Catppuccin 配色方案
  -- {
  --   "catppuccin/nvim",
  --   opts = {
  --     flavour = "macchiato", -- 可选值: "latte", "mocha", "macchiato"
  --     transparent_background = true,
  --   },
  -- },

  -- Nightfox 配色方案
  -- {
  --   "EdenEast/nightfox.nvim",
  --   opts = {
  --     transparent = true,
  --   },
  -- },

  -- Nord 配色方案
  -- { "shaunsingh/nord.nvim" },

  -- OneDark 配色方案
  -- { "joshdick/onedark.vim" },

  -- Ayu 配色方案
  -- { "ayu-theme/ayu-vim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "tokyonight",
    },
  },
}
