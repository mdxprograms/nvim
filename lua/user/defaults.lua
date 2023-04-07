-- defaults
local g = vim.g
local HOME = os.getenv("HOME")
local set_options = require('user.helpers').set_options

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

-- default settings
set_options(
    {
        -- systematic
        backup = false,
        clipboard = "unnamedplus",
        completeopt = "menu,menuone,noselect",
        encoding = "utf-8",
        fileencoding = "utf-8",
        fileencodings = "utf-8",
        startofline = true,
        swapfile = false,
        undodir = HOME .. "/.config/nvim/undodir",
        undofile = true,
        updatetime = 50,
        -- buffer
        expandtab = true,
        shiftwidth = 2,
        softtabstop = 2,
        tabstop = 2,
        -- window
        number = true,
        relativenumber = true,
        termguicolors = true,
        -- editing
        backspace = 2,
        cmdheight = 2,
        errorbells = false,
        formatoptions = "cro",
        hidden = true,
        hlsearch = true,
        incsearch = true,
        scrolloff = 8,
        shortmess = "c",
        showmatch = false,
        showmode = false,
        smartcase = true,
        smartindent = true,
        splitbelow = true,
        splitright = true,
        wrap = false,
        shell = "/bin/sh"
    }
)

g.loaded_matchparen = true

-- rainbow brackets
g.rainbow_active = true

-- nerdspace
g.NERDSpaceDelims = true

-- indent guide
g.indent_guides_enable_on_vim_startup = true
g.indent_guides_start_level = 2
g.indent_guides_guide_size = 1

-- Javascript
g.svelte_preprocessors = { "typescript", "ts" }

-- coc_extensions
g.coc_global_extensions = {
    "coc-css",
    "coc-cssmodules",
    "coc-emmet",
    "coc-eslint",
    "coc-go",
    "coc-html",
    "coc-json",
    "coc-lua",
    "coc-marketplace",
    "coc-prettier",
    "coc-project",
    "coc-pyright",
    "coc-rls",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-svelte",
    "coc-tailwindcss",
    "coc-tsserver",
    "coc-yaml"
}

require("telescope").load_extension "file_browser"
