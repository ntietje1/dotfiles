-- Enable line numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Use 4 spaces for tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Visual settings
-- vim.opt.colorcolumn = "80"      -- Highlight column 80
vim.opt.scrolloff = 8           -- Keep 8 lines visible when scrolling
vim.opt.smartindent = true      -- Smart indentation
vim.opt.wrap = false            -- Disable line wrapping
vim.opt.termguicolors = true    -- Enable true color support

-- Undo settings
vim.opt.undofile = true         -- Enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- Set undo directory

-- Key mappings (disable certain default bindings)
vim.api.nvim_set_keymap('n', '<C-f>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<Nop>', { noremap = true, silent = true })

