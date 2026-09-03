--[[ vim.pack.add({"https://github.com/tiagovla/tokyodark.nvim"})
require("tokyodark").setup({
    -- transparent_background = true,
    gamma = 0.9,
    styles = {
        comments = { italic = true },
        keywords = { italic = false }, -- style for keywords
        identifiers = { italic = true }, -- style for identifiers
        functions = {},          -- style for functions
        variables = {},          -- style for variables
    },
})

vim.cmd("colorscheme tokyodark") ]]

vim.pack.add({"https://github.com/folke/tokyonight.nvim"})

require("tokyonight").setup({
    style = "night",
    on_colors = function(colors)
        colors.bg = "#161722"
        colors.bg_dark = "#0A0F28"
        colors.bg_dark1 = "#120E22"
        colors.bg_float = "#120E22"
    end
})

vim.pack.add({"https://github.com/dasupradyumna/midnight.nvim"})

-- vim.cmd("colorscheme midnight")

-- vim.api.nvim_set_hl(0, "NonText", { fg = "#905ab2" })

local colors = {
  bg = "#101313",
  mantle = "#101313",
  crust = "#101313",
  surface0 = "#202020",
  surface1 = "#404040",
  surface2 = "#eae1d6",
  fg = "#eae1d6",
  primary = "#f8c88f",
  secondary = "#387ccb",
  accent = "#11a8cd",
  cursor = "#404040",
  black = "#15141b",
  red = "#e06c75",
  green = "#98c379",
  yellow = "#ea9d49",
  blue = "#61afef",
  magenta = "#c678dd",
  cyan = "#56b6c2",
  white = "#abb2bf",
  bright_black = "#5c6370",
  bright_red = "#e06c75",
  bright_green = "#98c379",
  bright_yellow = "#f2b26c",
  bright_blue = "#61afef",
  bright_magenta = "#d9ade7",
  bright_cyan = "#56b6c2",
  bright_white = "#b7aca0",
}

vim.o.termguicolors = true
vim.g.colors_name = "colorterm"
vim.o.background = "dark"

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- UI
hl("Normal", { fg = colors.fg, bg = colors.bg })
hl("NormalFloat", { fg = colors.fg, bg = colors.mantle })
hl("FloatBorder", { fg = colors.surface2, bg = colors.mantle })
hl("Cursor", { fg = colors.bg, bg = colors.cursor })
hl("CursorLine", { bg = colors.surface0 })
hl("LineNr", { fg = colors.surface1 })
hl("CursorLineNr", { fg = colors.primary, bold = true })
hl("Comment", { fg = colors.bright_black, italic = true })
hl("Search", { fg = colors.bg, bg = colors.yellow })
hl("Visual", { bg = colors.surface1 })
hl("Pmenu", { fg = colors.fg, bg = colors.mantle })
hl("PmenuSel", { fg = colors.bg, bg = colors.primary })
hl("VertSplit", { fg = colors.crust, bg = colors.crust })
hl("StatusLine", { fg = colors.fg, bg = colors.mantle })
hl("StatusLineNC", { fg = colors.surface1, bg = colors.mantle })
hl("SignColumn", { bg = colors.bg })
hl("Folded", { fg = colors.blue, bg = colors.surface0 })
hl("EndOfBuffer", { fg = colors.bg })

-- Syntax Highlights
hl("Keyword", { fg = colors.magenta, bold = true })
hl("Function", { fg = colors.blue })
hl("String", { fg = colors.green })
hl("Number", { fg = colors.red })
hl("Type", { fg = colors.yellow })
hl("Operator", { fg = colors.cyan })
hl("Identifier", { fg = colors.cyan })
hl("Statement", { fg = colors.magenta })
hl("PreProc", { fg = colors.magenta })
hl("Constant", { fg = colors.accent })
hl("Special", { fg = colors.magenta })
hl("Todo", { fg = colors.bg, bg = colors.yellow, bold = true })
hl("Error", { fg = colors.red, bold = true })

-- Treesitter & LSP
hl("@keyword", { fg = colors.magenta, bold = true })
hl("@function", { fg = colors.blue })
hl("@string", { fg = colors.green })
hl("@variable", { fg = colors.fg })
hl("@variable.builtin", { fg = colors.red, italic = true })
hl("@property", { fg = colors.cyan })
hl("@parameter", { fg = colors.yellow, italic = true })
hl("@tag", { fg = colors.magenta })
hl("@tag.attribute", { fg = colors.blue, italic = true })
hl("@markup.heading", { fg = colors.blue, bold = true })
hl("@markup.link", { fg = colors.accent, underline = true })

-- LSP Diagnostics
hl("DiagnosticError", { fg = colors.red })
hl("DiagnosticWarn", { fg = colors.yellow })
hl("DiagnosticInfo", { fg = colors.blue })
hl("DiagnosticHint", { fg = colors.cyan })
hl("LspSignatureActiveParameter", { fg = colors.accent, bold = true })
hl("Directory", { fg = colors.cyan })
