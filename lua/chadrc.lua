-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ashes",
  transparency = false,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].formatexpr = "v:lua.vim.lsp.formatexpr"
  end,
})


vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if real_file then
      -- open the tree, find the file but don't focus it
      require("nvim-tree.api").tree.toggle({ find_file = true, focus = false })
    elseif directory then
      -- change to the directory and open the tree
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end
  end,
})


vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
-- Sync with system clipboard

-- vim.opt.clipboard = 'unnamedplus'





-- Trigger Docker build on save for LaTeX files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    -- Sends the command to your existing container
    vim.fn.jobstart("docker run --rm -v .:/paper paper-builder make all", {
      on_exit = function(_, code)
        if code == 0 then
          print("Build Successful")
        else
          print("Build Failed - check build.log")
        end
      end
    })
  end,
})

vim.g.vimtex_view_method = 'zathura'

-- Crucial: Tell VimTeX where the artifacts are
vim.g.vimtex_compiler_latexmk = {
    out_dir = 'paper-build',
}

-- If you are using the 'cp' method in your Makefile, 
-- you might need to manually specify the target
vim.g.vimtex_view_zathura_options = '-x "nvr --remote-silent %f -c %l"'



return M
