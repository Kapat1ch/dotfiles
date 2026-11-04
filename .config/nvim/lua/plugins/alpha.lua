return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                   __====-_  _-====___                   ]],
            [[             _--^^^#####//      \\#####^^^--_             ]],
            [[          _-^##########// (    ) \\##########^-_          ]],
            [[         -############//  |\^^/|  \\############-         ]],
            [[       _/############//   (@::@)   \\############\_       ]],
            [[      /#############((     \\//     ))#############\      ]],
            [[     -###############\\    (oo)    //###############-     ]],
            [[    -#################\\  / VV \  //#################-    ]],
            [[   -###################\\/      \//###################-   ]],
            [[  _#/|##########/\######(   /\   )######/\##########|\#_  ]],
            [[  |/ |#/\#/\#/\/  \#/\##\  |  |  /##/\#/  \/\#/\#/\#| \|  ]],
            [[  `  |/  V  V  `   V  \#\| |  | |/#/  V   '  V  V  \|  '  ]],
            [[     `   `  `      `   / | |  | | \   '      '  '   '     ]],
            [[                      (  | |  | |  )                      ]],
            [[                     __\ | |  | | /__                     ]],
            [[                    (____< |  | >____)                    ]],
            [[                                                          ]],
            [[                  N   E   O   V   I   M                   ]],
            [[                                                          ]],
        }

        local function clean_btn(sc, txt, keybind)
            local b = dashboard.button(sc, txt, keybind)
            b.opts.hl_shortcut = "Normal"
            b.opts.hl = "Normal"
            return b
        end

        dashboard.section.buttons.val = {
            clean_btn("c", "  Конфигурация Neovim", function()
                require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
            end),
            clean_btn("r", "  Недавние файлы", "<cmd>Telescope oldfiles<CR>"),
            clean_btn("f", "󰈞  Найти файл в проекте", "<cmd>Telescope find_files<CR>"),
            clean_btn("g", "󰊄  Поиск слова в проекте", "<cmd>Telescope live_grep<CR>"),
            clean_btn("q", "  Выход", "<cmd>qa<CR>"),
        }

        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = {
            "",
            "Загружен за " .. ms .. " мс",
        }

        vim.api.nvim_set_hl(0, "DashboardCyan", { fg = "#8be9fd" })

        dashboard.section.header.opts.hl = "DashboardCyan"
        dashboard.section.footer.opts.hl = "Comment"

        alpha.setup(dashboard.opts)
    end,
}
