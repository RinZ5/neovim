-- https://github.com/catppuccin/nvim?tab=readme-ov-file

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe"
    })
  end
}
