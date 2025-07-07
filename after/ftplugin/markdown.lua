vim.cmd("setlocal textwidth=80")

-- vim.opt_local.spell = true
vim.opt_local.conceallevel = 1

vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true
vim.opt_local.smartindent = true

local which_key = require("which-key")
local conceallevel = 1

local obsidian_mappings = {
  { "<leader>o",  group = "[Obsidian]" },
  { "<leader>on", "<CMD>ObsidianTemplate note<CR>", desc = "Insert note template" },
  { "<leader>oo", "<CMD>ObsidianTemplate<CR>",      desc = "Select template" },
  {
    "<leader>of",
    "<CMD>:s/\\(-\\|\\)\\(\\w\\)\\(\\w*\\)/\\=(submatch(1) == '-' ? ' ' : '') . toupper(submatch(2)) . tolower(submatch(3))/g | noh<CR>",
    desc = "Format title"
  },
  {
    "<leader>oi",
    function()
      if conceallevel == 1 then
        vim.cmd("set conceallevel=0")
        conceallevel = 0
      else
        vim.cmd("set conceallevel=1")
        conceallevel = 1
      end
    end,
    desc = "Toggle UI"
  },
  { "<CR>", require("obsidian").util.smart_action, desc = "Smart action" },
}

which_key.add(obsidian_mappings)
