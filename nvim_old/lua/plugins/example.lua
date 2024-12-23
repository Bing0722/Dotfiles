-- 由于这只是一个示例配置，不实际加载任何内容，返回一个空的配置
-- stylua: ignore
if true then return {} end

-- "plugins" 目录下的每个配置文件会自动加载到 lazy.nvim
--
-- 在你的插件文件中，你可以：
-- * 添加额外的插件
-- * 启用/禁用 LazyVim 插件
-- * 覆盖 LazyVim 插件的配置
return {
  -- 添加 gruvbox 主题
  { "ellisonleao/gruvbox.nvim" },

  -- 配置 LazyVim 使用 gruvbox 主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- 修改 trouble 插件配置
  {
    "folke/trouble.nvim",
    -- opts 会与父配置合并
    opts = { use_diagnostic_signs = true },
  },

  -- 禁用 trouble 插件
  { "folke/trouble.nvim", enabled = false },

  -- 覆盖 nvim-cmp 并添加 cmp-emoji 插件
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- 修改 telescope 配置以及添加一个键绑定来浏览插件文件
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- 添加一个键绑定来浏览插件文件
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- 修改一些选项
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- 向 lspconfig 添加 pyright 支持
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright 会通过 mason 自动安装，并与 lspconfig 一起加载
        pyright = {},
      },
    },
  },

  -- 向 lspconfig 添加 tsserver，并使用 typescript.nvim 进行配置
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver 会通过 mason 自动安装，并与 lspconfig 一起加载
        tsserver = {},
      },
      -- 你可以在这里进行其他的 lsp 服务器配置
      -- 如果返回 true，则表示不希望该服务器与 lspconfig 一起配置
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- 示例：使用 typescript.nvim 进行配置
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- 使用 "*" 作为回退函数处理其他所有服务器
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- 对于 typescript，LazyVim 也提供了额外的配置来正确设置 lspconfig,
  -- treesitter, mason 和 typescript.nvim。所以你也可以使用下面的配置：
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- 添加更多的 treesitter 解析器
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- 因为 `vim.tbl_deep_extend` 只能合并表而不能合并列表，所以上面的代码会覆盖 `ensure_installed` 的新值。
  -- 如果你希望扩展默认配置，可以使用下面的代码：
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- 添加 tsx 和 typescript 到 treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- opts 函数也可以用来修改默认的配置：
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },

  -- 你也可以返回新的配置来覆盖所有默认配置
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[ 在这里添加你的自定义 lualine 配置 ]]
      }
    end,
  },

  -- 使用 mini.starter 代替 alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- 添加 jsonls 和 schemastore 插件，并为 json, json5 和 jsonc 设置 treesitter
  { import = "lazyvim.plugins.extras.lang.json" },

  -- 添加你希望安装的工具
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
