local which_key = require("which-key")

local non_lsp_mappings = {
  { "<leader>e", vim.cmd.Ex, desc = "Open file explorer" },
  { "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and replace word under cursor" },
}

local telescope_mappings = {
  { "<leader>f", group = "Find" },
  { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find file" },
  { "<leader>fl", "<CMD>Telescope live_grep<CR>", desc = "Live grep" },
}

which_key.add(non_lsp_mappings)
which_key.add(telescope_mappings)
