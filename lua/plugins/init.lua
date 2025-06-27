return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "S1M0N38/love2d.nvim",
    event = "VeryLazy",
    opts = { },
    keys = {
      { "<leader>v", ft = "lua", desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
    },

    {
      "karb94/neoscroll.nvim",
      event = "VeryLazy",
      config = function()
        local neoscroll = require("neoscroll")
        neoscroll.setup({
          -- You can tweak these
          easing = "quadratic",
          hide_cursor = true,
          performance_mode = false,
        })

        local keymap = {
          ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250 }) end,
          ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250 }) end,
          ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450 }) end,
          ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450 }) end,
          ["<C-y>"] = function() neoscroll.scroll(-0.10, { move_cursor = false, duration = 100 }) end,
          ["<C-e>"] = function() neoscroll.scroll(0.10, { move_cursor = false, duration = 100 }) end,
          ["zt"]    = function() neoscroll.zt({ half_win_duration = 250 }) end,
          ["zz"]    = function() neoscroll.zz({ half_win_duration = 250 }) end,
          ["zb"]    = function() neoscroll.zb({ half_win_duration = 250 }) end,
        }
        for key, func in pairs(keymap) do
          vim.keymap.set({ "n", "v", "x" }, key, func, { silent = true })
        end
      end,
    }
}


  -- {
  --   "nvimtools/none-ls.nvim",
  --   ensure_installed = { "nvim-lua/plenary.nvim" },
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     local null_ls = require "null-ls"
  --     null_ls.setup {
  --       sources = { null_ls.builtins.formatting.prettierd },
  --     }
  --   end,
  -- },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
