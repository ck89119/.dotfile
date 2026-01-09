return {
  "saghen/blink.cmp",
  opts = {
    -- 核心配置：控制补全菜单的行为
    completion = {
      list = {
        selection = {
          -- 当为 true 时，在菜单中移动会自动将选中项插入到文本中（类似 YCM）
          auto_insert = true,
          -- 默认不选中第一项，直到你按下 Tab
          preselect = false,
        },
      },
      -- 自动显示补全菜单
      menu = { auto_show = true },
    },

    -- 快捷键设置
    keymap = {
      preset = "none", -- 禁用预设，完全自定义

      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },

      -- 模拟 YCM：回车只负责换行，不触发补全确认
      -- 如果你习惯回车确认，可以改为 { "accept", "fallback" }
      ["<CR>"] = { "fallback" },

      -- 即使在 auto_insert 模式下，有时也需要手动取消或显示
      ["<C-e>"] = { "hide" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    },

    -- 如果你还需要支持 Snippets (代码片段) 的 Tab 展开
    -- 注意：这可能会与 YCM 纯粹的 Tab 逻辑产生冲突，建议根据习惯开启
    snippets = {
      -- preset = "luasnip",
    },
  },
}
