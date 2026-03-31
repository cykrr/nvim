-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "dark_horizon",
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

return M


