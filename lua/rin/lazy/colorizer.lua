-- https://github.com/catgoose/nvim-colorizer.lua

return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup()
  end
}
