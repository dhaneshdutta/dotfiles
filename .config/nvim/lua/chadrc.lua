-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "ashes",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = {
    nvdash = {
      load_on_startup = true,

      header = {
      [[                                          _.oo. ]],
      [[                  _.u[[/;:,.         .odMMMMMM' ]],
      [[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
      [[              oN88888UU[[[/;::-.        dP^     ]],
      [[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
      [[            ,MMMMMMN888UU[[/;::-. o@^           ]],
      [[            NNMMMNN888UU[[[/~.o@P^              ]],
      [[            888888888UU[[[/o@^-..               ]],
      [[           oI8888UU[[[/o@P^:--..                ]],
      [[        .@^  YUU[[[/o@^;::---..                 ]],
      [[      oMP     ^/o@P^;:::---..                   ]],
      [[   .dMMM    .o@^ ^;::---...                     ]],
      [[  dMMMMMMM@^`       `^^^^                       ]],
      [[ YMMMUP^                                        ]],
      [[  ^^                                            ]],
      [[                                                ]],     
      },

      buttons = {
        { "  Find File", "Spc f f", "Telescope find_files" },
        { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
        { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
        { "  Bookmarks", "Spc m a", "Telescope marks" },
        { "  Themes", "Spc t h", "Telescope themes" },
        { "  Mappings", "Spc c h", "NvCheatsheet" },
      }
    }
}

return M
