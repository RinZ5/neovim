local which_key = require("which-key")

-- yoink from https://github.com/VVoruganti/dotfiles/blob/master/neovim/lua/marshmalon/remap.lua
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        -- https://www.mitchellhanberg.com/modern-format-on-save-in-neovim/
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = event.buf,
            callback = function()
                vim.lsp.buf.format { async = false, id = event.data.client_id }
            end
        })

        -- https://www.reddit.com/r/neovim/comments/1eeqn6o/comment/lft5kqt/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
        vim.diagnostic.config({
            virtual_text = {
                prefix = ' ■ ', -- Could be '●', '▎', 'x', '■', , 
            },
            update_in_insert = true, -- you wound proably need this to be true, it updates diagnostic when you type
            float = { border = "rounded" },
        })
    end,
})

local lsp_mappings = {
    { "<leader>l",  group = "[LSP]" },
    { "<leader>la", vim.lsp.buf.code_action,      desc = "Code action" },
    { "<leader>ld", vim.diagnostic.open_float,    desc = "Open diagnostic float" },
    { "<leader>ln", vim.lsp.buf.rename,           desc = "Rename" },
    { "<leader>lr", vim.lsp.buf.references,       desc = "References" },
    { "<leader>lw", vim.lsp.buf.workspace_symbol, desc = "Workspace symbol" },
    {
        "<leader>lt",
        function()
            if vim.diagnostic.is_enabled() then
                vim.diagnostic.enable(false)
            else
                vim.diagnostic.enable()
            end
        end,
        desc = "Toggle diagnostic"
    },
    { "K",  function() vim.lsp.buf.hover({ border = 'single' }) end, desc = "Show hover information" },
    { "gd", vim.lsp.buf.definition,                                  desc = "Go to definition" },
    { "gl", vim.diagnostic.open_float,                               desc = "Open diagnostic float" },
}

local non_lsp_mappings = {
    -- { "<leader>e", vim.cmd.Ex, desc = "Open file explorer" },
    { "<leader>e", "<CMD>Yazi<CR>", desc = "Open file explorer" },
    { ">",         ">gv",           desc = "Indent Right",      mode = "v" },
    { "<",         "<gv",           desc = "Indent Left",       mode = "v" },
}




local telescope_mappings = {
    { "<leader>f",  group = "[Telescope]" },
    { "<leader>ff", "<CMD>Telescope find_files<CR>",                    desc = "Find file" },
    { "<leader>fl", "<CMD>Telescope live_grep<CR>",                     desc = "Live grep" },
    { "<leader>fb", "<CMD>Telescope buffers<CR>",                       desc = "Buffer" },
    { "<leader>fw", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Symbol" },
}

local neotree_mappings = {
    { "<leader>b", "<CMD>Neotree toggle<CR>", desc = "Toggle NeoTree" }
}

local undotree_mappings = {
    { "<leader>u", "<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>", desc = "Toggle undotree" }
}

local trouble_mappings = {
    { "<leader>t",  group = "[Trouble]" },
    { "<leader>tt", "<CMD>Trouble diagnostics toggle<CR>", desc = "Toggle trouble" },
}

local harpoon = require("harpoon")

local harpoon_mappings = {
    { "<leader>h",  group = "[Harpoon]" },
    { "<leader>ha", function() harpoon:list():add() end,                         desc = "Harpoon add" },
    { "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon menu" }
}

which_key.add(lsp_mappings)
which_key.add(non_lsp_mappings)
which_key.add(telescope_mappings)
which_key.add(neotree_mappings)
which_key.add(undotree_mappings)
which_key.add(trouble_mappings)
which_key.add(harpoon_mappings)
