return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false, -- 透明
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "tokyonight",
    },
  },
}
