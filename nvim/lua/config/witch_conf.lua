    require("witch").setup {
        theme = {
            -- if you disable the theme, no default highlight styles will be set by default
            -- you must to add a customs module or extras module to set the highlight styles
            enabled = true,

            -- default style of the theme
            -- "dark", "light"
            style = "dark",

            -- more module that you want it should be loaded
            extras = {
                -- bracket = true,
                -- dashboard = true,
                -- diffview = true,
                -- explorer = true,
                -- indentline = true,

                -- you can disable startup module by setting enabled to false
                -- then you can add the startup module by yourself like extras module like above
                -- ["startup.<module_name>"] = true,
            },

            -- custome your highlight module
            -- see: witch.theme.example
            customs = {
                -- require("witch.theme.example"),
            },

            -- This function is called when witch starts highlighting.
            -- It provides a unique opportunity to modify the default highlight groups.
            -- If you wish to customize the default highlight groups, you can do so here.
            -- This function is invoked after loading all colors and highlight options
            -- but before applying the highlights, allowing users to adjust undesired highlights.
            -- you can do something like this
            --
            -- on_highlight = function(style, colors, highlight)
            -- 	if style == "dark" then
            -- 		-- change the default background of witch
            -- 		colors.bg = "#000000"

            -- 		-- change the Normal highlight group of witch
            -- 		highlight.Normal = { fg = "#ffffff", bg = "#000000" }
            -- 	elseif style == "light" then
            -- 		-- change the default background of witch
            -- 		colors.bg = "#ffffff"

            -- 		-- change the Normal highlight group of witch
            -- 		highlight.Normal = { fg = "#000000", bg = "#ffffff" }
            -- 	end
            -- end,

            --- @param style string : the current style of the theme
            --- @param colors table : the current colors of the theme
            --- @param highlight table : the current highlights of the theme
            on_highlight = function(style, colors, highlight)
            end,
        },

        -- dims inactive windows
        dim_inactive = {
            enabled = true,
            -- from 0 to 1
            -- as nearer to 1 the dimming will be lighter
            level = 0.48,

            -- Prevent dimming the last active window when switching to a window
            -- with specific filetypes or buftypes listed in the excluded table.
            --
            -- The idea of this option is when change to a window like NvimTree, Telescope, ...
            -- where these windows are considered auxiliary tools.
            -- the last active window retains its status as the main window
            -- and should not be dimmed upon switching.
            excluded = {
                filetypes = {
                    NvimTree = true,
                },
                buftypes = {
                    nofile = true,
                    prompt = true,
                    terminal = true,
                },
            },
        },

        -- true if you want to use command StinvimUISwitch
        switcher = true,

        -- add your custom themes here
        more_themes = {

            -- the key is the name of the theme must be in PascalCase
            -- the value is the table of colors to be passed to the theme
            -- with following format in witch.colors.example
            -- Custom1 = {},
            -- Custom2 = {},
        },
    }
