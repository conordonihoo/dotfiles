--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/formatter.lua
-- Description: Formatters and linters
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
return {{
    "mhartington/formatter.nvim",
    config = function()
        local vim = vim
        local formatter = require("formatter")
        local prettierConfig = function()
            return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
                stdin = true
            }
        end

        local formatterConfig = {
            lua = {
                -- function()
                --    return {
                --      exe = "stylua",
                --      args = {  "-" },
                --      stdin = true,
                --    }
                --  end,
                -- function()
                --   return {
                --     exe = "luafmt",
                --     args = {"--indent-count", 2, "--stdin"},
                --     stdin = true
                --   }
                -- end
            },
            ['*'] = {
                -- require("formatter.filetypes.any").lsp_format,
                -- require('formatter.filetypes.any').remove_trailing_whitespace
            }
        }
        local commonFT = {"html", "markdown", "markdown.mdx", "json", "yaml", "xml"}
        for _, ft in ipairs(commonFT) do
            formatterConfig[ft] = {prettierConfig}
        end
        -- Setup functions
        formatter.setup({
            logging = true,
            filetype = formatterConfig,
            log_level = 2
        })
    end
}, {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            markdown = {"vale"}
        }
    end
}}

