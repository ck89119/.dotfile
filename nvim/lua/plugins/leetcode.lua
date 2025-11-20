return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- configuration goes here
    cn = { -- leetcode.cn
      enabled = true, ---@type boolean
      translator = true, ---@type boolean
      translate_problems = true, ---@type boolean
    },

    ---@type boolean
    image_support = true,

    injector = { ---@type table<lc.lang, lc.inject>
      ["cpp"] = {
        imports = function()
          -- return a different list to omit default imports
          return { "#include <bits/stdc++.h>", "using namespace std;" }
        end,
        after = "int main() {}",
      },
    },
  },
}
