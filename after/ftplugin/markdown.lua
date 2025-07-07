vim.cmd("setlocal textwidth=80")

vim.opt_local.spell = true
vim.opt_local.conceallevel = 1

vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true
vim.opt_local.smartindent = true

local which_key = require("which-key")

local obsidian_mappings = {
  { "<leader>o",  group = "Obsidian" },
  { "<leader>on", "<CMD>ObsidianTemplate Note<CR>",      desc = "Insert note template" },
  { "<leader>ot", "<CMD>ObsidianTemplate<CR>",           desc = "Select Template" },
  { "<CR>",       require("obsidian").util.smart_action, desc = "Smart action" },
}

which_key.add(obsidian_mappings)
-- mappings = {
--   -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
--   ["gf"] = {
--     action = function()
--       return require("obsidian").util.gf_passthrough()
--     end,
--     opts = { noremap = false, expr = true, buffer = true },
--   },
--   -- Toggle check-boxes.
--   ["<leader>ch"] = {
--     action = function()
--       return require("obsidian").util.toggle_checkbox()
--     end,
--     opts = { buffer = true },
--   },
--   -- Smart action depending on context, either follow link or toggle checkbox.
--   ["<cr>"] = {
--     action = function()
--       return require("obsidian").util.smart_action()
--     end,
--     opts = { buffer = true, expr = true },
--   }
-- },
