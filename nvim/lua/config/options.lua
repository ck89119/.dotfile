-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = false -- Disable relative line numbers

-- 启用自动换行显示
opt.wrap = true

-- 在单词边界换行（可选，更美观）
opt.linebreak = true

-- 保持缩进（可选）
opt.breakindent = true
