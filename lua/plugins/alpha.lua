return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    dashboard.section.header.opts = {
        position = "center",
        hl = "DashboardHeader"
    }
    dashboard.section.header.val = {
                            [[       ,                              ]],
                            [[       \`-._           __             ]],
                            [[        \\  \-..____,.'  `.           ]],
                            [[         :  )       :      :\         ]],
                            [[          ;'        '   ;  | :        ]],
                            [[          )..      .. .:.`.; :        ]],
                            [[         /::...  .:::...   ` ;        ]],
                            [[         `:o>   /\o_>        : `.     ]],
                            [[        `-`.__ ;   __..--- /:.   \    ]],
                            [[        === \_/   ;=====_.':.     ;   ]],
                            [[         ,/'`--'...`--....        ;   ]],
                            [[              ;                    ;  ]],
                            [[          . '                       ; ]],
                            [[        .'     ..     ,      .       ;]],
                            [[       :       ::..  /      ;::.     |]],
                            [[      /      `.;::.  |       ;:..    ;]],
                            [[     :         |:.   :       ;:.    ; ]],
                            [[     :         ::     ;:..   |.    ;  ]],
                            [[      :       :;      :::....|     |  ]],
                            [[      /\     ,/ \      ;:::::;     ;  ]],
                            [[    .:. \:..|    :     ; '.--|     ;  ]],
                            [[   ::.  :''  `-.,,;     ;'   ;     ;  ]],
                            [[.-'. _.'\      / `;      \,__:      \ ]],
                            [[`---'    `----'   ;      /    \,.,,,/ ]],
                            [[                   `----`             ]],
                            [[                                      ]]
                        }

    alpha.setup(dashboard.opts)
  end,
}
