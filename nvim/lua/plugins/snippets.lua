return {
  -- add my snippets
  {
    "rafamadriz/friendly-snippets",
    config = function()
      -- require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
    end,
  },
}
