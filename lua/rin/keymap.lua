local which_key = require("which-key")

-- yoink from https://github.com/VVoruganti/dotfiles/blob/master/neovim/lua/marshmalon/remap.lua
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
  callback = function(event)
    local mappings = {
      { "<leader>l",  buffer = 1,                   group = "LSP" },
      { "<leader>la", vim.lsp.buf.code_action,      buffer = 1,   desc = "Code action" },
      { "<leader>ld", vim.diagnostic.open_float,    buffer = 1,   desc = "Open diagnostic float" },
      { "<leader>ln", vim.lsp.buf.rename,           buffer = 1,   desc = "Rename" },
      { "<leader>lr", vim.lsp.buf.references,       buffer = 1,   desc = "References" },
      { "<leader>lw", vim.lsp.buf.workspace_symbol, buffer = 1,   desc = "Workspace symbol" },
      { "K",          vim.lsp.buf.hover,            buffer = 1,   desc = "Show hover information" },
      { "gd",         vim.lsp.buf.definition,       buffer = 1,   desc = "Go to definition" },
      { "gl",         vim.diagnostic.open_float,    buffer = 1,   desc = "Open diagnostic float" },
    }

    which_key.add(mappings)

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
    })
  end,
})

local non_lsp_mappings = {
  { "<leader>e", vim.cmd.Ex,                                             desc = "Open file explorer" },
  { "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and replace word under cursor" },
}

local telescope_mappings = {
  { "<leader>f",  group = "Find" },
  { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find file" },
  { "<leader>fl", "<CMD>Telescope live_grep<CR>",  desc = "Live grep" },
}

which_key.add(non_lsp_mappings)
which_key.add(telescope_mappings)
