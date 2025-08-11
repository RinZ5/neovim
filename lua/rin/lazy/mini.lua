-- https://github.com/echasnovski/mini.nvim

return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.files').setup({
            mappings = {
                go_in_plus = '<CR>',
            }
        })
        require('mini.pick').setup({
            mappings = {
                move_down    = '<C-j>',
                move_start   = '<C-g>',
                move_up      = '<C-k>',

                -- scroll_down   = '<C-j>',
                scroll_left  = '<C-h>',
                scroll_right = '<C-l>',
                -- scroll_up     = '<C-k>',
            }
        })
        require('mini.jump').setup({})
        require('mini.surround').setup({})
        require('mini.move').setup({
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                left = '<C-h>',
                right = '<C-l>',
                down = '<C-j>',
                up = '<C-k>',

                -- Move current line in Normal mode
                line_left = '',
                line_right = '',
                line_down = '',
                line_up = '',
            },
        })
        require('mini.pairs').setup({})
    end
}
