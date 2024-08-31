--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/alpha.lua
-- Description: Neovim Splash Screen
-- Author: Conor Donihoo
return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "BlakeJC94/alpha-nvim-fortune" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set random header
      local home = os.getenv("HOME")
      local headerData = dofile(home .. "/.config/nvim/lua/art.lua")

      local function getRandomKey(t)
        local keys = {}
        for key in pairs(t) do
          table.insert(keys, key)
        end
        local randomIndex = math.random(1, #keys)
        return keys[randomIndex]
      end

      local function tableToString(t)
        return table.concat(t, "\n")
      end

      math.randomseed(os.time())

      dashboard.section.header.val = headerData[getRandomKey(headerData)]

      -- Set menu
      dashboard.section.buttons.val = {
          dashboard.button( "e", "  > New file",        ":ene <BAR> startinsert <CR>"),
          dashboard.button( "r", "  > Recent files",    ":Telescope oldfiles<CR>"),
          dashboard.button( "f", "  > Find file",       ":Telescope find_files<CR>"),
          dashboard.button( "t", "  > Find text",       ":Telescope live_grep<CR>"),
          dashboard.button( "c", "  > Config",          ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
          dashboard.button( "q", "  > Quit NVIM",       ":qa<CR>"),
      }

      -- Set footer
      local fortune = require("alpha.fortune")
      dashboard.section.footer.val = fortune()

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd([[
          autocmd FileType alpha setlocal nofoldenable
      ]])
    end
  }
}
