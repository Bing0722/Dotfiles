return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        qss = { "prettier" },
      },
      formatters = {
        prettier = {
          command = "prettier",
          args = { "--stdin-filepath", "$FILENAME" },
          stdin = true,
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          filetypes = { "css", "qss" }, -- 添加 qss 支持
        },
      },
    },
  },
}
