return {
  "numToStr/Comment.nvim",
  config = function()
    require('Comment').setup()
    vim.keymap.set('n', '<C-_>', function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })
    vim.keymap.set('v', '<C-_>', "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { noremap = true, silent = true })

  end
}

