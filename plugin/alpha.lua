vim.pack.add({
    "https://github.com/goolord/alpha-nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/folke/snacks.nvim",
})

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function footer()
    local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
    local version = vim.version()
    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return datetime .. nvim_version_info
end

-- Set header
dashboard.section.header.val = {
    [[                                        ]],
    [[                                        ]],
    [[                           @@           ]],
    [[                          @@@@@         ]],
    [[                        @@@@@@@@        ]],
    [[                      @@@@@@@@          ]],
    [[                    @@@@@@@@            ]],
    [[                  @@@@@@@@              ]],
    [[                @@@@@@@@                ]],
    [[              @@@@@@@@@@                ]],
    [[             @@@@@@@@@@@@@              ]],
    [[           @@@@@@@@ @@@@@@@@            ]],
    [[         @@@@@@@@     @@@@@@@@          ]],
    [[       @@@@@@@@        @@@@@@@@@        ]],
    [[      @@@@@@@            @@@@@@@@       ]],
    [[     @@@@@@                @@@@@@@      ]],
    [[     @@@@@                  @@@@@@      ]],
    [[     @@@@@@                 @@@@@@      ]],
    [[     @@@@@@@@             @@@@@@@@      ]],
    [[      @@@@@@@@           @@@@@@@@       ]],
    [[        @@@@@@@@       @@@@@@@@         ]],
    [[          @@@@@@@@   @@@@@@@@           ]],
    [[            @@@@@@@@@@@@@@@             ]],
    [[              @@@@@@@@@@@               ]],
    [[               @@@@@@@@                 ]],
    [[             @@@@@@@@@                  ]],
    [[            @@@@@@@@                    ]],
    [[          @@@@@@@@                      ]],
    [[        @@@@@@@@                        ]],
    [[       @@@@@@@                          ]],
    [[         @@@                            ]],
    [[                                        ]],
    [[                                        ]],
}

-- Set menu;
dashboard.section.buttons.val = {
    dashboard.button("<C-e>", "  File Explorer"),
    dashboard.button("<leader>fa", "  All Files", Snacks.picker.files),
    dashboard.button("<leader>fs", "  Grep Search", Snacks.picker.grep),
    dashboard.button("q", "󰅙  Quit", ":qa<CR>")
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
