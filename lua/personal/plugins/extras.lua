return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
  {
    "mechatroner/rainbow_csv",
    ft = { "csv", "tsv" },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
    },
    opts = function()
      return {
        adapters = {
          require("neotest-rspec"),
        },
      }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    enabled = true,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function(_, opts)
      local theme = require("personal.ui.bufferline")

      opts = opts or {}
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        diagnostics = "nvim_lsp",
        themable = false,
        separator_style = "thin",
        show_close_icon = false,
        show_buffer_close_icons = false,
        indicator = {
          style = "underline",
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            separator = false,
          },
        },
      })
      opts.highlights = theme.build_highlights()

      return opts
    end,
    config = function(_, opts)
      local bufferline = require("bufferline")
      local theme = require("personal.ui.bufferline")
      local augroup = vim.api.nvim_create_augroup("PersonalBufferlineTheme", { clear = true })

      local function apply()
        opts.highlights = theme.build_highlights()
        bufferline.setup(opts)
        theme.apply_tabline()
      end

      apply()

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = augroup,
        callback = apply,
      })
    end,
  },
}
