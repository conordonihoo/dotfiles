--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/colorscheme.lua
-- Description: Colorscheme config
-- Author: Conor Donihoo
return {
  {
    -- Rose-pine
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      dark_variant = "moon",
      disable_italics = true,
      disable_bold = true,
    },
  },
  {
    -- Kanagawa
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
  },
  {
    -- Gruvbox
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
  },
}
