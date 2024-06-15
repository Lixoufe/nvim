return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      term_colors = true,
      transparent_background = false,
      color_overrides = {
        mocha = {
          base = "#1e1e2e",
          mantle = "#1e1e2e",
          crust = "#1e1e2e",
        }
      },
      integrations = {
        telescope = {
          enabled = true,
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },

    })
    vim.cmd.colorscheme "catppuccin"
  end
}

