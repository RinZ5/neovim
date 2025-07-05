local which_key = require("which-key")

local non_lsp_mappings = {
  { "<leader>e", vim.cmd.Ex, desc = "Open file explorer" },
  { "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and replace word under cursor" },
}

which_key.add(non_lsp_mappings)
