# whitespace.nvim

This is a simple neovim plugin to highlight and remove trailing whitespace.

## Installation

```lua
-- Using packer.nvim
use {
    'bujnlc8/whitespace.nvim',
    config = function ()
        require('whitespace-nvim').setup({
            -- configuration options and their defaults

            -- `highlight` configures which highlight is used to display
            -- trailing whitespace
            highlight = 'DiffDelete',

            -- `ignored_filetypes` configures which filetypes to ignore when
            -- displaying trailing whitespace
            ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },
            -- 文件后缀名，比如.class和.java文件的filetype相同，但是不希望.class文件标示出空白
            ignored_suffixes = {".class"}
        })

        -- remove trailing whitespace with a keybinding
        vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
    end
}
```
