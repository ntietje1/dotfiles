return {
  "karb94/neoscroll.nvim",
  config = function()
    local neoscroll = require('neoscroll')

    -- Setup easing function or other general settings
    neoscroll.setup({
            mappings = {},
            easing = "quadratic",
            cursor_scrolls_alone = false,
        })

    -- Define custom key mappings for Ctrl+j (scroll down) and Ctrl+k (scroll up)
    local keymap = {
      -- ["<C-j>"] = function() neoscroll.scroll(0.2, { move_cursor=false; duration = 80 }) end,
      -- ["<C-k>"] = function() neoscroll.scroll(-0.2, { move_cursor=false; duration = 80 }) end,
        ["<C-k>"] = function() neoscroll.ctrl_u({ duration = 100 }) end,
        ["<C-j>"] = function() neoscroll.ctrl_d({ duration = 100 }) end,
    }

    -- Set the key mappings in normal, visual, and select modes
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end

    --
    -- -- List of keys to delete
    -- local deletelist = {"<C-b>", "<C-f>"}
    -- for _, key in ipairs(deletelist) do
    --   vim.keymap.del(modes, key)
    -- end
end
}

