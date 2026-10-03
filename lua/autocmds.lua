require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].formatexpr = "v:lua.vim.lsp.formatexpr"
  end,
})

-- Auto-open nvim-tree on startup when opening a file or directory
autocmd("VimEnter", {
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

-- Trigger Docker build on save for LaTeX files
autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    vim.fn.jobstart("docker run --rm -v .:/paper paper-builder make all", {
      on_exit = function(_, code)
        if code == 0 then
          print("Build Successful")
        else
          print("Build Failed - check build.log")
        end
      end,
    })
  end,
})
