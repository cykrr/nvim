require "nvchad.options"

-- add yours here!

-- VimTeX configuration
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_latexmk = {
  out_dir = "paper-build",
}
vim.g.vimtex_view_zathura_options = '-x "nvr --remote-silent %f -c %l"'
