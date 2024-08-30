--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/telescope.lua
-- Description: nvim-telescope config
-- Author: Conor Donihoo
-- NOTE: telescope requires the ripgrep and fd packages!!!
return {{
    -- Telescope
    -- Find, Filter, Preview, Pick. All lua, all the time.
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim", {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    }},
    config = function(_)
        require("telescope").setup()
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require("telescope").load_extension("fzf")
        -- Create a custom command to look for files from the home directory
        vim.api.nvim_create_user_command("FindFilesHome", function()
            require("telescope.builtin").find_files({cwd="~/"})
        end, {})
        -- Create a custom command to grep from the home directory
        vim.api.nvim_create_user_command("GrepFilesHome", function()
            require("telescope.builtin").live_grep({cwd="~/"})
        end, {})
    end
}}
