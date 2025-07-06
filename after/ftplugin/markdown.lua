vim.cmd("setlocal textwidth=80")

vim.opt_local.spell = true
vim.opt_local.conceallevel = 1

local which_key = require("which-key")

local obsidian_mappings = {
  { "<leader>c",  group = "Obsidian" },
  { "<leader>ch", require("obsidian").util.toggle_checkbox, desc = "Toggle checkbox" },
  { "<CR>",       require("obsidian").util.smart_action,    desc = "Smart action" },
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
